<?php
class AgregarProducto extends Controller
{
    public function __construct()
    {
        session_start();
        parent::__construct();
    }
    public function index()
    {
        $data['productos'] = $this->model->productos();
        $this->views->getView($this, "index", $data);
    }
    public function listar()
    {
        $data['detalle'] = $this->model->listarDetalle();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function agregar()
    {
        $id_producto = $_POST['cboProducto'];
        $cantidad = $_POST['txtCantidad'];

        $comprobar = $this->model->consultarDetalle($id_producto);
        if (empty($comprobar)) {
            $data = $this->model->registrarDetalle($id_producto, $cantidad);
            if ($data == "ok") {
                $msg = "ok";
            } else {
                $msg = "Error al guardar el registro!";
            }
        } else {
            $total_cantidad = $comprobar['cantidad'] + $cantidad;
            $data = $this->model->actualizarDetalle($total_cantidad, $id_producto);
            if ($data == "modificado") {
                $msg = "modificado";
            } else {
                $msg = "Error al actualizar el registro!";
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function delete(int $id)
    {
        $data = $this->model->deleteDetalle($id);
        if ($data == "ok") {
            $msg = "ok";
        } else {
            $msg = "error";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function registrarEntrada()
    {
        $recepcion = 0;
        //registro de recepcion o emcabezado principal
        $data = $this->model->registrarRecepcion(date("y-m-d"));
        //registro del detalle
        if ($data == "ok") {
            $detalle = $this->model->listarDetalle();
            $id_entrada = $this->model->id_recepcion();
            foreach ($detalle as $row) {
                $id_producto = $row['id_producto'];
                $cantidad = $row['cantidad'];
                $this->model->registrarDetalleEntrada($id_entrada['id'], $recepcion, $cantidad, $id_producto);
            }
            $vaciar = $this->model->vaciarDetalle();
            if ($vaciar == 'ok') {
                $msg = array('msg' => 'ok', 'ID_RECEPCION' => $id_entrada);
            }
        } else {
            $msg = $data;
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
}
