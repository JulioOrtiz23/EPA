// entrada de producto
function agregarProd(e) {
    e.preventDefault();
    const cant = document.getElementById("txtCantidad").value;
    if (cant > 0) {
        const url = base_url + "AgregarProducto/agregar";
        const frm = document.getElementById("frmProduct");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // console.log(this.responseText);
                const rpt = JSON.parse(this.responseText);
                if (rpt == "ok") {
                    frm.reset();
                    listarDetalle();
                } else if (rpt == "modificado") {
                    frm.reset();
                    listarDetalle();
                }
            }
        };
    }
}

if (document.getElementById('tblDetalle')) {
    listarDetalle();
}
function listarDetalle() {
    const url = "http://localhost/Epa/AgregarProducto/listar";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            let html = "";
            rpt.detalle.forEach((row) => {
                html += `
            <tr>
            <td>${row["id_producto"]}</td>
            <td>${row["NOMBRE_PRODUCTO"]}</td>
            <td>${row["cantidad"]}</td>
            <td><button class="btn btn-danger btn-sm" onclick="deleteDetalle(${row["id_producto"]})"><i class="fas fa-trash-alt"></i></button></td>
            </tr>
            `;
            });
            document.getElementById("tblDetalle").innerHTML = html;
        }
    };
}

function deleteDetalle(id) {
    const url = base_url + "AgregarProducto/delete/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            if (rpt == "ok") {
                Swal.fire({
                    position: "top",
                    icon: "success",
                    title: "Producto eliminado",
                    showConfirmButton: false,
                    timer: 2000,
                });
                listarDetalle();
            } else {
                Swal.fire({
                    position: "top",
                    icon: "error",
                    title: rpt,
                    showConfirmButton: false,
                    timer: 2000,
                });
            }
        }
    };
}
function generarEntrada() {
    Swal.fire({
        title: "EPA",
        text: "Seguro de generar la entrada?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "AgregarProducto/registrarEntrada";
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // console.log(this.responseText);
                    const rpt = JSON.parse(this.responseText);
                    if (rpt.msg == "ok") {
                        Swal.fire("Listo!", "Entrada generada", "success");

                        listarDetalle();
                    } else {
                        Swal.fire("Error!", rpt, "error");
                    }
                }
            };
        }
    });
}
function anularRecepcion(){
    Swal.fire({
        title: "EPA",
        text: "Seguro de anular recepción?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "AgregarProducto/registrarEntrada";
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // console.log(this.responseText);
                    const rpt = JSON.parse(this.responseText);
                    if (rpt.msg == "ok") {
                        Swal.fire("Listo!", "Entrada generada", "success");

                        listarDetalle();
                    } else {
                        Swal.fire("Error!", rpt, "error");
                    }
                }
            };
        }
    });
}
// salida de producto*****************************************************
function salidaProd(e) {
    e.preventDefault();
    const cant = document.getElementById("txtCantidadSalida").value;
    if (cant > 0) {
        const url = base_url + "SalidaProducto/entrega";
        const frm = document.getElementById("frmProductos");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // console.log(this.responseText);
                const rpt = JSON.parse(this.responseText);
                if (rpt == "ok") {
                    frm.reset();
                    $('#cboProducts').val("-").trigger('change');
                    listarDetalleSalida();
                } else if (rpt == "modificado") {
                    frm.reset();
                    $('#cboProducts').val("-").trigger('change');
                    listarDetalleSalida();
                }
            }
        };
    }
}
if (document.getElementById('tblDetalleSalida')) {
    listarDetalleSalida();
}
function listarDetalleSalida() {
    const url = "http://localhost/Epa/SalidaProducto/listar";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            let html = "";
            rpt.detalle.forEach((row) => {
                html += `
            <tr>
            <td>${row["id_producto"]}</td>
            <td>${row["NOMBRE_PRODUCTO"]}</td>
            <td>${row["cantidad"]}</td>
            <td><button class="btn btn-danger btn-sm" onclick="deleteDetalleSalida(${row["id_producto"]})"><i class="fas fa-trash-alt"></i></button></td>
            </tr>
            `;
            });
            document.getElementById("tblDetalleSalida").innerHTML = html;
        }
    };
}
function deleteDetalleSalida(id) {
    const url = base_url + "SalidaProducto/delete/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            if (rpt == "ok") {
                Swal.fire({
                    position: "top",
                    icon: "success",
                    title: "Producto eliminado",
                    showConfirmButton: false,
                    timer: 2000,
                });
                listarDetalleSalida();
            } else {
                Swal.fire({
                    position: "top",
                    icon: "error",
                    title: rpt,
                    showConfirmButton: false,
                    timer: 2000,
                });
            }
        }
    };
}
function generarSalida() {
    Swal.fire({
        title: "EPA",
        text: "Seguro de generar la entrada?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "SalidaProducto/registrarSalida";
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // console.log(this.responseText);
                    const rpt = JSON.parse(this.responseText);
                    if (rpt.msg == "ok") {
                        Swal.fire("Listo!", "Salida generada", "success");

                        listarDetalleSalida();
                    } else {
                        Swal.fire("Error!", rpt, "error");
                    }
                }
            };
        }
    });
}