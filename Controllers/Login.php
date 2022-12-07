<?php
class Login extends Controller
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
    public function validar()
    {
        // print_r($_POST);
        if (empty($_POST['txtUser']) || empty($_POST['txtPass'])) {
            $msg = "Los campos estan vacios";
        } else {
            $usuario = $_POST['txtUser'];
            $clave = $_POST['txtPass'];
            //$hash = hash("SHA256", $clave);
            $data = $this->model->getUsuarioLogin($usuario, $clave);
            if ($data) {
                if ($data['ESTADO_USUARIO'] == 1){
                    $_SESSION['id'] = $data['ID_USUARIO'];
                    $_SESSION['user'] = $data['NOMBRE_USUARIO'];
                    $_SESSION['activo'] = true;
                    $msg = "ok";
                }
                else {
                    $msg = "Usuario inactivo";
                }
            } else {
                $msg = "Usuario o password incorrecto";
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function salir()
    {
        session_destroy();
        header("location: " . base_url);
    }
}
