//entrada de categoria
function agregarCate(e) {
    e.preventDefault();
    const nomCat = document.getElementById("txtNomCategoria").value;
    if (nomCat) {
        const url = base_url + "Categoria/agregar";
        const frm = document.getElementById("frmCategoria");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //console.log(this.responseText);
                const rpt = JSON.parse(this.responseText);
                if (rpt == "ok") {
                    Swal.fire({
                        position: "top",
                        icon: "success",
                        title: "Categoria creada",
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    frm.reset();
                    tblDetalleCate.ajax.reload();
                } else if (rpt == "modificado") {
                    Swal.fire({
                        position: "top",
                        icon: "success",
                        title: "Categoria modificada",
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    frm.reset();
                    tblDetalleCate.ajax.reload();
                }
            }
        };
    }
}

// Listar Datos
let tblDetalleCate
document.addEventListener("DOMContentLoaded", function () {
    tblDetalleCate = $("#tblDetalleCate").DataTable({
        ajax: {
            url: base_url + "Categoria/listar",
            dataSrc: "",
        },
        columns: [
            { data: "ID_CATEGORIA" },
            { data: "NOMBRE_CATEGORIA" },
            { data: "ACCIONES" },
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
    });
});

//Modificar Categoria
function modificarCate(id){
    const url = base_url + "Categoria/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            document.getElementById('txtIdCategoria').value = rpt.ID_CATEGORIA;
            document.getElementById('txtNomCategoria').value = rpt.NOMBRE_CATEGORIA;
        }
    };
}

//Desactivar Categoria
function deleteCate(id) {
    Swal.fire({
        title: '¿Estas seguro que desea desactivar esta categoría?',
        text: 'Se desactivará esta categoría y no podrá ser utilizada',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: 'red',
        confirmButtonText: 'Desactivar',
        cancelButtonText: 'Cancelar'
    }).then((result)=>{
        if (result.isConfirmed){
            const url = base_url + "Categoria/delete/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    //console.log(this.responseText);
                    const rpt = JSON.parse(this.responseText);
                    if (rpt == "ok") {
                        Swal.fire({
                            position: "top",
                            icon: "success",
                            title: "Categoria desactivada",
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        tblDetalleCate.ajax.reload();
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
    })
}

//Activar Categoria
function activarCate(id) {
    Swal.fire({
        title: '¿Estas seguro que desea activar esta categoría?',
        text: 'La categoria se activará y podrá ser utilizada en el sistema',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: 'red',
        confirmButtonText: 'Activar',
        cancelButtonText: 'Cancelar'
    }).then((result)=>{
        if (result.isConfirmed){
            const url = base_url + "Categoria/activar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    //console.log(this.responseText);
                    const rpt = JSON.parse(this.responseText);
                    if (rpt == "ok") {
                        Swal.fire({
                            position: "top",
                            icon: "success",
                            title: "Categoria activada",
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        tblDetalleCate.ajax.reload();
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
    })
}