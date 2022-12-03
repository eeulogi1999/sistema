


<?php 
header("Content-Type: application/vnd.ms-excel");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=xls_InventarioValorizado-".$data['mesPeriodo'].".xls");
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
			<td colspan="15">FORMATO 13.1: REGISTRO DE INVENTARIO PERMANENTE  VALORIZADO - DETALLE DEL INVENTARIO VALORIZADO</td>
		</tr>
		<tr>
			<td colspan="3">PERIODO</td>
			<td colspan="12"><?=$mesPeriodo?></td>
		</tr>
		<tr>
			<td colspan="3">RUC</td>
			<td colspan="12">'<?=$arrEmpresa['ruc']?></td></tr>
		<tr>
			<td colspan="3">RAZON SOCIAL</td>
			<td colspan="12"><?=$arrEmpresa['razonsocial']?></td></tr>
		<tr>
			<td colspan="3">ESTABLECIMIENTO</td>
			<td colspan="12"><?=$arrLocal['id_almacen'].' - '.$arrLocal['nombre'];?></td></tr>
		
	</table>
	<?php 
	$tp_entrada = 0;
	$tp_salida = 0;
	$tp_valorizado = 0;
	
	foreach ($arrArticulo as $key => $articulo) {
	    $i = 1;
        $qsaldo = floatval($articulo['saldoArticulo']['qsaldo']);
        $tsaldo = floatval($articulo['saldoArticulo']['mtsaldo']);
	    if(!empty($articulo['arrDetalles']) || $qsaldo > 0 ){
        
        $qc = 0;
        $qv = 0;
        $tc = 0;
        $tv = 0;
		$existencia = $atributos['listExistencias'][array_search($articulo['existencia_id'],array_column($atributos['listExistencias'],'id_tablas'))];
		$umedida = $atributos['listUmedida'][array_search($articulo['um_id'],array_column($atributos['listUmedida'],'id_tablas'))];

		?>
	<table>
		<tr>
			<td colspan="3">CÓDIGO DE LA EXISTENCIA</td>
			<td colspan="12"><?=$existencia['codigo_sunat'].' - '.$existencia['descripcion_tabla'];?></td>
		</tr>
		<tr>
			<td colspan="3">DESCRIPCIÓN</td>
			<td colspan="12"><?=$articulo['codigo'].' - '.$articulo['nombre']?></td></tr>
		<tr>
			<td colspan="3">UNIDAD MEDIDA</td>
			<td colspan="12"><?=$umedida['codigo_sunat'].' - '.$umedida['descripcion_tabla'];?></td>
		</tr>
	</table>
	<table border="1">
		<tr>
		    <td rowspan="3" >COD REGISTRO</td>
			<td rowspan="2" colspan="4">DOCUMENTO DE TRASLADO, COMPROBANTE DE PAGO, DOCUMENTO INTERNO O SIMILAR</td>
			<td rowspan="3">TIPO DE <br> OPERACION <br> (TABLA 12)</td>
			<td colspan="3">ENTRADAS</td>
			<td colspan="3">SALIDAS</td>
			<td colspan="3">SALDO FINAL</td>
		</tr>
		<tr>
			<td rowspan="2">CANTIDAD</td>
			<td rowspan="2">COSTO UNITARIO</td>
			<td rowspan="2">COSTO TOTAL</td>
			<td rowspan="2">CANTIDAD</td>
			<td rowspan="2">COSTO UNITARIO</td>
			<td rowspan="2">COSTO TOTAL</td>
			<td rowspan="2">CANTIDAD</td>
			<td rowspan="2">COSTO UNITARIO</td>
			<td rowspan="2">COSTO TOTAL</td>
		</tr>
		<tr>
			<td>FECHA</td>
			<td>TIPO (TABLA 10)</td>
			<td>SERIE</td>
			<td>NÚMERO</td>
		</tr>
		<tr>
			<td>SALDO INICIAL</td>
			<td><?=$data['mesPeriodo']?>-01</td>
			<td></td>
			<td></td>
			<td></td>
			<td>'16</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><?=$qsaldo?></td>
			<td><?=SMONEY.' '.formatMoney(($tsaldo > 0.5)? $tsaldo/$qsaldo :0);?></td>
			<td><?=SMONEY.' '.formatMoney(floatval($tsaldo));?></td>
		</tr>
		<?php
		foreach ($articulo['arrDetalles'] as $key => $e) {
			$comprobante = $atributos['listComprobante'][array_search($e['comprobante_id'],array_column($atributos['listComprobante'],'id_tablas'))];
			$operacion = $atributos['listOperacion'][array_search($e['operacion_id'],array_column($atributos['listOperacion'],'id_tablas'))];
            $arrNumOp = explode('-',$e['num_operacion']);   
            if ($e['t_movimiento']=='1') {
                $qsaldo += floatval($e['cantidad']);
					$comprai = floatval($e['importe']);
					$precio = floatval($e['precio_unitario']);
                    $tsaldo += floatval($e['importe']);  
				?>
				<tr>
					<td><?=$i?></td>
					<td><?=$e['fecha_emision']?></td>
					<td>'<?=$comprobante['codigo_sunat'];?></td>
					<td><?=$arrNumOp[0]?></td>
					<td>'<?=$arrNumOp[1]?></td>
					<td>'<?=$operacion['codigo_sunat'];?></td>
					<td><?=$e['cantidad'];?></td>
					<td><?=SMONEY.' '.formatMoney($precio);?></td>
					<td><?=SMONEY.' '.formatMoney($comprai);?></td>
					<td></td>
					<td></td>
					<td></td>
					<td><?=$qsaldo?></td>
					<td><?=SMONEY.' '.formatMoney(($tsaldo<0.5)?0:$tsaldo/$qsaldo);?></td>
					<td><?=SMONEY.' '.formatMoney($tsaldo);?></td>
				</tr>
                <?php
				$qc+= floatval($e['cantidad']);
                $tc+= floatval($comprai);
            }
            if ($e['t_movimiento']=='2') {
                $qsaldo -= floatval($e['cantidad']);
                $vc = floatval($e['precio_unitario']);
                $vi = floatval($e['cantidad'])*$vc;
                $tsaldo -= $vi;
				
				?>
				<tr>
					<td><?=$i?></td>
					<td><?=$e['fecha_emision']?></td>
					<td>'<?=$comprobante['codigo_sunat'];?></td>
					<td><?=$arrNumOp[0]?></td>
					<td>'<?=$arrNumOp[1]?></td>
					<td>'<?=$operacion['codigo_sunat'];?></td>
					<td></td><td></td><td></td>
					<td><?=$e['cantidad'];?></td>
					<td><?=SMONEY.' '.formatMoney($vc);?></td>
					<td><?=SMONEY.' '.formatMoney($vi);?></td>
					<td><?=$qsaldo?></td>
					<td><?=SMONEY.' '.formatMoney(($tsaldo<0.5)?0:$tsaldo/$qsaldo);?></td>
					<td><?=SMONEY.' '.formatMoney($tsaldo);?></td>
				</tr>
                <?php
				$qv+= floatval($e['cantidad']);
                $tv+= floatval($vi);
            }
			$i++;
		} 
		$tp_entrada += $tc;
		$tp_salida += $tv;
		$tp_valorizado += $tsaldo;
		?>
		<tr>
			<td>TOTALES</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><?=$qc?></td>
			<td></td>
			<td><?=SMONEY.' '.formatMoney($tc);?></td>
			<td><?=$qv?></td>
			<td></td>
			<td><?=SMONEY.' '.formatMoney($tv);?></td>
			<td><?=$qsaldo?></td>
			<td></td>
			<td></td> 
		</tr>
	</table>
	<br><br>
	<?php
	}
	} ?> 
	<table border="2" style="font-size: 20px;background-color: aliceblue;">
		<tr>
			<td colspan='6'>TOTAL GENERAL PERIODO <?=$mesPeriodo?></td>
			<td></td>
			<td></td>
			<td><?=SMONEY.' '.formatMoney($tp_entrada);?></td>
			<td></td>
			<td></td>
			<td><?=SMONEY.' '.formatMoney($tp_salida);?></td>
			<td></td>
			<td></td>
			<td><?=SMONEY.' '.formatMoney($tp_valorizado);?></td>
		</tr>
	</table>        
</body>
</html>




