let tblProducto;
//verificamos si se cargo datos
document.addEventListener("DOMContentLoaded", function () {
    tblProducto = $("#tblProducto").DataTable({
        ajax: {
            url: base_url + "AgregarProducto/listar",
            dataSrc: "",
        },
        columns: [
            { data: "ID_PRODUCTO" },
            { data: "NOMBRE_PRODUCTO" },
            { data: "DESCRIPCION" },
            { data: "NOMBRE_CATEGORIA" },
            { data: "NOMBRE_MARCA" },
            {"defaultContent": "<button type='button' class='btn btn-warning btn-sm'><i class='fa fa-pencil'></i></button>" +
                                " <button type='button' class='btn btn-danger btn-sm'><i class='fa fa-trash'></i></button>"}
        ],
        //esta parte cambia el idioma de la tabla parte informativa
        language: {
            url: "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json",
        },
        //el dom es la parte de los botones superiores y filtro de registros
        dom:
            "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-5'i><'col-sm-7'p>>",
        //esta parte es para dar formato personalizado a los botones
        buttons: [
            {
                //Botón para Excel
                extend: "excelHtml5",
                footer: true,
                title: "Archivo",
                filename: "Export_File",

                //Aquí es donde generas el botón personalizado
                text: '<span class="badge badge-success"><i class="fas fa-file-excel"></i></span>',
            },
            //Botón para PDF
            {
                extend: "pdfHtml5",
                download: "open",
                footer: true,
                title: "Reporte de usuarios",
                filename: "Reporte de usuarios",
                text: '<span class="badge  badge-danger"><i class="fas fa-file-pdf"></i></span>',
                exportOptions: {
                    columns: [0, ":visible"],
                },
            },
            //Botón para copiar
            {
                extend: "copyHtml5",
                footer: true,
                title: "Reporte de usuarios",
                filename: "Reporte de usuarios",
                text: '<span class="badge  badge-primary"><i class="fas fa-copy"></i></span>',
                exportOptions: {
                    columns: [0, ":visible"],
                },
            },
            //Botón para print
            {
                extend: "print",
                footer: true,
                filename: "Export_File_print",
                text: '<span class="badge badge-light"><i class="fas fa-print"></i></span>',
            },
            //Botón para cvs
            {
                extend: "csvHtml5",
                footer: true,
                filename: "Export_File_csv",
                text: '<span class="badge  badge-success"><i class="fas fa-file-csv"></i></span>',
            },
            {
                //esta parte es un filtro que oculta o muestra columnas de la tabla
                extend: "colvis",
                text: '<span class="badge  badge-info"><i class="fas fa-columns"></i></span>',
                postfixButtons: ["colvisRestore"],
            },
        ],
        // "sScrollX": "100%",
        // "sScrollXInner": "110%",
        // "bScrollCollapse": true
    });
});

//boton agregar usuario
function frmUser() {
    document.getElementById("modal_title").innerHTML = "Nuevo Usuario";
    document.getElementById("btnAccion").innerHTML = "Registrar";
    //receteamos el form para que no se llene con la istruccion de editar
    document.getElementById("claves").classList.remove("d-none");
    document.getElementById("frmUser").reset();
    $("#modal_user").modal("show");
    //limpiamos el id por si antes se realizo una modificacion de resgistro para que ete vacio al insertar
    document.getElementById("id").value = "";
}

function registrarUser(e) {
    e.preventDefault();

    const user = document.getElementById('txtUser');
    const pass = document.getElementById('txtPass');
    const confirmar = document.getElementById('txtConfirmar');
    const rol = document.getElementById('cboRol');
    if (user.value == "") {
        Swal.fire({
            position: 'top',
            icon: 'warning',
            title: 'Aviso',
            text: 'Debe completar el campo marcado',
            showConfirmButton: false,
            timer: 2500
        });
        user.classList.add("is-invalid");
        user.focus();
    } else {
        const url = base_url + "Usuarios/registrar";
        const frm = document.getElementById("frmUser");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // console.log(this.responseText);
                const rpt = JSON.parse(this.responseText);
                //si la respuesta es si hara un registro nuevo
                if (rpt == "si") {
                    Swal.fire({
                        position: "top",
                        icon: "success",
                        title: 'Aviso',
                        text: "Registro agregado con éxito!",
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    frm.reset();
                    $("#modal_user").modal("hide");
                    tblUsuarios.ajax.reload();
                }
                //si la respuesta es modificado hara una actualizacion de la informacion
                else if (rpt == "update") {
                    Swal.fire({
                        position: "top",
                        icon: "success",
                        title: 'Aviso',
                        text: "Registro actualizado con éxito!",
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    $("#modal_user").modal("hide");
                    tblUsuarios.ajax.reload();
                } else {
                    Swal.fire({
                        position: "top",
                        icon: "error",
                        title: 'Aviso',
                        text: rpt,
                        showConfirmButton: false,
                        timer: 2000,
                    });
                }
            }
        };
    }
}
function btnEditarUsuario(id) {
    document.getElementById("modal_title").innerHTML = "Actualizar Usuario";
    document.getElementById("btnAccion").innerHTML = "Actualizar";

    //con la concatenacion del id se recupera para poder realizar la actualizacion
    const url = base_url + "Usuarios/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            document.getElementById("id").value = rpt.id;
            document.getElementById('txtUser').value = rpt.user;
            document.getElementById('cboRol').value = rpt.id_rol;
            //se oculta el div con id claves mediante el agregado de display none > d-none
            document.getElementById("claves").classList.add("d-none");

            $("#modal_user").modal("show");
        }
    };
}
function btnEliminarUsuario(id) {
    Swal.fire({
        title: "Aviso",
        text: "El usuario sera desactivado y no se podrá utilizar en este estado",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Usuarios/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const rpt = JSON.parse(this.responseText);
                    if (rpt == "ok") {
                        Swal.fire("Listo!", "Usuario desactivado.", "success");
                        tblUsuarios.ajax.reload();
                    } else {
                        Swal.fire("Error!", rpt, "error");
                    }
                }
            };
        }
    });
}
function btnActivarUsuario(id) {
    Swal.fire({
        title: "Aviso",
        text: "El usuario sera activado nuevamente",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Usuarios/activar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const rpt = JSON.parse(this.responseText);
                    if (rpt == "ok") {
                        Swal.fire("Listo!", "Usuario activado!.", "success");
                        tblUsuarios.ajax.reload();
                    } else {
                        Swal.fire("Error!", rpt, "error");
                    }
                }
            };
        }
    });
}
function frmPass(e) {
    e.preventDefault();
    const antigua = document.getElementById("clave_actual").value;
    const nueva = document.getElementById("clave_nueva").value;
    const confirmar = document.getElementById("confirmar_clave").value;

    if (antigua == "" || nueva == "" || confirmar == "") {
        Swal.fire("POS VENTA", "Debe llenar todos los campos", "warning");
    } else if (nueva != confirmar) {
        Swal.fire("POS VENTA", "La nueva contraseña no coincide", "warning");
    } else {
        const url = base_url + "Usuarios/cambiarPass";
        const frm = document.getElementById("frmPass");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const rpt = JSON.parse(this.responseText);

                if (rpt == "ok") {
                    Swal.fire({
                        position: "top",
                        icon: "success",
                        title: "Cambio realizado con exito!",
                        showConfirmButton: false,
                        timer: 2000,
                    });

                    $("#cambiar_pass").modal("hide");
                    frm.reset();
                } else {
                    Swal.fire("POS VENTA", rpt, "error");
                }
            }
        };
    }
}