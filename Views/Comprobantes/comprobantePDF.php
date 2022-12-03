<?php 
	$gcl = $data['gcl'];
	$com = $data['com']; 
	$est = $data['est']; 	 		
 ?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Factura</title>
    <style>
    table {
        width: 100%;
    }

    table td,
    table th {
        font-size: 12px;
    }

    h4 {
        margin-bottom: 0px;
    }

    .text-center {
        text-align: center;
    }

    .text-uppercase {
        text-transform: uppercase;
    }

    .text-right {
        text-align: right;
    }

    .wd33 {
        width: 33.33%;
    }

    .tbl-cliente {
        border: 1px solid #CCC;
        border-radius: 10px;
        padding: 5px;
    }

    .tbl-subCliente {
        border-right: 1px solid #CCC;
    }

    .wd10 {
        width: 10%;
    }

    .wd15 {
        width: 15%;
    }

    .wd20 {
        width: 20%;
    }

    .wd30 {
        width: 30%;
    }

    .wd35 {
        width: 35%;
    }

    .wd40 {
        width: 40%;
    }

    .wd55 {
        width: 55%;
    }

    .wd50 {
        width: 50%;
    }

    .tbl-detalle {
        border-collapse: collapse;
        border-radius: 10px;
    }

    .tbl-detalle thead th {
        padding: 5px;
        background-color: #009688;
        color: #FFF;
    }

    .tbl-detalle tbody td {
        border-bottom: 1px solid #CCC;
        padding: 5px;
    }

    .tbl-detalle tfoot td {
        padding: 5px;
    }

    .text-fs8 {
        font-size: 8px;
    }

    .text-fs10 {
        font-size: 10px;
    }

    .tblfoot {
        background-color: #009688;
        /* #009688 */
        border-radius: 7px;
        padding: 5px;
        color: #FFF;
        text-align: left;
    }
	.tblfoot_Final{
		background-color: #009688;
        border-radius: 7px;
		border-top: black;
		border-bottom: black;
		border-left: black;
		border-right: black;
        padding: 5px;
        color: #FFF;
        text-align: left;
	}

    tfoot {
        padding-top: 5px;
    }

    .tbltval {
        border: 2px solid #CCC;
        border-radius: 7px;
        padding: 5px;
    }

    .flex-end {
        align-content: flex-end
    }

    .h-100 {
        height: 100%;
        display: flex;
    }
    </style>
</head>

<body>
    <table class="tbl-hader">
        <tbody>
            <tr>
                <td class="wd10">
                    <img src="<?= base_url() ?>/.uploads/<?= $est['est_logo'] ?>" alt="Logo" width="150">
                </td>
                <td class="text-center wd40">
                    <h4><strong><?= $gcl['gcl_gem_id']['gem_razonsocial'] ?></strong></h4>
                    <p class="text-fs8"><?= $gcl['gcl_gem_id']['gem_direccion'] ?> <br>
                        <?= $gcl['gcl_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '.
                        $gcl['gcl_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '.
                        $gcl['gcl_gem_id']['gem_gdi_id']['gdi_distrito'] ?>
                        <br><br>
                        ESTABLECIMIENTO: <?= $est['est_nombre'] ?> <br>
                        DIRECCION: <?=  $est['est_direccion']?> <br>
                        <?= $est['est_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '.
                        $est['est_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '.
                        $est['est_gdi_id']['gdi_distrito'] ?>
                    </p>

                </td>
                <td class="text-center wd40 tbl-cliente">
                    <p><span>RUC: <?= $gcl['gcl_gem_id']['gem_ruc'] ?></span><br><br>
                        <strong class="text-uppercase"><?= $com['com_t10_id']['t10_descripcion']?></strong><br><br>
                        <span><?= $com['com_serie'].'-'.str_pad($com['com_numero'],8,0,STR_PAD_LEFT) ?></span>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-cliente">
        <tbody>
            <?php 
            	if(!empty($com['com_age_id']['age_gpe_id'])){
                    $razonsocial = $com['com_age_id']['age_gpe_id']['gpe_nombre'].' '.
                    $com['com_age_id']['age_gpe_id']['gpe_apellidos'];
                    $t2i_descripcion = "DNI";
                    $ruc = $com['com_age_id']['age_gpe_id']['gpe_identificacion'];
                    $direccion = $com['com_age_id']['age_gpe_id']['gpe_direccion'];
                    $email = $com['com_age_id']['age_gpe_id']['gpe_email'];
                    $gdi_id = $com['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '
                    .$com['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '
                    .$com['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_distrito'];
                    
                }
                if(!empty($com['com_age_id']['age_gem_id'])){
                    $razonsocial = $com['com_age_id']['age_gem_id']['gem_razonsocial'];
                    $t2i_descripcion = "Identificación";
                    $ruc = $com['com_age_id']['age_gem_id']['gem_ruc'];
                    $direccion = $com['com_age_id']['age_gem_id']['gem_direccion'];
                    $email = $com['com_age_id']['age_gem_id']['gem_email'];
                    $gdi_id = $com['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '
                    .$com['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '
                    .$com['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_distrito'];
            
                }
            ?>
            <tr>
                <td class="wd10">CLIENTE:</td>
                <td class="wd50"><?=$razonsocial ?></td>
                <td class="wd10">MONEDA:</td>
                <td class="wd10"><?= $com['com_gt4_id']['gt4_descripcion'] ?></td>
                <td class="wd10">IGV:</td>
                <td class="wd10"><?= "18.00%" ?></td>
            </tr>
            <tr>
                <td class="wd10"><?=$t2i_descripcion?></td>
                <td class="wd50"><?= $ruc ?></td>
            </tr>
            <tr>
                <td class="wd10">DIRECCION:</td>
                <td class="wd50"><?= $direccion  ?></td>
            </tr>
            <tr>
                <td class="wd10">CIUDAD:</td>
                <td class="wd50"><?= $gdi_id ?></td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-cliente">
        <tbody>
            <tr>
                <td class="text-center tbl-subCliente wd20"><strong>Fecha de Emisión</strong></td>
                <td class="text-center tbl-subCliente wd20"><strong>Forma de Pago</strong></td>
                <td class="text-center tbl-subCliente wd20"><strong>Orden de Compra</strong></td>
                <td class="text-center tbl-subCliente wd20"><strong>Fecha de Vencimiento</strong></td>
                <td class="text-center wd20"><strong>N° Guia de Remisión</strong></td>
            </tr>
            <tr>
                <td class="text-center tbl-subCliente wd20"><?=  $com['com_fechaE']?></td>
                <td class="text-center tbl-subCliente wd20">
                    <?= (empty($com['com_cre_id'])) ? 'Contado' : 'Credito' ;  ?></td>
                <td class="text-center tbl-subCliente wd20"><?= "" ?></td>
                <td class="text-center tbl-subCliente wd20"><?= "" ?></td>
                <td class="text-center wd20"><?= "" ?></td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-detalle">
        <thead>
            <tr>
                <th class="wd10 text-center">CODIGO</th>
                <th class="wd10 text-center">CANT</th>
                <th class="wd10 text-center">UNID.</th>
                <th class="wd35">DESCRIPCIÓN</th>
                <th class="wd10 text-right">V. UNT.</th>
                <th class="wd10 text-center">DSCTO</th>
                <th class="wd15 text-right">V. VENTA</th>
            </tr>
        </thead>
        <tbody>
            <?php 
				for ($i = 0; $i < count($com['com_cde']);$i++) {
					$cde = $com['com_cde'][$i];
			 ?>
            <tr>
                <td class="text-center"><?= '$codigo' ?></td>
                <td class="text-center"><?= number_format($cde['cde_q'], 2,'.','') ?></td>
                <td class="text-center"><?= $cde['cde_t6m_id']['t6m_sunat'] ?></td>
                <td><?= $cde['cde_ces_id'][0]['ces_descripcion'] ?></td>
                <td class="text-right"><?= formatMoney($cde['cde_vu']) ?></td>
                <td class="text-center"><?= "0.00" ?></td>
                <td class="text-right"><?= formatMoney($cde['cde_importe']) ?></td>
            </tr>
            <?php }
            $com['com_igv_id'] = json_decode($com['com_igv_id'],true);
            ?>
        </tbody><br><br>
        <tfoot>
            <tr>
                <td colspan="7"></td>
            </tr>
            <tr>
                <td colspan="4"> <strong>OBSERVACIONES</strong></td>
                <strong>
                    <td colspan="2" class="tblfoot ">OP. GRAVADA</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney($com['com_igv_id']['com_gravada']) ?></td>
            </tr>
            <tr>
                <td colspan="4" rowspan="10"></td>
                <strong>
                    <td colspan="2" class="tblfoot">OP. INAFECTA</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney($com['com_igv_id']['com_inafecta']) ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">OP. EXONERADA</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney($com['com_igv_id']['com_exonerada']) ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">OP. EXPORTACION</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney("0.00") ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">TOTAL OP. GRATUITAS</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney("0.00") ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">DSCTOS TOTALES</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney("0.00") ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">SUB TOTAL</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney($com['com_subtotal']) ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">ICBPER</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney("0.00") ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">ISC</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney("0.00") ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot">IGV</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney($com['com_igv_id']['com_igv']) ?></td>
            </tr>
            <tr>
                <strong>
                    <td colspan="2" class="tblfoot_Final">TOTAL</td>
                </strong>
                <td class="text-right tbltval"><?= formatMoney($com['com_total']) ?></td>
            </tr>
        </tfoot>
    </table><br><br>
    <div class="tbl-cliente">
        SON: <span><?= $com['com_letras_pen'] ?></span>
    </div>
    <div class="text-center text-fs10 flex-end">
        <p>Operador de Servicios Electrónicos <br> según Resolución N° 034-005-0008776</p> <br>
        <p>Representación impresa de la factura electrónica, consulte en www.efact.pe <br>
            Autorizado mediante la Resolución de intendencia N° 0340050004177/SUNAT</p>
    </div>
</body>

</html>