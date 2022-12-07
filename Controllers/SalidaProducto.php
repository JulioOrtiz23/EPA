<?php
class SalidaProducto extends Controller
{
    public function __construct()
    {
        session_start();
        parent::__construct();
    }
    public function index()
    {
        $data['productos'] = $this->model->getProductos();
        $this->views->getView($this, "index", $data);
    }
    public function listar()
    {
        $data['detalle'] = $this->model->listarDetalleSalida();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function entrega()
    {
        $id_producto = $_POST['cboProducts'];
        $cantidad = $_POST['txtCantidadSalida'];

        $comprobar = $this->model->consultarDetalleSalida($id_producto);
        if (empty($comprobar)) {
            $data = $this->model->registrarDetalle($id_producto, $cantidad);
            if ($data == "ok") {
                $msg = "ok";
            } else {
                $msg = "Error al guardar el registro!";
            }
        } else {
            $total_cantidad = $comprobar['cantidad'] + $cantidad;
            $data = $this->model->actualizarDetalleSalida($total_cantidad, $id_producto);
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
        $data = $this->model->deleteDetalleSalida($id);
        if ($data == "ok") {
            $msg = "ok";
        } else {
            $msg = "error";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function registrarSalida()
    {
        
        $recepcion = 0;
        //registro de recepcion o emcabezado principal
        $data = $this->model->registrarSalida(date("y-m-d H:i:s"));
        //registro del detalle
        if ($data == "ok") {
            $detalle = $this->model->listarDetalleSalida();
            $id_salida = $this->model->id_salida();
            foreach ($detalle as $row) {
                $id_producto = $row['id_producto'];
                $cantidad = $row['cantidad'];
                $this->model->registrarDetalleSalida($id_salida['id'], $recepcion, $cantidad, $id_producto);
            }
            $vaciar = $this->model->vaciarDetalle();
            if ($vaciar == 'ok') {
                $msg = array('msg' => 'ok', 'ID_SALIDA' => $id_salida);
            }
        } else {
            $msg = $data;
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
}