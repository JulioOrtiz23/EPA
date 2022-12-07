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
		<div class="row">
			<div class="card w-100 ml-3 p-4">
				<h2 class="CRUDHeader ml-3 mb-4">Agregar</h2>
				<form id="frmMarca">
					<div class="form-row ml-2">
						<input type="hidden" class="form-control" id="txtIdMarca" name="txtIdMarca" placeholder="ID Marca" >
						<div class="col-md-3">
							<input type="text" class="form-control" id="txtNomMarca" name="txtNomMarca" placeholder="Nombre de Marca">
						</div>
						<div class="col">
							<button type="submit" class="btn btn-primary mb-2 ml-3" onclick="agregarMarca(event);">Enviar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<br><br>
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered table-sm mt-2 table-hover" id="tblDetalleMarca">
					<thead class="table-light">
						<tr>
							<th>ID Marca</th>
							<th>Nombre de Marca</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>

<?php include "Views/Template/script.php" ?>
<!-- colocar los js especificos para esta vista -->
<script src="<?php echo base_url; ?>Assets/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/DataTables/datatables.js" crossorigin="anonymous"></script>
<script src="<?php echo base_url; ?>Assets/custom-js/marca.js"></script>
<?php include "Views/Template/footer.php" ?>