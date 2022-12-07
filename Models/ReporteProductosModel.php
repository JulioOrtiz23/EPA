<?php
class ReporteProductosModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }
    public function detalleRecepcion(){
        $sql = "SELECT * FROM view_recepcion";
        $data = $this->selectAll($sql);
        return $data;
    }
    public function detalleEntrega(){
        $sql = "SELECT * FROM view_entrega";
        $data = $this->selectAll($sql);
        return $data;
    }
    public function detalleProductos(){
        $sql = "SELECT * FROM v_producto";
        $data = $this->selectAll($sql);
        return $data;
    }
}