<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Fonts from Google -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <!-- Local CSS -->
    <link rel="stylesheet" href="<?php echo base_url; ?>Assets/css/fontawesome.css">
    <link rel="stylesheet" href="<?php echo base_url; ?>Assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="<?php echo base_url; ?>Assets/css/owl.css">
    <link rel="stylesheet" href="<?php echo base_url; ?>Assets/css/animate.css">
    <link href="<?php echo base_url; ?>Assets/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link href="<?php echo base_url; ?>Assets/DataTables/datatables.css" rel="stylesheet" />
    <!-- Otros CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <!-- Pagina CSS -->
    <link rel="stylesheet" href="<?php echo base_url; ?>Assets/css/style.css">
    <title>EPA</title>
</head>

<body>

    <!-- ***** NEW HEADER AREA START ***** -->
    <header class="header-area header-sticky">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light space">
                <!--LOGO-->
                <a href="<?php echo base_url; ?>">
                    <img class="image-size" src="<?php echo base_url; ?>Assets/images/Logo_EPA.png" alt=""> |
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control sm-4" type="search" placeholder="Buscar" aria-label="Buscar">
                    <button class="btn btn-warning ml-3 my-2 my-sm-0" type="submit">Buscar</button>
                </form>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-5 mr-auto">
                        <li>
                            <a class="btn btn-light ml-5" href="<?php echo base_url; ?>">Inicio</a>
                        </li>
                        <!-- falta la etiqueta li para estos dos dropdawn -->
                        <?php if (empty($_SESSION['activo'])) { ?>
                            <div class="dropdown show">
                                <a class="btn btn-primary dropdown-toggle ml-5" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Iniciar Sesión
                                </a>
                                <div class="dropdown-menu">
                                    <form class="px-4 py-3" id="frmLogin">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="txtUser" name="txtUser" placeholder="Usuario">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="txtPass" name="txtPass" placeholder="Password">
                                        </div>
                                        <button type="button" class="btn btn-info form-control" onclick="Login(event);">Ingresar</button>
                                    </form>
                                </div>
                            </div>
                        <?php } else { ?>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                                    Productos
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton" onclick="javascript:console.log( $(event.target).data('mode'))">
                                    <a class="dropdown-item" href="<?php echo base_url; ?>AgregarProducto" data-mode="mode1" data-dir="/home">Ingreso de producto</a>
                                    <a class="dropdown-item " href="<?php echo base_url; ?>SalidaProducto" data-mode="mode2" data-dir="/foo">Salida de produccto</a>
                                    <a class="dropdown-item " href="<?php echo base_url; ?>Categoria" data-mode="mode2" data-dir="/bar">Categoria</a>
                                    <a class="dropdown-item " href="<?php echo base_url; ?>Marca" data-mode="mode2" data-dir="/">Marca</a>
                                </div>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                                    Reportes
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton" onclick="javascript:console.log( $(event.target).data('mode'))">
                                    <a class="dropdown-item" href="reporteIngresoProducto.html" data-mode="mode1" data-dir="/home">Reporte de Ingreso</a>
                                    <a class="dropdown-item " href="reporteSalidaProducto.html" data-mode="mode2" data-dir="/foo">Reporte de salida</a>
                                </div>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link active" data-toggle="dropdown" href="">
                                    <span class="dropdown-toggle"> <?php echo $_SESSION['user']; ?> </span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item text-danger" href="<?php echo base_url; ?>Login/salir" class="d-block"><i class="fas fa-sign-out-alt"></i> Salir</a>
                                </div>
                            </li>
                        <?php } ?>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- ***** NEW HEADER AREA END ***** -->