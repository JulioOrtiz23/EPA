<?php
class SalidaProductoModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }
    public function getProductos()
    {
        $sql = "SELECT * FROM producto";
        $data = $this->selectAll($sql);
        return $data;
    }
    //proceso de detalle preliminar
    public function registrarDetalle($id_producto, $cantidad)
    {
        $sql = "INSERT INTO detalle_salida (id_producto, cantidad) VALUES (?,?)";
        $datos = array($id_producto, $cantidad);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }
    public function consultarDetalleSalida(int $id_producto)
    {
        $this->id_producto = $id_producto;
        $sql = "SELECT * FROM detalle_salida WHERE id_producto = $id_producto";
        $data = $this->select($sql);
        return $data;
    }
    public function actualizarDetalleSalida($total_cantidad, $id_producto)
    {
        $sql = "UPDATE detalle_salida SET cantidad = ? WHERE id_producto = ?";
        $datos = array($total_cantidad, $id_producto);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "modificado";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }
    public function listarDetalleSalida()
    {
        $sql = "SELECT * FROM detalle_salida d inner join producto p on d.id_producto = p.ID_PRODUCTO";
        $data = $this->selectAll($sql);
        return $data;
    }
    public function deleteDetalleSalida(int $id)
    {
        $this->id = $id;
        $sql = "DELETE FROM detalle_salida WHERE id_producto = ?";
        $datos = array($this->id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }
    //end proceso preliminar
    //registro oficial
    public function registrarSalida($fecha)
    {
        $tipo = 1;
        $observacion = "-";
        $sql = "CALL PRAL_MTTO_SALIDA_PRODUCTO (?,?,?)";
        //$sql = "INSERT INTO recepcion_producto (FECHA_RECEPCION) VALUES (?)";
        $datos = array($tipo, $fecha, $observacion);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = $data;
        }
        return $rpt;
    }
    public function id_salida()
    {
        $sql = "SELECT MAX(ID_SALIDA) as id FROM salida_productos";
        $data = $this->select($sql);
        return $data;
    }
    public function registrarDetalleSalida(int $id_salida, $recepcion, int $cantidad, int $id_producto)
    {
        $this->id_salida = $id_salida;
        $this->id_producto = $id_producto;
        $this->cantidad = $cantidad;
        $sql = "CALL PRAL_MTTO_SALIDA_PRODUCTO_DETA (?,?,?,?,?)";
        $datos = array(1, $this->id_salida, $recepcion, $this->cantidad, $this->id_producto);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = $data;
        }
        return $rpt;
    }
    public function vaciarDetalle()
    {
        $sql = "DELETE FROM detalle_salida";
        $datos = array();
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }
}
