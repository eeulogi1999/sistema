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
			border: 1px solid #CCC;
			border-radius: 10px;
			padding: 0 0 0 20px;
		}
		.wd30 h3 {
			margin-bottom: 0px;

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

        .wd60 {
            width: 60%;
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
            background-color: #28a745;
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
            background-color: #28a745;
            /* #009688 */
            border-radius: 7px;
            padding: 5px;
            color: #FFF;
            text-align: left;
        }

        .det-mov {
            font-size: 20px;
        }

        .tblfoot_Final {
            background-color: #28a745;
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

        .det-con {
            font-size: 22px !important;
        }
        .color_general{
			color: #28a745 ;
		}
		.color_second{
			color: #009688;
		}

        .bord {
			border: 1px solid #CCC;
			border-radius: 10px;
		}

		.bord h4 {
			text-decoration: none;
		}
        .titulotd {
			background-color: #fff;
		}
		.titulotd .peque{
			font-size:35px;
		}
        .titulo {
			font-size: 40px;
			color: #28a745;

		}
        .color_danger {
			color: red;
		}
    </style>
</head>

<body>
    <table class="tbl-hader">
        <tbody>
            <tr>
                <td class="text-center bord wd30">

                    <h3><strong class="color_general">PUESTO</strong></h3>
                    <h1 class="color_general">384</h1>
                </td>
                <td class="text-center wd20">
                    <img src="<?= media() ?>/images/logo_platanal.png" alt="Logo" width="100">

                </td>
                <td class="text-center wd50 bord titulotd">
                    <h1 class="titulo"><strong>EL PLATANAL <span class="peque"> DE GRACIELA</span> </strong></h1>

                </td>
            </tr>

        </tbody>
    </table>
    <table class="tbl-hader">
        <tbody>
            <tr>
                <td class="text-center bord wd50 ">

                    <p class="color_general"><strong>Fecha Ingreso:</strong><?= $mov['mov_fechaE'] ?> <br><br>
                        <strong>Fecha &nbsp;&nbsp; Pago:</strong> <?= $mov['mov_fechaV'] ?> <br></p>
                </td>
                <td class="text-center bord wd20 telf">

                    <h4 class="color_general">988 770 506</h4>
                    <h4 class="color_general">936 585 176</h4>
                    <h4 class="color_general">957 755 341</h4>
                </td>
                <td class="text-center bord wd30">
                    <h3><strong class="color_general">NUM. LIQUIDACIÓN</strong></h3>
                    <h1 class="color_danger"> <span>N°.</span> <?= $mov['mov_numero'] ?></h1>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tbl-cliente">
        <tbody>
            <tr>
                <td class="wd15 color_general">PRODUCTOR:</td>
                <td class="wd55 color_general"><strong><?= !empty($mov['mov_age_id'])?$mov['mov_age_id']['age_nombre']:''?></strong>
                </td>
                <td class="color_general">MARCA:</td>
                <td class="wd20 color_general"><strong><?= '' ?></strong></td>

            </tr>

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
            // $mov['mov_igv_id'] = json_decode($mov['mov_igv_id'],true);
            ?>
        </tbody>
    </table><br><br>
    <div class="text-center">
    SECCION DE GASTOS
    </div>
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
        </tbody>
        <tfoot>
            <tr>
                <td colspan="7"></td>
            </tr>
            <tr>
                <td colspan="4"> <strong>OBSERVACIONES: </strong></td>
                <td colspan="2" class="tblfoot "><strong>OP. GRAVADA</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_subtotal']) ?></td>
            </tr>
            <tr>
                <td colspan="4" rowspan="2">
                    <p><?= $mov['mov_observaciones'] ?></p>
                </td>
                <td colspan="2" class="tblfoot"><strong>DESCUENTOS</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_igv_id']['mov_igv']) ?></td>
            </tr>
            <tr>
                <td colspan="2" class="tblfoot_Final"><strong>TOTAL</strong></td>
                <td class="text-right tbltval"><?= formatMoney($mov['mov_total']) ?></td>
            </tr>
        </tfoot>
    </table>

    <div class="tbl-cliente">
        SON: <span><?= $mov['mov_letras_pen'] ?></span>
    </div><br>
    <p class="text-center">Gracias por la confianza, el apoyo y ante todo por la preferencia !<br>
        Dios lo bendiga hoy, mañana y siempre!</p>
</body>

</html>