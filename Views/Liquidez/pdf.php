<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuadro de Liquidez</title>
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/bootstrap-select.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
    <style>
        .fz-12 {
            font-size: 12px;
        }
    </style>
</head>

<body>
    <h1 class="text-center">DETALLE DE LIQUIDEZ</h1>
    <table class="table table-borderless table-sm fz-12">
        <tr>
            <td>AGENTE</td>
            <td><?=($data['age']['age_gem_id']) ? $data['age']['age_gem_id']['gem_razonsocial'] : $data['age']['age_gpe_id']['gpe_nombre'].', '.$data['age']['age_gpe_id']['gpe_apellidos'] ;?>
            </td>
        </tr>
        <tr>
            <td>DIRECCIÓN</td>
            <td><?=($data['age']['age_gem_id']) ? $data['age']['age_gem_id']['gem_direccion'] : $data['age']['age_gpe_id']['gpe_direccion'] ;?>
            </td>
        </tr>
        <tr>
            <td>FECHA</td>
            <td><?= date("Y-m-d")?></td>
        </tr>
    </table>
    <table class="table table-bordered table-sm fz-12">
        <thead>
            <tr>
                <th colspan="6" class="text-center">INGRESOS</th>
            </tr>
            <tr>
                <th>#</th>
                <th>FECHA</th>
                <th>TIPO</th>
                <th >CUENTA</th>
                <th style="width: 250px">DESCRIPCIÓN</th>
                <th>TOTAL</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                            $ing_sum = 0;
                            for ($i=1; $i < count($data['liq_ing'])+1; $i++) { 
                                $ing_sum += $data['liq_ing'][$i-1]['ing_monto']; ?>
            <tr>
                <td><?=$i?></td>
                <td><?=$data['liq_ing'][$i-1]['ing_fecha']?></td>
                <td><?=$data['liq_ing'][$i-1]['ing_tipo']?></td>
                <td><?=$data['liq_ing'][$i-1]['ing_cuenta']?></td>
                <td><?=$data['liq_ing'][$i-1]['ing_descripcion']?></td>
                <td><?=formatMoney($data['liq_ing'][$i-1]['ing_monto'])?></td>
            </tr>
            <?php } ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5">TOTALES</td>
                <td><?=formatMoney($ing_sum)?></td>
            </tr>
        </tfoot>
    </table>
    <table class="table table-bordered table-sm fz-12">
        <thead colspan="6">
            <tr>
                <th colspan="6" class="text-center">SALIDAS</th>
            </tr>
            <tr>
                <th>#</th>
                <th>FECHA</th>
                <th>TIPO</th>
                <th>CUENTA</th>
                <th style="width: 250px">DESCRIPCIÓN</th>
                <th>TOTAL</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                            $egr_sum=0;
                            for ($i=1; $i < count($data['liq_egr'])+1; $i++) { 
                                $egr_sum += $data['liq_egr'][$i-1]['egr_monto']; ?>
            <tr>
                <td><?=$i?></td>
                <td><?=$data['liq_egr'][$i-1]['egr_fecha']?></td>
                <td><?=$data['liq_egr'][$i-1]['egr_tipo']?></td>
                <td><?=$data['liq_egr'][$i-1]['egr_cuenta']?></td>
                <td><?=$data['liq_egr'][$i-1]['egr_descripcion']?></td>
                <td><?= formatMoney($data['liq_egr'][$i-1]['egr_monto'])?></td>
            </tr>
            <?php } ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5">TOTALES</td>
                <td><?=formatMoney($egr_sum)?></td>
            </tr>
        </tfoot>
    </table>
    <table class="table table-bordered table-sm fz-12">
        <tr>
            <td colspan="2" class="text-center">RESUMEN</td>
        </tr>
        <tr>
            <td>SALIDAS</td>
            <td><?=formatMoney($egr_sum)?></td>
        </tr>
        <tr>
            <td>INGRESOS</td>
            <td><?=formatMoney($ing_sum)?></td>
        </tr>
        <?php
                            $saldo = $egr_sum-$ing_sum;
                        ?>
        <tr>
            <td>SALDO POR <?=($saldo<0)?'PAGAR':'COBRAR'?></td>
            <td><?=formatMoney(abs($saldo))?></td>
        </tr>
    </table>
</body>

</html>