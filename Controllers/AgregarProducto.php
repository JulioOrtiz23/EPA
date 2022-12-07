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
        $this->views->getView($this, "index");
    }
    public function listar()
    {
        $data = $this->model->getProductos();
        
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
}