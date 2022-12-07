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
                                Reporte de recepciones</h1>
                        </div>
                    </div>
                </div>
                <!-- ***** Details End ***** -->
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card mt-5 pb-3">
                <div class="card-body">
                    <div class="form-group">
                        <a class="btn btn-primary mt-3 mb-5" href="<?php echo base_url; ?>ReporteProductos/generarPdf"><i class="fas fa-file-pdf"></i> Imprimir Reporte</a>
                    </div>
                    <table class="table table-light table-hover table-sm" id="tblRecepcion">
                        <thead class="thead-light">
                            <tr>
                                <th>Recepción</th>
                                <th>Fecha</th>
                                <th>Estado</th>
                                <th>ID</th>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Categoría</th>
                                <th>Marca</th>
                                <th></th>
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
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->
<script src="<?php echo base_url; ?>Assets/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/DataTables/datatables.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/custom-js/reporte.js"></script>
<?php include "Views/Template/footer.php" ?>