<?php
class AgregarProductoModel extends Query
{
  public function __construct()
  {
    parent::__construct();
  }
  public function productos()
  {
    $sql = "SELECT * FROM producto";
    $data = $this->selectAll($sql);
    return $data;
  }
  //proceso de detalle preliminar
  public function registrarDetalle($id_producto, $cantidad)
  {
    $sql = "INSERT INTO detalle_entrada (id_producto, cantidad) VALUES (?,?)";
    $datos = array($id_producto, $cantidad);
    $data = $this->save($sql, $datos);
    if ($data == 1) {
      $rpt = "ok";
    } else {
      $rpt = "error";
    }
    return $rpt;
  }
  public function consultarDetalle(int $id_producto)
  {
    $this->id_producto = $id_producto;
    $sql = "SELECT * FROM detalle_entrada WHERE id_producto = $id_producto";
    $data = $this->select($sql);
    return $data;
  }
  public function actualizarDetalle($total_cantidad, $id_producto)
  {
    $sql = "UPDATE detalle_entrada SET cantidad = ? WHERE id_producto = ?";
    $datos = array($total_cantidad, $id_producto);
    $data = $this->save($sql, $datos);
    if ($data == 1) {
      $rpt = "modificado";
    } else {
      $rpt = "error";
    }
    return $rpt;
  }
  public function listarDetalle()
  {
    $sql = "SELECT * FROM detalle_entrada d inner join producto p on d.id_producto = p.ID_PRODUCTO";
    $data = $this->selectAll($sql);
    return $data;
  }
  public function deleteDetalle(int $id)
  {
    $this->id = $id;
    $sql = "DELETE FROM detalle_entrada WHERE id_producto = ?";
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
  public function registrarRecepcion($fecha)
    {
      $tipo = 1;
      $observacion = "-";
      $sql = "CALL PRAL_MTTO_RECEPCION_PRODUCTO (?,?,?)";
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
  public function id_recepcion()
  {
    $sql = "SELECT MAX(ID_RECEPCION) as id FROM recepcion_producto";
    $data = $this->select($sql);
    return $data;
  }
  public function registrarDetalleEntrada(int $id_entrada, $recepcion, int $cantidad, int $id_producto )
  {
    $this->id_entrada = $id_entrada;
    $this->id_producto = $id_producto;
    $this->cantidad = $cantidad;
    $sql = "CALL PRAL_MTTO_RECEPCION_PRODUCTO_DETA (?,?,?,?,?)";
    $datos = array(1, $this->id_entrada, $recepcion, $this->cantidad, $this->id_producto);
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
    $sql = "DELETE FROM detalle_entrada";
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
