<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="description" content="Sistema CompanyCacel">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Eduardo Eulogio">
  <meta name="theme-color" content="#009688">
  <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
  <link rel="stylesheet" type="text/css" href="<?= media();?>/css/bootstrap-select.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
  <title>RESUMEN</title>
</head>
<body>
  <h1 class='text-center'>RESUMEN MENSUAL</h1>
  
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="res" width="100%">
      <thead>
        <th>#</th>
        <th>DESCRIPCION</th>
        <th class="text-right">MONTO</th>
      </thead>
      <tbody>
        <?php  $res_sum=0;
        for ($i=0; $i <count($data['res']) ; $i++) { 
          $res_sum+=$data['res'][$i]['res_total'];?>
          <tr>
            <td><?= $i+1 ?></td>
            <td><?= $data['res'][$i]['res_descripcion']?></td>
            <td class="text-right"><?= formatMoney($data['res'][$i]['res_total'])?></td>
          </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2">SUBTOTAL</td>
          <td class="text-right"><?= formatMoney($res_sum)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <h2>1.1 Detalle de Cuentas</h2>
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="cue" width="100%">
      <thead>
        <th>#</th>
        <th>CUENTAS</th>
        <th class="text-right">MONTO</th>
      </thead>
      <tbody>
        <?php  $cue_sum=0;
        for ($i=0; $i <count($data['cue']) ; $i++) { 
          $cue_sum+=$data['cue'][$i]['cue_saldo'];?>
          <tr>
            <td><?= $i+1 ?></td>
            <td><?= $data['cue'][$i]['cue_nombre']?></td>
            <td class="text-right"><?= formatMoney($data['cue'][$i]['cue_saldo'])?></td>
          </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2">SUBTOTAL</td>
          <td class="text-right"><?= formatMoney($cue_sum)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <h2>1.2 Mercaderia</h2>
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="sbi" width="100%">
      <thead>
        <th>#</th>
        <th>MATERIAL</th>
        <th>UNIDAD MEDIDA</th>
        <th>CANTIDAD</th>
        <th>VALOR UNITARIO</th>
        <th class="text-right">VALORIZADO</th>
      </thead>
      <tbody>
        <?php $sbi_qs=0;$sbi_mts=0;
        for ($i=0; $i <count($data['sbi']) ; $i++) { 
          $sbi_qs+=$data['sbi'][$i]['sbi_qs'];
          $sbi_mts+=$data['sbi'][$i]['sbi_mts'];?>
          <tr>
            <td><?= $i+1 ?></td>
            <td><?= $data['sbi'][$i]['sbi_bie_id']['bie_nombre']?></td>
            <td><?= $data['sbi'][$i]['sbi_bie_id']['bie_t6m_id']['t6m_descripcion']?></td>
            <td><?= $data['sbi'][$i]['sbi_qs']?></td>
            <td><?= $data['sbi'][$i]['sbi_p']?></td>
            <td class="text-right"><?= formatMoney($data['sbi'][$i]['sbi_mts'])?></td>
          </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="3">SUBTOTAL</td>
          <td><?= $sbi_qs?></td>
          <td></td>
          <td class="text-right"><?= formatMoney($sbi_mts)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <h2>1.3 POR COBRAR</h2>
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="liq" width="100%">
      <thead>
        <th>#</th>
        <th>NOMBRE/RAZON SOCIAL</th>
        <th class="text-right">MONTO</th>
      </thead>
      <tbody>
        <?php $cobrar=0;
        for ($i=0; $i <count($data['liq']) ; $i++) { 
          if ($data['liq'][$i]['liq_actual'] > 0) { 
            $cobrar+=$data['liq'][$i]['liq_actual'];?>
          <tr>
            <td><?= $i+1 ?></td>
            <td><?= $data['liq'][$i]['liq_age_id']['age_nombre']?></td>
            <td class="text-right"><?= formatMoney($data['liq'][$i]['liq_actual'])?></td>
          </tr>
        <?php } } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2">SUBTOTAL</td>
          <td class="text-right"><?= formatMoney($cobrar)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <h2>1.4 POR PAGAR</h2>
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="liq" width="100%">
      <thead>
        <th>#</th>
        <th>NOMBRE/RAZON SOCIAL</th>
        <th class="text-right">MONTO</th>
      </thead>
      <tbody>
      <?php $pagar=0;
      for ($i=0; $i <count($data['liq']) ; $i++) { 
          if ($data['liq'][$i]['liq_actual'] < 0) { 
            $pagar+=$data['liq'][$i]['liq_actual'];?>
          <tr>
          <td><?= $i+1 ?></td>
            <td><?= $data['liq'][$i]['liq_age_id']['age_nombre']?></td>
            <td class="text-right"><?= formatMoney($data['liq'][$i]['liq_actual'])?></td>
          </tr>
        <?php } } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2">SUBTOTAL</td>
          <td class="text-right"><?= formatMoney($pagar)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <h2>2. GASTOS</h2>
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="gas" width="100%">
      <thead>
        <th>#</th>
        <th>TIPO DE GASTO</th>
        <th class="text-right">MONTO</th>
      </thead>
      <tbody>
      <?php $gas=0;
      for ($i=0; $i <count($data['gas']) ; $i++) { 
            $gas+=abs($data['gas'][$i]['caj_monto']);?>
          <tr>
          <td><?= $i+1 ?></td>
            <td><?= $data['gas'][$i]['caj_tga_id']['tga_nombre']?></td>
            <td class="text-right"><?= formatMoney(abs($data['gas'][$i]['caj_monto']))?></td>
          </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2">SUBTOTAL</td>
          <td class="text-right"><?= formatMoney($gas)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
  <h2>3. VENTAS</h2>
  <div class="table-responsive" >
    <table class="table table-hover table-bordered table-sm " id="cve" width="100%">
      <thead>
        <th>#</th>
        <th>MATERIAL</th>
        <th class="text-right">CANTIDAD</th>
        <th class="text-right">COMPRA</th>
        <th class="text-right">VENTA</th>
        <th class="text-right">MARGEN</th>
      </thead>
      <tbody>
      <?php $cve_qcv=0;$cve_mtcv=0;$cve_mtv=0;
      for ($i=0; $i <count($data['cve']) ; $i++) { 
            $cve_qcv+=$data['cve'][$i]['cve_qcv'];
            $cve_mtcv+=$data['cve'][$i]['cve_mtcv'];
            $cve_mtv+=$data['cve'][$i]['cve_mtv'];?>
          <tr>
          <td><?= $i+1 ?></td>
            <td><?= $data['cve'][$i]['cve_bie_id']['bie_nombre']?></td>
            <td class="text-right"><?= $data['cve'][$i]['cve_qcv']?></td>
            <td class="text-right"><?= formatMoney($data['cve'][$i]['cve_mtcv'])?></td>
            <td class="text-right"><?= formatMoney($data['cve'][$i]['cve_mtv'])?></td>
            <td class="text-right"><?= formatMoney($data['cve'][$i]['cve_margen'])?></td>
          </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2">SUBTOTAL</td>
          <td class="text-right"><?= $cve_qcv?></td>
          <td class="text-right"><?= formatMoney($cve_mtcv)?></td>
          <td class="text-right"><?= formatMoney($cve_mtv)?></td>
          <td></td>
        </tr>
      </tfoot>
    </table>
  </div>
</body> 
</html>