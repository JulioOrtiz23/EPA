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
    <div class="row">
        <div class="card w-100 ml-3 p-4 pb-5">
            <h2 class="CRUDHeader ml-3 mb-4">Agregar</h2>
            <form id="frmProduct">
                <div class="form-row ml-2">
                    <div class="col-md-4">
                        <select id="cboProducto" class="form-control" name="cboProducto">
                            <option>Seleccione un producto</option>
                            <?php foreach ($data['productos'] as $row) { ?>
                            <option value="<?php echo $row['ID_PRODUCTO'] ?>"><?php echo $row['NOMBRE_PRODUCTO'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="number" class="form-control" id="txtCantidad" name="txtCantidad" placeholder="Cantidad">
                    </div>
                    <div class="col ml-2">
                        <button class="btn btn-primary" type="button" onclick="agregarProd(event);">Agregar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <br><br>
    <div class="card">
        <div class="card-body">
            <table class="table table-bordered table-sm mt-2 table-hover">
                <thead class="table-light">
                    <tr>
                        <th>ID Producto</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody id="tblDetalle"></tbody>
            </table>
        </div>
    </div>

    <button class="btn btn-primary mt-5" type="button" onclick="generarEntrada();">Generar Recepción</button>
    
</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->
<script src="<?php echo base_url; ?>Assets/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/DataTables/datatables.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/custom-js/producto.js"></script>
<?php include "Views/Template/footer.php" ?>