//entrada de marca
function agregarMarca(e) {
    e.preventDefault();
    const nomCat = document.getElementById("txtNomMarca").value;
    if (nomCat) {
        const url = base_url + "Marca/agregar";
        const frm = document.getElementById("frmMarca");
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
                        title: "Marca creada",
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    frm.reset();
                    tblDetalleMarca.ajax.reload();
                } else if (rpt == "modificado") {
                    Swal.fire({
                        position: "top",
                        icon: "success",
                        title: "Marca modificada",
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    frm.reset();
                    tblDetalleMarca.ajax.reload();
                }
            }
        };
    }
}

// Listar Datos
let tblDetalleMarca
document.addEventListener("DOMContentLoaded", function () {
    tblDetalleMarca = $("#tblDetalleMarca").DataTable({
        ajax: {
            url: base_url + "Marca/listar",
            dataSrc: "",
        },
        columns: [
            { data: "ID_MARCA" },
            { data: "NOMBRE_MARCA" },
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

//Modificar Marca
function modificarMarca(id){
    const url = base_url + "Marca/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // console.log(this.responseText);
            const rpt = JSON.parse(this.responseText);
            document.getElementById('txtIdMarca').value = rpt.ID_MARCA;
            document.getElementById('txtNomMarca').value = rpt.NOMBRE_MARCA;
        }
    };
}

//Desactivar Marca
function deleteMarca(id) {
    Swal.fire({
        title: '¿Estas seguro que desea desactivar esta marca?',
        text: 'Se desactivará esta marca y no podrá ser utilizada',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: 'red',
        confirmButtonText: 'Desactivar',
        cancelButtonText: 'Cancelar'
    }).then((result)=>{
        if (result.isConfirmed){
            const url = base_url + "Marca/delete/" + id;
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
                            title: "Marca desactivada",
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        tblDetalleMarca.ajax.reload();
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

//Activar Marca
function activarMarca(id) {
    Swal.fire({
        title: '¿Estas seguro que desea activar esta marca?',
        text: 'La marca se activará y podrá ser utilizada en el sistema',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: 'red',
        confirmButtonText: 'Activar',
        cancelButtonText: 'Cancelar'
    }).then((result)=>{
        if (result.isConfirmed){
            const url = base_url + "Marca/activar/" + id;
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
                            title: "Marca activada",
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        tblDetalleMarca.ajax.reload();
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