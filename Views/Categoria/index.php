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
		<table class="table table-bordered">
			<thead class="table-light">
				<input type="text" name="catNueva" placeholder="Categoria nueva">
				<a href="" class="btn btn-success" style="margin-left:60px">Ingrese Categoria</a>
				<br><br>
				<tr>
					<th class="text-center" scope="col">Id</th>
					<th class="text-center" scope="col">Nombre de Categoria</th>
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