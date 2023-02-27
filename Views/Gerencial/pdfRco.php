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
    .header{
      position: absolute;
      right: 0 !important;
      top: 0 !important;
    }
  </style>
</head>
<body>
  <div class='position-relative'>
    <div class="header">
      <img src="<?= base_url() ?>/.uploads/<?= $_SESSION['alm']['alm_est_id']['est_logo'] ?>" alt="Logo" width="70">
    </div>
  </div>
  <table class="table table-borderless table-sm" width="100%">
    <tr>
      <td colspan="2" class='text-center'><h1>RESUMEN MENSUAL</h1></td>
    </tr>
    <tr>
      <td><strong>Empresa: </strong><?=$_SESSION['gcl']['gcl_gem_id']['gem_razonsocial']?></td>
      <td></td>
    </tr>
    <tr>
      <td><strong>Almacen: </strong><?=$_SESSION['alm']['alm_nombre']?></td>
      <td></td>
    </tr>
    <tr>
      <td><strong>Periodo: </strong><?=$_SESSION['periodo']?></td>
      <td class="text-right"><?=date('Y-m-d h:m')?></td>
    </tr>
  </table>
  <div class="table-responsive">
    <table class="table table-hover table-bordered table-sm " id="res" width="100%">
      <thead>
        <th>#</th>
        <th>DESCRIPCION</th>
        <th class="text-right">MONTO</th>
      </thead>
      <tbody>
        <?php  $res_sum=0;
        for ($i=0; $i <count($data['rco']) ; $i++) { 
          $res_sum+=$data['rco'][$i]['res_total'];?>
        <tr>
          <td><?= $i+1 ?></td>
          <td><?= $data['rco'][$i]['res_descripcion']?></td>
          <td class="text-right"><?= formatMoney($data['rco'][$i]['res_total'])?></td>
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
</body>

</html>