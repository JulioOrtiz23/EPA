<?php
class MarcaModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }

    public function marcas()
    {
        $sql = "SELECT * FROM marca";
        $data = $this->selectAll($sql);
        return $data;
    }

    public function consultarDetalle(string $nombreMarca)
    {
        $this->nombreMarca = $nombreMarca;
        $sql = "SELECT * FROM marca WHERE NOMBRE_MARCA like '%$nombreMarca%'";
        $data = $this->select($sql);
        return $data;
    }

    public function registrarMarca($nombreMarca)
    {
        $tipo = 1;
        $observacion = "-";
        $sql = "CALL PRAL_MTTO_MARCA (?,?,?)";
        //$sql = "INSERT INTO recepcion_producto (FECHA_RECEPCION) VALUES (?)";
        $datos = array($tipo,0,$nombreMarca);
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
        $sql = "SELECT * FROM marca m";
        $data = $this->selectAll($sql);
        return $data;
    }


    public function BuscarMarca(int $id)
    {
        $sql = "SELECT * FROM marca m where m.ID_MARCA = $id";
        $data = $this->select($sql);
        return $data;
    }

    public function modificarMarca($id,$nombre_marca)
    {
        $sql = "UPDATE marca SET NOMBRE_MARCA = ? WHERE ID_MARCA = ?";
        $datos = array($nombre_marca,$id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "modificado";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }


    public function deleteMarca($id)
    {
        $sql = "UPDATE marca SET ESTADO = 0 WHERE ID_MARCA = ?";
        $datos = array($id);
        $data = $this->save($sql, $datos);
        if ($data == 1) {
            $rpt = "ok";
        } else {
            $rpt = "error";
        }
        return $rpt;
    }

    public function activarMarca($id)
    {
        $sql = "UPDATE marca SET ESTADO = 1 WHERE ID_MARCA = ?";
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
