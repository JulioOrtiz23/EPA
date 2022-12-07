<?php
class ReporteProductos extends Controller
{
  public function __construct()
  {
    session_start();
    parent::__construct();
  }
  public function ingresos()
  {
    $this->views->getView($this, "ingresos");
  }
  public function entregas()
  {
    $this->views->getView($this, "entregas");
  }
  public function productos()
  {
    $this->views->getView($this, "productos");
  }
  public function listarRecepcion()
  {
    $data = $this->model->detalleRecepcion();
    for ($i = 0; $i < count($data); $i++) {
      if ($data[$i]['ESTADO_RECEPCION'] == 1) {
        $data[$i]['ESTADO_RECEPCION'] = '<span class="badge badge-success">Activo</span>';
        $data[$i]['acciones'] = '<div>
              <button class="btn btn-danger btn-sm" type="button" onclick="btnEliminarCat(' . $data[$i]['ID_RECEPCION'] . ');"><i class="fas fa-ban"></i></button>
              </div>';
      } else {
        $data[$i]['ESTADO_RECEPCION'] = '<span class="badge badge-danger">Inactivo</span>';
        $data[$i]['acciones'] = '<div>
              </div>';
      }
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    die();
  }
  public function generarPdf()
  {
    $data = $this->model->detalleRecepcion();

    require('Libraries/fpdf/fpdf.php');

    $pdf = new FPDF('P', 'mm', 'Letter');
    $pdf->AddPage();
    $pdf->SetMargins(5, 0, 0);
    $pdf->SetTitle('Recepciones');
    $pdf->SetFont('Arial', 'B', 16);
    //encabezado
    $pdf->Cell(0, 10, utf8_decode('Reporte de Recepciones'), 0, 1, 'C');
    $pdf->Image(base_url . 'Assets/images/Logo_EPA.png', 10, 10, 15, 8);
    $pdf->SetFont('Arial', 'B', 10);
    //tabla de datos
    //encabezado de tabla
    $pdf->SetFillColor(51, 153, 255); //define el color de fondo
    $pdf->SetTextColor(255, 255, 255); //define el color del texto
    //celdas de la tabla, para hacer el salto de linea se coloca 1 en la posicion 5 de la ultima celda
    $pdf->Cell(20, 10, utf8_decode('Recepción'), 0, 0, 'L', true);
    $pdf->Cell(35, 10, 'Fecha', 0, 0, 'L', true);
    $pdf->Cell(15, 10, 'Estado', 0, 0, 'L', true);
    $pdf->Cell(10, 10, 'Id', 0, 0, 'L', true);
    $pdf->Cell(57, 10, 'Producto', 0, 0, 'L', true);
    $pdf->Cell(18, 10, 'Cantidad', 0, 0, 'L', true);
    $pdf->Cell(25, 10, utf8_decode('Categoría'), 0, 0, 'L', true);
    $pdf->Cell(25, 10, 'Marca', 0, 1, 'L', true);
    //listamos el detalle
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont('Arial', '', 9);
    foreach ($data as $row) {
      if ($row['ESTADO_RECEPCION'] == 1) {
        $estado = "Activo";
      } else {
        $estado = "Anulado";
      }
      $row['FECHA_RECEPCION'] = date('d/m/Y');
      $pdf->Cell(20, 6, $row['ID_RECEPCION'], 0, 0, 'L');
      $pdf->Cell(35, 6, $row['FECHA_RECEPCION'], 0, 0, 'L');
      $pdf->Cell(15, 6, $estado, 0, 0, 'L');
      $pdf->Cell(10, 6, $row['ID_PRODUCTO'], 0, 0, 'L');
      $pdf->Cell(57, 6, $row['NOMBRE_PRODUCTO'], 0, 0, 'L');
      $pdf->Cell(18, 6, number_format($row['CANTIDAD_RECEPCION'], 1, '.', ','), 0, 0, 'L');
      $pdf->Cell(25, 6, $row['NOMBRE_CATEGORIA'], 0, 0, 'L');
      $pdf->Cell(25, 6, $row['NOMBRE_MARCA'], 0, 1, 'L');
    }
    $pdf->Ln();
    //instruccion para enviar a imprimir indispensable
    $pdf->Output();
  }
  public function listarEntrega()
  {
    $data = $this->model->detalleEntrega();
    for ($i = 0; $i < count($data); $i++) {
      if ($data[$i]['ESTADO_SALIDA'] == 1) {
        $data[$i]['ESTADO_SALIDA'] = '<span class="badge badge-success">Activo</span>';
        $data[$i]['acciones'] = '<div>
               <button class="btn btn-danger btn-sm" type="button" onclick="btnEliminarCat(' . $data[$i]['ID_SALIDA'] . ');"><i class="fas fa-ban"></i></button>
               </div>';
      } else {
        $data[$i]['ESTADO_SALIDA'] = '<span class="badge badge-danger">Inactivo</span>';
        $data[$i]['acciones'] = '<div>
               </div>';
      }
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    die();
  }
  public function generarPdfE()
  {
    $data = $this->model->detalleEntrega();

    require('Libraries/fpdf/fpdf.php');

    $pdf = new FPDF('P', 'mm', 'Letter');
    $pdf->AddPage();
    $pdf->SetMargins(5, 0, 0);
    $pdf->SetTitle('Entregas');
    $pdf->SetFont('Arial', 'B', 16);
    //encabezado
    $pdf->Cell(0, 10, utf8_decode('Reporte de Entregas'), 0, 1, 'C');
    $pdf->Image(base_url . 'Assets/images/Logo_EPA.png', 10, 10, 15, 8);
    $pdf->SetFont('Arial', 'B', 10);
    //tabla de datos
    //encabezado de tabla
    $pdf->SetFillColor(51, 153, 255); //define el color de fondo
    $pdf->SetTextColor(255, 255, 255); //define el color del texto
    //celdas de la tabla, para hacer el salto de linea se coloca 1 en la posicion 5 de la ultima celda
    $pdf->Cell(20, 10, utf8_decode('Recepción'), 0, 0, 'L', true);
    $pdf->Cell(35, 10, 'Fecha', 0, 0, 'L', true);
    $pdf->Cell(15, 10, 'Estado', 0, 0, 'L', true);
    $pdf->Cell(10, 10, 'Id', 0, 0, 'L', true);
    $pdf->Cell(57, 10, 'Producto', 0, 0, 'L', true);
    $pdf->Cell(18, 10, 'Cantidad', 0, 0, 'L', true);
    $pdf->Cell(25, 10, utf8_decode('Categoría'), 0, 0, 'L', true);
    $pdf->Cell(25, 10, 'Marca', 0, 1, 'L', true);
    //listamos el detalle
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont('Arial', '', 9);
    foreach ($data as $row) {
      if ($row['ESTADO_SALIDA'] == 1) {
        $estado = "Activo";
      } else {
        $estado = "Anulado";
      }
      $row['FECHA_SALIDA'] = date('d/m/Y');
      $pdf->Cell(20, 6, $row['ID_SALIDA'], 0, 0, 'L');
      $pdf->Cell(35, 6, $row['FECHA_SALIDA'], 0, 0, 'L');
      $pdf->Cell(15, 6, $estado, 0, 0, 'L');
      $pdf->Cell(10, 6, $row['ID_PRODUCTO'], 0, 0, 'L');
      $pdf->Cell(57, 6, $row['NOMBRE_PRODUCTO'], 0, 0, 'L');
      $pdf->Cell(18, 6, $row['CANTIDAD_SALIDA'], 0, 0, 'L');
      $pdf->Cell(25, 6, $row['NOMBRE_CATEGORIA'], 0, 0, 'L');
      $pdf->Cell(25, 6, $row['NOMBRE_MARCA'], 0, 1, 'L');
    }
    $pdf->Ln();
    //instruccion para enviar a imprimir indispensable
    $pdf->Output();
  }

  public function listarProductos()
  {
    $data = $this->model->detalleProductos();
    for ($i = 0; $i < count($data); $i++) {
      if ($data[$i]['ESTADOPRODUCTO'] == 1) {
        $data[$i]['ESTADOPRODUCTO'] = '<span class="badge badge-success">Activo</span>';
      } else {
        $data[$i]['ESTADOPRODUCTO'] = '<span class="badge badge-danger">Inactivo</span>';
      }
    }
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    die();
  }
}
