<?php include "Views/Template/header.php" ?>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-content">

                <!-- ***** Banner Start ***** -->
                <div class="main-banner">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text">
                                <!-- <h6></h6>
                                <h4><em></em></h4>
                                <div class="main-button mt-2">
                                    <a href="salidaProducto.html">Comprar</a>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->
            </div>
        </div>
    </div>
</div>
<?php echo $data; ?>
<div class="container">
    <div class="row">
        <div class="col-lg-12">

        <!-- Sección de Productos-->
            <div class="container">
                <div class="row">
                <div class="col-lg-12">
                    <div class="heading-section mt-5" align="center">
                        <h4 class="title">Super ofertas</h4>
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body rounded">
                                <img src="<?php echo base_url; ?>Assets/images/1.jpg" alt="">
                                <h5 class="card-title titulo-carta">Basurero acero inoxidable</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $25.00</h6>
                                <p class="card-text texto-carta">Metálicos con pedal</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/2.jpg" alt="">
                                <h5 class="card-title titulo-carta">Paraguas reversibles</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $10.00</h6>
                                <p class="card-text texto-carta">Sombrillas</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/3.jpg" alt="">
                                <h5 class="card-title titulo-carta">Ventilador de techo 30</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $50.00</h6>
                                <p class="card-text texto-carta">Ventiladores de techo</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Sección 2 de Productos-->
                <div class="row mt-5">
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/4.jpg" alt="">
                                <h5 class="card-title titulo-carta">Hervidora 1.7L taurus</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $50.00</h6>
                                <p class="card-text texto-carta">Cafeteras y percoladores</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/5.jpg" alt="">
                                <h5 class="card-title titulo-carta">Bateria 55a 490 record</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $50.00</h6>
                                <p class="card-text texto-carta">Automóvil</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/6.jpg" alt="">
                                <h5 class="card-title titulo-carta">Guía focos vintage</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $50.00</h6>
                                <p class="card-text texto-carta">Lámparas para jardín</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Sección 3 de Productos-->
                <div class="row mt-5">
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/7.jpg" alt="">
                                <h5 class="card-title titulo-carta">Esmeril skill 4 1/2" 820W</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $50.00</h6>
                                <p class="card-text texto-carta">Esmeriles</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card border-warning">
                            <div class="card-body">
                                <img src="<?php echo base_url; ?>Assets/images/8.jpg" alt="">
                                <h5 class="card-title titulo-carta">Grama artificial en rollo</h5>
                                <h6 class="card-subtitle mb-2 subtitulo-carta">Precio: $50.00</h6>
                                <p class="card-text texto-carta">Plantas artificiales</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->
<script src="<?php echo base_url; ?>Assets/custom-js/login.js"></script>
<?php include "Views/Template/footer.php" ?>