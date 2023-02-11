<?php 
	$gcl = $data['gcl'];
	$mov = $data['mov']; 
	$alm = $data['alm']; 	
    $mov['mov_igv_id'] = json_decode($mov['mov_igv_id'],true);
    $age = $mov['mov_age_id']
 ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPROBANTE</title>
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/bootstrap-select.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
    <style>
        .fz-12{
            font-size: 12px;
        }
        .fz-20{
            font-size: 20px;
        }
    </style>
</head>
<body>
    <table class="table table-borderless table-sm fz-12 text-success"  >
        <tr>
            <td >
                <div class="card">
                    <div class="card-header text-center">PUESTO</div>
                    <div class="card-body text-center">384</div>
                </div>
            </td>
            <td class="text-center"><img src="http://localhost/sistema/Assets/images/logo_platanal.png" alt="logo" width="80px"></td>
            <td class="text-center">
                <div class="card">
                    <div class="card-body text-center fz-20">EL PLATANAL DE <br> GRACIELA</div>
                </div>
                </td>
        </tr>
    </table>
    <table class="table table-borderless table-sm fz-12 text-success" >
        <tr>
            <td>
                <div class="card">
                    <div class="card-header text-center">DIA-MES-AÑO</div>
                </div>
            </td>
            <td>
                <div class="card">
                    <div class="card-header text-center">CONTACTO</div>
                    <div class="card-body text-center">988 770 506 <br>
                    936 585 176</div>
                </div>
            </td> 
            <td>
                <div class="card">
                    <div class="card-header text-center">NUM LIQUIDACION</div>
                    <div class="card-body text-center text-danger">N° 1</div>
                </div>
            </td>
        </tr>
    </table>
    <table class="table table-borderless table-sm fz-12" >
        <tr>
            <td>PRODUCTOR</td>
            <td>
                <?= $age['age_nombre']?>
            </td>
            <td>MARCA</td>
            <td>
                <?= $age['age_marca']??''?>
            </td>
        </tr>
    </table>
    <table class="table table-striped  table-sm fz-12" >
        <thead class="bg-success text-white">
            <tr>
                <th class="text-center" >CANTIDAD</th>
                <th class="text-center" >UNIDAD</th>
                <th class="text-center" >CALIDAD</th>
                <th class="text-center" >PRECIO UNITARIO</th>
                <th class="text-center" >MONTO</th>
            </tr>
        </thead>
        <tbody>
        <?php 
			for ($i = 0; $i < count($mov['mov_mde_id']);$i++) {
				$mde = $mov['mov_mde_id'][$i];
			 ?>
            <tr>
                <td class="text-center"><?= number_format($mde['mde_q'], 2,'.','') ?></td>
                <td><?= $mde['mde_bie_id']['bie_nombre'] ?></td>
                <td class="text-center"><?= $mde['mde_t6m_id']['t6m_descripcion'] ?></td>
                <td class="text-right"><?= formatMoney($mde['mde_vu']) ?></td>
                <td class="text-right"><?= formatMoney($mde['mde_importe']) ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
    <table class="table table-borderless table-sm fz-12" >
        <tr>
            <td style="width:350px">
                <table class="table table-borderless table-sm fz-12">
                    <tr>
                        <td>FLETE</td>
                        <td class="text-right"><?= $mov['des']['mov_1'] ?></td>
                    </tr>
                    <tr>
                        <td>COMISION</td>
                        <td class="text-right"><?= $mov['des']['mov_9'] ?></td>
                    </tr>
                    <tr>
                        <td>CAJA 1</td>
                        <td class="text-right"><?= $mov['des']['mov_2'] ?></td>
                    </tr>
                    <tr>
                        <td>CAJA 2</td>
                        <td class="text-right"><?= $mov['des']['mov_3'] ?></td>
                    </tr>
                    <tr>
                        <td>CAJA 3</td>
                        <td class="text-right"><?= $mov['des']['mov_4'] ?></td>
                    </tr>
                    <tr>
                        <td>CAJA 4</td>
                        <td class="text-right"><?= $mov['des']['mov_5'] ?></td>
                    </tr>
                    <tr>
                        <td>BOLSA 1</td>
                        <td class="text-right"><?= $mov['des']['mov_6'] ?></td>
                    </tr>
                    <tr>
                        <td>BOLSA 2</td>
                        <td class="text-right"><?= $mov['des']['mov_7'] ?></td>
                    </tr>
                    <tr>
                        <td>BOLSA 3</td>
                        <td class="text-right"><?= $mov['des']['mov_8'] ?></td>
                    </tr>
                    <tr>
                        <td>PAPEL 1</td>
                        <td class="text-right"><?= $mov['des']['mov_10'] ?></td>
                    </tr>
                    <tr>
                        <td>PAPEL 2</td>
                        <td class="text-right"><?= $mov['des']['mov_11'] ?></td>
                    </tr>
                    <tr>
                        <td>BOLSA</td>
                        <td class="text-right"><?= $mov['des']['mov_12'] ?></td>
                    </tr>
                    <tr>
                        <td>OTROS</td>
                        <td class="text-right"><?= $mov['des']['mov_13'] ?></td>
                    </tr>
                </table>
            </td>
            <td></td>
            <td>
                <table class="table table-borderless table-sm fz-12">
                    <tr>
                        <td>SUBTOTAL</td>
                        <td class="text-right"><?= formatMoney($mov['mov_subtotal'])?></td>
                    </tr>
                    <tr>
                        <td>GASTO TOTAL S/</td>
                        <td class="text-right"><?= formatMoney($mov['mov_igv_id']['mov_des'])?></td>
                    </tr>
                    <tr>
                        <td>SALDO NETO PARCIAL S/</td>
                        <td class="text-right"><?= formatMoney($mov['mov_igv_id']['mov_des'])?></td>
                    </tr>
                    <tr>
                        <td>ADELANTO S/</td>
                        <td class="text-right"><?= formatMoney('0.00')?> </td>
                    </tr>
                    <tr>
                        <td>AMORTIZACION DEUDA S/</td>
                        <td class="text-right"><?= formatMoney('0.00')?></td>
                    </tr>
                    <tr>
                        <td>DESCUENTO S/</td>
                        <td class="text-right"><?= formatMoney($mov['mov_igv_id']['mov_des'])?></td>
                    </tr>
                    <tr>
                        <td>IMPORTE FINAL S/</td>
                        <td class="text-right"><?= formatMoney($mov['mov_total'])?></td>
                    </tr>
                    <tr><td colspan="2">OBSERVACION</td></tr>
                    <tr><td colspan="2" rowspan="2"></td></tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>