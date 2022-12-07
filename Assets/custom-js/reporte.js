let tblRecepcion, tblEntrega, tblRepProductos
document.addEventListener("DOMContentLoaded", function () {
    tblRecepcion = $("#tblRecepcion").DataTable({
      ajax: {
        url: base_url + "ReporteProductos/listarRecepcion",
        dataSrc: "",
      },
      columns: [
        { data: "ID_RECEPCION" },
        { data: "FECHA_RECEPCION" },
        { data: "ESTADO_RECEPCION" },
        { data: "ID_PRODUCTO" },
        { data: "NOMBRE_PRODUCTO" },
        { data: "CANTIDAD_RECEPCION" },
        { data: "NOMBRE_CATEGORIA" },
        { data: "NOMBRE_MARCA" },
        { data: "acciones" },
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
    tblEntrega = $("#tblEntrega").DataTable({
      ajax: {
        url: base_url + "ReporteProductos/listarEntrega",
        dataSrc: "",
      },
      columns: [
        { data: "ID_SALIDA" },
        { data: "FECHA_SALIDA" },
        { data: "ESTADO_SALIDA" },
        { data: "ID_PRODUCTO" },
        { data: "NOMBRE_PRODUCTO" },
        { data: "CANTIDAD_SALIDA" },
        { data: "NOMBRE_CATEGORIA" },
        { data: "NOMBRE_MARCA" },
        { data: "acciones" },
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
    tblRepProductos = $("#tblRepProductos").DataTable({
      ajax: {
        url: base_url + "ReporteProductos/listarProductos",
        dataSrc: "",
      },
      columns: [
        { data: "NOMBREPRODUCTO" },
        { data: "DESCRIPCION" },
        { data: "EXISTENCIA" },
        { data: "ESTADOPRODUCTO" },
        { data: "NOMBRECATEGORIA" },
        { data: "NOMBREMARCA" },
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