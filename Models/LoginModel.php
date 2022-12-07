<?php
class LoginModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }
    public function getUsuarioLogin($usuario, $clave)
    {
        $sql = "SELECT * FROM usuarios WHERE LOGIN_USUARIO = '$usuario' AND CLAVE = '$clave'";
        $data = $this->select($sql);
        return $data;
    }
}