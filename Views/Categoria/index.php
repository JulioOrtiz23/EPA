<?php include "Views/Template/header.php" ?>
	<!-- ***** Area de tabla start ***** -->

	<div class="container-sm">
		<div class="page-content">
			<!-- ***** Details Start ***** -->
			<h1 class="text-center" style="background-color: yellow; color:blue; border-radius: 16px;">LISTADO DE
				CATEGORIA</h1>
			<!-- ***** Details End ***** -->
		</div>
	</div>

	<br>

	<div class="container">
		<div class="row">
			<div class="card w-100 ml-3 p-4">
				<h2 class="CRUDHeader ml-3 mb-4">Agregar</h2>
				<form id="frmCategoria">
					<div class="form-row ml-2">
						<input type="hidden" class="form-control" id="txtIdCategoria" name="txtIdCategoria" placeholder="ID Categoria" >
						<div class="col-md-3">
							<input type="text" class="form-control" id="txtNomCategoria" name="txtNomCategoria" placeholder="Nombre de Categoría">
						</div>
						<div class="col">
							<button type="submit" class="btn btn-primary mb-2 ml-3" onclick="agregarCate(event);">Enviar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<br><br>
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered table-sm mt-2 table-hover" id="tblDetalleCate">
					<thead class="table-light">
						<tr>
							<th>ID Categoria</th>
							<th>Nombre de Categoria</th>
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
<script src="<?php echo base_url; ?>Assets/custom-js/categoria.js"></script>
<?php include "Views/Template/footer.php" ?>