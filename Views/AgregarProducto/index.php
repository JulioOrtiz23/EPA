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
                            <h1 class="text-center" style="background-color: yellow; color:blue; border-radius: 16px;">
                                INGRESO DE
                                PRODUCTOS</h1>
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
    <input type="text" name="producto" placeholder="Nombre del producto">
    <input type="text" name="cantidad" placeholder="Cantidad" style="margin-left:60px">
    <br><br>
    <input type="dropzone" name="marca" placeholder="Marca del producto">
    <input type="text" name="categoria" placeholder="Categoria del producto" style="margin-left:60px">
    <a href="" class="btn btn-success" style="margin-left:60px">Agregar</a>
    <br><br>
    <div class="card">
        <div class="card-body">
            <table class="table table-bordered table-sm mt-2 table-hover" id="tblProducto">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Producto</th>
                        <th>Descripción</th>
                        <th>Categoria</th>
                        <th>Marca</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="container">
        <a href="" class="btn btn-success">Ingresar Productos</a>
    </div>
</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->
<script src="<?php echo base_url; ?>Assets/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/DataTables/datatables.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/custom-js/producto.js"></script>
<?php include "Views/Template/footer.php" ?>