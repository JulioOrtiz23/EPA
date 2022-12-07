<?php
class Marca extends Controller
{
    public function __construct()
    {
        session_start();
        parent::__construct();
    }
    public function index()
    {
        $data['marcas'] = $this->model->marcas();
        $this->views->getView($this, "index", $data);
    }

    public function listar()
    {
        $data = $this->model->listarDetalle();
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['ESTADO'] == 1) {
                $data[$i]['ACCIONES'] = '<div>
                    <button class="btn btn-warning btn-sm" type="button" onclick="modificarMarca(' . $data[$i]['ID_MARCA'] . ');"><i class="fas fa-pencil-alt"></i></button>
                    <button class="btn btn-danger btn-sm" type="button" onclick="deleteMarca(' . $data[$i]['ID_MARCA'] . ');"><i class="fas fa-ban"></i></button>
                    </div>';
            } else {
                $data[$i]['ACCIONES'] = '<div>
                    <button class="btn btn-success btn-sm" type="button" onclick="activarMarca(' . $data[$i]['ID_MARCA'] . ');"><i class="fas fa-check-circle"></i></button>
                    </div>';
            }
        }

        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function agregar()
    {
        $id = $_POST['txtIdMarca'];
        $nombreMarca = $_POST['txtNomMarca'];

        if ($id == ''){
            $data = $this->model->registrarMarca($nombreMarca);
            if ($data == "ok") {
                $msg = "ok";
            } else {
                $msg = "Error al guardar el registro!";
            }
        } else {
            $data = $this->model->modificarMarca($id,$nombreMarca);
            if ($data == "modificado") {
                $msg = "modificado";
            } else {
                $msg = "Error al actualizar el registro!";
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function editar(int $id){
        $data = $this->model->BuscarMarca($id);

        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function delete(int $id)
    {
        $data = $this->model->deleteMarca($id);
        if ($data == "ok") {
            $msg = "ok";
        } else {
            $msg = "error";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();        
    }

    public function activar(int $id)
    {
        $data = $this->model->activarMarca($id);
        if ($data == "ok") {
            $msg = "ok";
        } else {
            $msg = "error";
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();        
    }

}