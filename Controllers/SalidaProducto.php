<?php
class SalidaProducto extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index()
    {
        $this->views->getView($this, "index");
    }
}