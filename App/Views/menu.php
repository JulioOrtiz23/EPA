<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="../Public/index.php" class="logo">
                        <img src="../Web/images/Logo_EPA.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                        <form id="search" action="#">
                            <input type="text" placeholder="Buscar" id='searchText' name="searchKeyword"
                                onkeypress="handle" />
                            <i class="fa fa-search"></i>
                        </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->

                    <ul class="nav">
                        <li><a class="btn btn-light" href="../Public/index.php">Inicio</a></li>

                        <div class="btn-group">
                            <button class="btn btn-sm dropdown-toggle" data-toggle="dropdown"
                                id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                                Productos
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"
                                onclick="javascript:console.log( $(event.target).data('mode'))">
                                <a class="dropdown-item" href="../Public/agregarProducto.php" data-mode="mode1"
                                    data-dir="/home">Ingreso de producto</a>
                                <a class="dropdown-item " href="../Public/salidaProducto.php" data-mode="mode2"
                                    data-dir="/foo">Salida de produccto</a>
                                <a class="dropdown-item " href="../Public/categoria.php" data-mode="mode2"
                                    data-dir="/bar">Categoria</a>
                                <a class="dropdown-item " href="../Public/marca.php" data-mode="mode2" data-dir="/">Marca</a>
                            </div>
                        </div>

                        <div class="btn-group">
                            <button class="btn btn-sm dropdown-toggle" data-toggle="dropdown"
                                id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
                                Reportes
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"
                                onclick="javascript:console.log( $(event.target).data('mode'))">
                                <a class="dropdown-item" href="../Public/reporteIngresoProducto.php" data-mode="mode1"
                                    data-dir="/home">Reporte de Ingreso</a>
                                <a class="dropdown-item " href="../Public/reporteSalidaProducto.php" data-mode="mode2"
                                    data-dir="/foo">Reporte de salida</a>
                            </div>
                        </div>

                        <br>

                        <div class="dropdown show">
                            <a style="margin-left:60px" class="btn btn-primary dropdown-toggle" href="#"
                                role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                Iniciar de Sesión
                            </a>
                            <div class="dropdown-menu">
                                <form class="px-4 py-3">
                                    <div class="form-group">
                                        <label for="exampleDropdownFormEmail1">Correo electrónico</label>
                                        <input type="email" class="form-control" id="exampleDropdownFormEmail1"
                                            placeholder="email@example.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleDropdownFormPassword1">Contraseña</label>
                                        <input type="password" class="form-control"
                                            id="exampleDropdownFormPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="dropdownCheck">
                                        <label class="form-check-label" for="dropdownCheck">
                                            Recuérdame
                                        </label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                                </form>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="creacionUsuario.html">¿Nuevo por aquí?
                                    Inscribirse</a>
                            </div>
                        </div>
                    </ul>


                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->