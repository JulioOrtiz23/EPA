<?php
class AgregarProductoModel extends Query{
    
    public function __construct()
    {
        parent::__construct();
    }
    
    public function getProductos()
    {
        $sql = "SELECT * FROM v_producto";
        $data = $this->selectAll($sql);
        return $data;
    }
}