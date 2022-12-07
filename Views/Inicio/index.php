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

            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular" style="background-color:white;">
                <div class="row" style="background-color:white;">
                    <div class="col-lg-12">
                        <div class="heading-section" align="center">
                            <h4>Super ofertas</h4>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/1.jpg" alt="">
                                    <h4>Basurero acero inoxidable<br><span>Metálicos con pedal</span></h4>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/2.jpg" alt="">
                                    <h4>Paraguas reversibles<br><span>Sombrillas</span></h4>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/3.jpg" alt="">
                                    <h4>Ventilador de techo 30"<br><span>Ventiladores de techo</span></h4>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/4.jpg" alt="">
                                    <h4>Hervidora 1.7L taurus<br><span>Cafeteras y percoladores</span></h4>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/5.jpg" alt="">
                                    <h4>Bateria 55a 490 record<br><span>Automóvil</span></h4>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/6.jpg" alt="">
                                    <h4>Guía focos vintage<br><span>Lámparas para jardín</span></h4>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/7.jpg" alt="">
                                    <h4>Esmeril skill 4 1/2" 820W<br><span>Esmeriles</span></h4>
                                </div>
                            </div>

                            <div class="col-lg-3 col-sm-6">
                                <div class="item">
                                    <img src="<?php echo base_url; ?>Assets/images/8.jpg" alt="">
                                    <h4>Grama artificial en rollo<br><span>Plantas artificiales</span></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ***** Most Popular End ***** -->
        </div>
    </div>
</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->
<script src="<?php echo base_url; ?>Assets/custom-js/login.js"></script>
<?php include "Views/Template/footer.php" ?>