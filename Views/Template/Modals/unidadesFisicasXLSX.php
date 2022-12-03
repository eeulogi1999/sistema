<?php 
	header("Content-Type: application/vnd.ms-excel");
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("content-disposition: attachment;filename=xls_InventarioUnidadesFisicas-".$data['mesPeriodo'].".xls");
$atributos = $data['arrAtributos'];
$arrEmpresa = $data['arrEmpresa'];
$arrLocal = $data['arrLocal'];
$arrArticulo = $data['arrArticulo']; 
$mesPeriodo = $data['mesPeriodo'];
 ?>
<!DOCTYPE html>
<html lang="es">
<head> 
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Factura</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="9">FORMATO 12.1: REGISTRO DE INVENTARIO PERMANENTE EN UNIDADES FÍSICAS-DETALLE DEL INVENTARIO PERMANENTE EN UNIDADES FÍSICAS</td>
		</tr>
		<tr>
			<td colspan="3">PERIODO:</td>
			<td colspan="6"><?=$mesPeriodo?></td>
		</tr>
		<tr>
			<td colspan="3">RUC:</td>
			<td colspan="6">'<?=$arrEmpresa['ruc']?></td></tr>
		<tr>
			<td colspan="3">APELLIDOS Y NOMBRES, DENOMINACIÓN O RAZÓN SOCIAL:</td>
			<td colspan="6"><?=$arrEmpresa['razonsocial']?></td></tr>
		<tr>
			<td colspan="3">ESTABLECIMIENTO:</td>
			<td colspan="6"><?=$arrLocal['id_almacen'].' - '.$arrLocal['nombre'];?></td></tr>
		<tr></tr>
	</table>
	<?php foreach ($arrArticulo as $key => $articulo) {
	    $i = 1;
        $qsaldo =floatval($articulo['saldoArticulo']['qsaldo']);
        $tsaldo =0;
	    if(!empty($articulo['arrDetalles']) || $qsaldo > 0){
        $qc =0;
        $qv =0;
        $tc =0;
        $tv =0;
		$existencia = $atributos['listExistencias'][array_search($articulo['existencia_id'],array_column($atributos['listExistencias'],'id_tablas'))];
		$umedida = $atributos['listUmedida'][array_search($articulo['um_id'],array_column($atributos['listUmedida'],'id_tablas'))];
		?>
	<table>
		<tr>
			<td colspan="3">CÓDIGO DE LA EXISTENCIA:</td>
			<td colspan="6">'<?=$existencia['codigo_sunat'];?></td>
		</tr>
		<tr>
			<td colspan="3">TIPO(TABLA 5):</td>
			<td colspan="6"><?=$existencia['descripcion_tabla'];?></td>
		</tr>
		<tr>
			<td colspan="3">DESCRIPCIÓN:</td>
			<td colspan="6"><?=$articulo['codigo'].' - '.$articulo['nombre']?></td></tr>
		<tr>
			<td colspan="3">CÓDIGO DE LA UNIDAD DE MEDIDA (TABLA 6):</td>
			<td colspan="6"><?=$umedida['codigo_sunat'].' - '.$umedida['descripcion_tabla'];?></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td colspan="5">DOCUMENTO DE TRASLADO, COMPROBANTE DE PAGO, DOCUMENTO INTERNO O SIMILAR</td>
			<td rowspan="2">TIPO OPERACION <br> (TABLA 12)</td>
			<td rowspan="2">ENTRADAS</td>
			<td rowspan="2">SALIDAS</td>
			<td rowspan="2">SALDO FINAL</td>
		</tr>
		<tr>
			<td>COD REGISTRO</td>
			<td>FECHA</td>
			<td>TIPO (TABLA 10)</td>
			<td>SERIE</td>
			<td>NÚMERO</td>
		</tr>
		<tr>
			<td>INICIO</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><?=$qsaldo?></td>
		</tr>
		<?php
		foreach ($articulo['arrDetalles'] as $key => $e) {
			$comprobante = $atributos['listComprobante'][array_search($e['comprobante_id'],array_column($atributos['listComprobante'],'id_tablas'))];
			$operacion = $atributos['listOperacion'][array_search($e['operacion_id'],array_column($atributos['listOperacion'],'id_tablas'))];
            $arrNumOp = explode('-',$e['num_operacion']);
			if ($e['t_movimiento']=='1') {
                $qsaldo += floatval($e['cantidad']);
                if($e['comprobante_id'] ==='68'){
                    $tsaldo += floatval($e['importe'])*1.18;
                }else{
                    $tsaldo += floatval($e['importe']);  
                }
				?>
				<tr>
					<td><?=$i?></td>
					<td><?=$e['fecha_emision']?></td>
					<td>'<?=$comprobante['codigo_sunat'];?></td>
					<td><?=$arrNumOp[0]?></td>
					<td>'<?=$arrNumOp[1]?></td>
					<td>'<?=$operacion['codigo_sunat'];?></td>
					<td><?=$e['cantidad'];?></td>
					<td></td>
					<td><?=$qsaldo?></td>
				</tr>
                <?php
				$qc+= floatval($e['cantidad']);
                $tc+= floatval($e['importe']);
            }
            if ($e['t_movimiento']=='2') {
                $qsaldo -= floatval($e['cantidad']);
                $tsaldo -= floatval($e['importe']);
				?>
				<tr>
					<td><?=$i?></td>
					<td><?=$e['fecha_emision']?></td>
					<td>'<?=$comprobante['codigo_sunat'];?></td>
					<td><?=$arrNumOp[0]?></td>
					<td><?=$arrNumOp[1]?></td>
					<td>'<?=$operacion['codigo_sunat'];?></td>
					<td></td>
					<td><?=$e['cantidad'];?></td>
					<td><?=$qsaldo?></td>
				</tr>
                <?php
				$qv+= floatval($e['cantidad']);
                $tv+= floatval($e['importe']);
            }
			$i++;
		} ?>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>TOTALES</td>
			<td><?=$qc?></td>
			<td><?=$qv?></td>
			<td><?=$qsaldo?></td>
		</tr>
	</table>
	<br><br>
	<?php
	}
	} ?>     
</body>
</html>


