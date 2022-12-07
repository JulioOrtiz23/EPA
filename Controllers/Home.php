<?php
class Home extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index()
    {
        session_start();
        if (!empty($_SESSION['activo'])) {
            header("location: " . base_url."Inicio");
        }
        $this->views->getView($this, "index");
    }
}
