<?php
class CategoriaModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }

    public function categorias()
    {
        $sql = "SELECT * FROM categoria";
        $data = $this->selectAll($sql);
        return $data;
    }

    public function consultarDetalle(string $nombreCategoria)
    {
        $this->nombreCategoria = $nombreCategoria;
        $sql = "SELECT * FROM categoria WHERE NOMBRE_CATEGORIA like '%$nombreCategoria%'";
        $data = $this->select($sql);
        return $data;
    }

    public function registrarCategoria($nombreCategoria)
    {
        $tipo = 1;
        $observacion = "-";
        $sql = "CALL PRAL_MTTO_CATEGORIA (?,?,?)";
        //$sql = "INSERT INTO recepcion_producto (FECHA_RECEPCION) VALUES (?)";
        $datos = array($tipo, 0, $nombreCategoria);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = $data;
        }
        return $rpt;
    }

    public function listarDetalle()
    {
        $sql = "SELECT * FROM categoria c";
        $data = $this->selectAll($sql);
        return $data;
    }

    public function BuscarCategoria(int $id)
    {
        $sql = "SELECT * FROM categoria c where c.ID_CATEGORIA = $id";
        $data = $this->select($sql);
        return $data;
    }

    public function modificarCategoria($id,$nombre_categoria)
    {
        $sql = "UPDATE categoria SET NOMBRE_CATEGORIA = ? WHERE ID_CATEGORIA = ?";
        $datos = array($nombre_categoria,$id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "modificado";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }


    public function deleteCategoria($id)
    {
        $sql = "UPDATE categoria SET ESTADO = 0 WHERE ID_CATEGORIA = ?";
        $datos = array($id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }

    public function activarCategoria($id)
    {
        $sql = "UPDATE categoria SET ESTADO = 1 WHERE ID_CATEGORIA = ?";
        $datos = array($id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }
}
