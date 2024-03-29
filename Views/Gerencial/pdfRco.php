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
  <style>
    .header {
      position: absolute;
      right: 0 !important;
      top: 0 !important;
    }
  </style>
</head>
<body>
  <div class='position-relative'>
    <div class="header">
      <img src="<?= base_url() ?>/.uploads/<?= $_SESSION['alm']['alm_est_id']['est_logo'] ?>" alt="Logo" width="120">
    </div>
  </div>
  <table class="table table-borderless table-sm " width="100%">
    <tr>
      <td colspan="2" class='text-center'>
        <h2>RESUMEN Y COMISIONES</h2>
      </td>
    </tr>
    <tr>
      <td><strong class="text-white bg-info py-2 pl-2 mr-2 border rounded">AGENTE:
        </strong><?=$data['age']['age_gpe_id']['gpe_nombre'].', '.$data['age']['age_gpe_id']['gpe_apellidos']?></td>
      <td></td>
    </tr>
    <tr>
      <td><strong class="text-white bg-info py-2 pl-2 mr-2 border rounded">DIRECCION:
        </strong><?=$data['age']['age_gpe_id']['gpe_direccion'].'- '.$data['age']['age_gpe_id']['gpe_gdi_id']['gdi_distrito']?>
      </td>
      <td></td>
    </tr>
    <tr>
      <td><strong class="text-white bg-info py-2 pl-2 mr-2 border rounded">PERIODO: </strong><?=$_SESSION['periodo']?></td>
      <td class="text-right"><?=date('Y-m-d h:m')?></td>
    </tr>
  </table>
  <div class="table-responsive">
    <table class="table table-hover table-bordered table-sm " id="res" width="100%">
      <thead class="text-white bg-info">
        <th>#</th>
        <th>MATERIAL</th>
        <th class="text-right">CANTIDAD</th>
        <th class="text-right">PRECIO PROMEDIO</th>
        <th class="text-right">TOTAL SOLES</th>
        <th>PORCENTAJE</th>
        <th>RESULTADO</th>
      </thead>
      <tbody>
        <?php  $res_sum=0;
        for ($i=0; $i <count($data['rco']) ; $i++) { 
          $res_sum+=$data['rco'][$i]['rco_pt'];?>
        <tr>
          <td><?= $i+1 ?></td>
          <td><?= $data['rco'][$i]['rco_bie_id']['bie_nombre']?></td>
          <td class="text-right"><?= number_format($data['rco'][$i]['rco_q'],2,'.',',')?></td>
          <td class="text-right"><?= formatMoney($data['rco'][$i]['rco_pp'])?></td>
          <td class="text-right"><?= formatMoney($data['rco'][$i]['rco_st'])?></td>
          <td class="text-right"><?= number_format($data['rco'][$i]['rco_porc_b'],2,'.',',')?></td>
          <td class="text-right"><?= formatMoney($data['rco'][$i]['rco_st']*($data['rco'][$i]['rco_porc_b']/100))?></td>
        </tr>
        <?php } ?>
      </tbody>
      <tfoot class="text-danger">
        <tr>
          <td colspan="6">SUBTOTAL RESULTADO</td>
          <td class="text-right"><?= formatMoney($res_sum)?></td>
        </tr>
      </tfoot>
    </table>
  </div>
</body>

</html>