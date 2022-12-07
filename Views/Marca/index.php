<?php include "Views/Template/header.php" ?>

<!-- ***** Area de tabla start ***** -->

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-content">
                <!-- ***** Details Start ***** -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="text-center" style="background-color: yellow; color:blue; border-radius: 8px;">
                                LISTADO DE MARCAS
                            </h1>
                        </div>
                    </div>
                </div>
                <!-- ***** Details End ***** -->
            </div>
        </div>
    </div>
</div>

<br>

<div class="container">
    <table class="table table-bordered">
        <thead class="table-light">
            <input type="text" name="marcaNueva" placeholder="Marca nueva">
            <a href="" class="btn btn-success" style="margin-left:60px">Ingrese Marca</a>
            <br><br>
            <tr>
                <th class="text-center" scope="col">Id</th>
                <th class="text-center" scope="col">Nombre de Marca</th>
                <th class="text-center" scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <tr class="table-primary">
                <th class="text-center" scope="row">1</th>
                <th class="text-center" scope="row">2</th>
                <th class="text-center">
                    <a class="btn btn-warning" href="" aria-label="Edit">
                        <i class="fa fa-pencil" aria-hidden="true"></i>
                    </a>
                    <a class="btn btn-danger" href="" aria-label="Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                    </a>
                </th>
            </tr>
        </tbody>
    </table>
</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->

<?php include "Views/Template/footer.php" ?>