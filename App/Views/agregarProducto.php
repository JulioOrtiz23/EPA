    <!-- ***** Area de tabla start ***** -->

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-content">

                    <!-- ***** Details Start ***** -->

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="text-center"
                                    style="background-color: yellow; color:blue; border-radius: 16px;">INGRESO DE
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
        <table class="table table-bordered">
            <thead class="table-light">
                <input type="text" name="producto" placeholder="Nombre del producto">
                <input type="text" name="cantidad" placeholder="Cantidad" style="margin-left:60px">
                <br><br>
                <input type="dropzone" name="marca" placeholder="Marca del producto">
                <input type="text" name="categoria" placeholder="Categoria del producto" style="margin-left:60px">
                <a href="" class="btn btn-success" style="margin-left:60px">Agregar</a>
                <br><br>
                <tr>
                    <th class="text-center" scope="col">Nombre Producto</th>
                    <th class="text-center" scope="col">Marca</th>
                    <th class="text-center" scope="col">Cantidad</th>
                    <th class="text-center" scope="col">Categoria</th>
                    <th class="text-center" scope="col">Fecha de ingreso</th>
                    <th class="text-center" scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr class="table-primary">
                    <th class="text-center" scope="row">1</th>
                    <th class="text-center" scope="row">2</th>
                    <th class="text-center" scope="row">3</th>
                    <th class="text-center" scope="row">4</th>
                    <th class="text-center" scope="row">5</th>
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
        <div class="container">
            <a href="" class="btn btn-success">Ingresar Productos</a>
        </div>
    </div>

    <!-- ***** Area  de tabla End ***** -->