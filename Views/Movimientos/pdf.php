<?php 
	$gcl = $data['gcl'];
	$mov = $data['mov']; 
	$alm = $data['alm']; 	 		
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

        .center {
            display: flex;
            justify-content: center;
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
        .wd25 {
            width: 25%;
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

        .wd50 {
            width: 50%;
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

        .border-radius {
            border-radius: 10px;
            border: 1px solid #CCC;
            height: 150px;
            width: 250px;
        }

        .tbl-detalle thead th {
            padding: 5px;
            background-color: #711529;
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
            background-color: #711529;
            /* #009688 */
            border-radius: 7px;
            padding: 5px;
            color: #FFF;
            text-align: left;
        }
        .det-mov{
            font-size: 24px;
        }

        .tblfoot_Final {
            background-color: #bf0811;
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
                    <img src="<?= base_url() ?>/.uploads/<?= $alm['alm_est_id']['est_logo'] ?>" alt="Logo"
                        width="150">
                </td>
                <td class="text-center wd40">
                    <h4><strong><?= strtoupper($gcl['gcl_gem_id']['gem_razonsocial']) ?></strong></h4>
                    <p class="text-fs8"><?= $gcl['gcl_gem_id']['gem_direccion'] ?> <br>
                        <?= $gcl['gcl_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '.
                        $gcl['gcl_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '.
                        $gcl['gcl_gem_id']['gem_gdi_id']['gdi_distrito'] ?>
                        <br><br>
                        <strong>Contactos</strong><br>
                        <span>https://companycacel.com/</span> <br>
                        <span>companycacelsac@gmail.com</span><br>
                        <span>+51 922 012 611    +51 922 532 641</span>
                        <br><br>
                        ESTABLECIMIENTO: <?= $alm['alm_est_id']['est_nombre'] ?> <br>
                        DIRECCION: <?=  $alm['alm_est_id']['est_direccion']?> <br>
                        <?= $alm['alm_est_id']['est_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '.
                        $alm['alm_est_id']['est_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '.
                        $alm['alm_est_id']['est_gdi_id']['gdi_distrito'] ?>
                    </p>

                </td>
                <td class="text-center wd40 tbl-cliente det-mov" >
                    <p><span>RUC: <?= $gcl['gcl_gem_id']['gem_ruc'] ?></span><br>
                        <strong class="text-uppercase"><?= $mov['mov_t10_id']['t10_descripcion']?></strong><br>
                        <span><?= $mov['mov_serie'].'-'.str_pad($mov['mov_numero'],8,0,STR_PAD_LEFT) ?></span><br>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-cliente">
        <tbody>
            <tr>
                <td class="wd10"><?= !empty($mov['mov_age_id']['age_gem_id'])?'Razón Social ':'Nombre:' ?></td>
                <td class="wd50"><?= $mov['mov_age_id']['age_nombre'] ?></td>
                <td class="wd10">MONEDA:</td>
                <td class="wd10"><?= $mov['mov_gt4_id']['gt4_descripcion'] ?></td>
                <td class="wd10">IGV:</td>
                <td class="wd10"><?= "18.00%" ?></td>
            </tr>
            <?php if ($mov['mov_t12_id']['t12_id']<3) { ?>
                <tr>
                    <td class="wd10"><?= !empty($mov['mov_age_id']['age_gem_id'])?'RUC ':'Identificacion:' ?></td>
                    <td class="wd50"><?= $mov['mov_age_id']['age_ide'] ?></td>
                    <td class="wd10">FECHA</td>
                    <td class="wd10"><?= $mov['mov_fechaE'] ?></td>
                    <td class="wd10">PAGO</td>
                    <td class="wd10"><?= (empty($mov['mov_cre_id'])) ? 'Contado' : 'Credito' ; ?></td>
                </tr>
                <tr>
                    <td class="wd10">DIRECCION:</td>
                    <td class="wd50"><?= !isset($mov['mov_age_id'])? '': $mov['mov_age_id']['age_direccion'] ?></td>
                </tr>
                <tr>
                    <td class="wd10">CIUDAD:</td>
                    <td class="wd50"><?= !isset($mov['mov_age_id'])? '': $mov['mov_age_id']['age_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].'-'.
                                $mov['mov_age_id']['age_gdi_id']['gdi_gpr_id']['gpr_provincia'].'-'.
                                $mov['mov_age_id']['age_gdi_id']['gdi_distrito']?></td>
                </tr>
                <tr>
                    <td class="wd10">EMISOR:</td>
                    <td class="wd50"><?= !isset($mov['mov_gus_id'])? '': $mov['mov_gus_id']['gus_gpe_id']['gpe_nombre']?></td>
                </tr>
            <?php } else {?>
                <tr>
                    <td class="wd10">RUC/Identificacion:</td>
                    <td class="wd50"></td>
                </tr>
                <tr>
                    <td class="wd10">DIRECCION:</td>
                    <td class="wd50"></td>
                </tr>
                <tr>
                    <td class="wd10">CIUDAD:</td>
                    <td class="wd50"></td>
                </tr>
            <?php }?>
        </tbody>
    </table>
    <br>
    <table class="tbl-detalle">
        <thead>
            <tr>
                <th class="wd10 text-center">CODIGO</th>
                <th class="wd10 text-center">CANT</th>
                <th class="wd15 text-center">UNID.</th>
                <th class="wd25">DESCRIPCIÓN</th>
                <th class="wd10 text-right">V. UNT.</th>
                <th class="wd10 text-center">DSCTO</th>
                <th class="wd20 text-right">V. VENTA</th>
            </tr>
        </thead>
        <tbody>
            <?php 
				for ($i = 0; $i < count($mov['mov_mde_id']);$i++) {
					$mde = $mov['mov_mde_id'][$i];
			 ?>
            <tr>
                <td class="text-center"><?= $mde['mde_bie_id']['bie_codigo'] ?></td>
                <td class="text-center"><?= number_format($mde['mde_q'], 2,'.','') ?></td>
                <td class="text-center"><?= $mde['mde_t6m_id']['t6m_descripcion'] ?></td>
                <td><?= $mde['mde_bie_id']['bie_nombre'] ?></td>
                <td class="text-right"><?= formatMoney($mde['mde_vu']) ?></td>
                <td class="text-center"><?= "0.00" ?></td>
                <td class="text-right"><?= formatMoney($mde['mde_importe']) ?></td>
            </tr>
            <?php }
            $mov['mov_igv_id'] = json_decode($mov['mov_igv_id'],true);
            ?>
        </tbody><br><br>
        <tfoot>
            <tr>
                <td colspan="7"></td>
            </tr>
            <tr>
                <td colspan="4"> <strong>OBSERVACIONES: </strong></td>
                <td colspan="2" class="tblfoot "><strong>OP. GRAVADA</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_igv_id']['mov_gravada']) ?></td>
            </tr>
            <tr>
                <td colspan="4" rowspan="1"><p><?= $mov['mov_observaciones'] ?></p></td>
                <td colspan="2" class="tblfoot"><strong>OP. INAFECTA</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_igv_id']['mov_inafecta']) ?></td>
            </tr>
            <tr>
                <td colspan="4" rowspan="8"><img src="<?= $mov['mov_qr'] ?>" alt="" srcset=""></td>
                <td colspan="2" class="tblfoot"><strong>OP. EXONERADA</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_igv_id']['mov_exonerada']) ?></td>
            </tr>
            <tr>
                <td colspan="2" class="tblfoot"><strong>SUB TOTAL</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_subtotal']) ?></td>
            </tr>
            <tr>
                <td colspan="2" class="tblfoot"><strong>IGV</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_igv_id']['mov_igv']) ?></td>
            </tr>
            <tr>
                <td colspan="2" class="tblfoot_Final"><strong>TOTAL</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_total']) ?></td>
            </tr>
        </tfoot>
    </table><br><br>
    <div class="tbl-cliente">
        SON: <span><?= $mov['mov_letras_pen'] ?></span>
    </div>
    <p class="text-center">Gracias por la confianza, el apoyo y ante todo por la preferencia !<br>
    Dios lo bendiga hoy, mañana y siempre!</p>
</body>
</html>