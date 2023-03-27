<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
    <meta name="description" content="Sistema CompanyCacel">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Eduardo Eulogio">
    <meta name="theme-color" content="#009688">
    <link rel="shortcut icon" href="<?= media();?>/images/logo_<?= CID?>.png">
    <title>Formato</title>
    <!-- Main CSS-->
    <!-- <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/bootstrap-select.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <div class="container tile">
            <?php
                if(empty($data['gcl'])){
                ?>
            <p>Datos no encontrados</p>
            <?php }else{
                    $gcl = $data['gcl'];
                    $mov = $data['mov']; 
                    $alm = $data['alm'];     
                ?>
                <section id="sPedido" class="invoice">
                <div class="row mb-4">
                    <div class="col-3">
                        <div>
                            <img src="<?= base_url();?>/.uploads/<?= (!empty($alm['alm_est_id']['est_logo'])) ? $alm['alm_est_id']['est_logo'] : $gcl['gcl_imagen'];?>" width="200">
                        </div>
                    </div>
                    <div class="col-5 align-items-center">
                        <address class="text-center">
                            <h4><strong c><?= $gcl['gcl_gem_id']['gem_razonsocial']; ?><br></strong></h4>
                            <?= $gcl['gcl_gem_id']['gem_direccion']; ?><br>
                            Almacen: <?= $alm['alm_est_id']['est_nombre'].' - '.$alm['alm_nombre'] ?><br>
                            <strong> Ciudad:</strong> <?= $alm['alm_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].'-'.
                            $alm['alm_gdi_id']['gdi_gpr_id']['gpr_provincia'].'-'.
                            $alm['alm_gdi_id']['gdi_distrito']?><br>
                            <strong> Direccion:</strong> <?= $alm['alm_direccion']?><br>
                        </address>
                    </div>
                    <div class="col-4 border rounded border-secondary align-items-center py-3">
                        <div>
                            <h5 class="text-center text-uppercase">R.U.C. <?= $gcl['gcl_gem_id']['gem_ruc'] ?></h5>
                            <h5 class="text-center text-uppercase"><?= $mov['mov_t10_id']['t10_descripcion'];?></h5>
                            <?php if( $mov['mov_tipo'] == 4){ ?>
                                <h1 class="text-center"><?= $mov['mov_serie'] ?></h1>
                            <?php }else{?>
                                <h1 class="text-center"><?= $mov['mov_serie'].'-'.str_pad($mov['mov_numero'],8,0,STR_PAD_LEFT) ?></h1>
                            <?php } ?>
                            <h5 class="text-center text-danger" >N° OPERACION: <strong><?= $mov['mov_tipo'].'-'.date( "m", strtotime($mov['mov_fechaE'])).str_pad($mov['mov_t12num'],6,0,STR_PAD_LEFT) ?></strong></h5>
                        </div>
                    </div>
                </div>
                <div class="row invoice-info">
                    <div class="col-8 " >
                        <?php if ($mov['mov_t12_id']['t12_id']<3) { ?>
                            <div class="border rounded border-secondary h-115 justify-content-center align-items-center p-3">
                                <strong><?= !isset($mov['mov_age_id']['age_gem_id'])?'Razón Social ':'Nombre:' ?></strong> <?= $mov['mov_age_id']['age_nombre'] ?><br>
                                <strong><?= !isset($mov['mov_age_id']['age_gem_id'])?'RUC ':'Identificacion:' ?> </strong><?= $mov['mov_age_id']['age_ide'] ?><br>
                                <strong> Direccion:</strong> <?= !isset($mov['mov_age_id'])?'':$mov['mov_age_id']['age_direccion'] ?><br>
                                <strong> Ciudad:</strong> <?= !isset($mov['mov_age_id'])? '':$mov['mov_age_id']['age_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].'-'.
                                $mov['mov_age_id']['age_gdi_id']['gdi_gpr_id']['gpr_provincia'].'-'.
                                $mov['mov_age_id']['age_gdi_id']['gdi_distrito'] ?><br>
                        <?php } else {?>
                            <div class="border rounded border-secondary h-115 justify-content-center align-items-center p-3">
                                <strong>Razón Social:</strong><br>
                                <strong>Identificacion:</strong><br>
                                <strong>Direccion:</strong><br>
                                <strong>Ciudad:</strong><br> 
                        <?php }?>
                        <strong>Registrado Por:</strong><?= (!empty($mov['mov_gus_id'])) ? $mov['mov_gus_id']['gus_gpe_id']['gpe_nombre'] : ''?>
                        </div>
                    </div>
                    <div class="col-4 border rounded border-secondary h-115 justify-content-center align-items-center">
                        <div class=" p-3" style="height: 118px;">
                            <b class="text-right">Fecha Emisión:</b> <?= $mov['mov_fechaE']; ?><br>
                            <b class="text-right">Fecha Venc.:</b> <?= $mov['mov_fechaV']; ?><br>
                            <b>Moneda: </b><?= $mov['mov_gt4_id']['gt4_descripcion']; ?><br>
                            <b>Monto:</b> <?= formatMoney($mov['mov_total'],$mov['mov_gt4_id']); ?><br>
                            <b>Cuenta:</b> <?= (!empty($mov['mov_cue_id']))?$mov['mov_cue_id']['cue_nombre']:''; ?>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table id="tableformato" class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="text-center">Cantidad</th>
                                    <th class="text-center">Codigo</th>
                                    <th class="text-left">Unidad Medida</th>
                                    <th class="text-left">Material Origen</th>
                                    <?php if ($mov['mov_t12_id']['t12_id']==18) { ?>
                                        <th class="text-left">Material Destino</th>
                                    <?php } ?>
                                    <th class="text-right">Precio Unitario</th>
                                    <th class="text-right">Importe</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $detalles = $mov['mov_mde_id'];
                                if(count($detalles) > 0){
                                    foreach ($detalles as $producto) {
                                    ?>
                                <tr>
                                    <td class="text-center"><?= number_format($producto['mde_q'], 2,'.','') ?></td>
                                    <td class="text-center"> <a href="#" onclick="ftnViewBie(<?= $producto['mde_bie_id']['bie_id'] ?>)" ><?= $producto['mde_bie_id']['bie_codigo'] ?></a></td>
                                    <td class="text-left"><?= $producto['mde_t6m_id']['t6m_descripcion']; ?></td>
                                    <td class="text-left"><?= $producto['mde_bie_id']['bie_nombre'] ?></td>
                                    <?php if ($mov['mov_t12_id']['t12_id']==18) { ?>
                                        <td class="text-left"><?= $producto['mde_f_bie_id']['bie_nombre']; ?></td>
                                    <?php } ?>
                                    <td class="text-right"><?=formatMoney($producto['mde_vu'],$mov['mov_gt4_id']) ?></td>
                                    <td class="text-right"><?=formatMoney($producto['mde_importe'],$mov['mov_gt4_id']) ?></td>
                                </tr>
                                <?php 
                                    }
                                }
                                        $mov['mov_igv_id'] = json_decode($mov['mov_igv_id'],true);
                                    ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="<?= ($mov['mov_t12_id']['t12_id']==18)?4:3?>"> <strong>OBSERVACIONES: </strong></td>
                                    <td colspan="2" class="text-right">Sub-Total:</td>
                                    <td class="text-right"><?= formatMoney($mov['mov_subtotal'],$mov['mov_gt4_id']) ?></td>
                                </tr>
                                <tr>
                                    <td colspan="<?= ($mov['mov_t12_id']['t12_id']==18)?4:3?>" rowspan="2"><p><?= $mov['mov_observaciones'] ?></p></td>
                                    <td colspan="2" class="text-right">Igv (18%):</td>
                                    <td class="text-right"><?= formatMoney($mov['mov_igv_id']['mov_igv'],$mov['mov_gt4_id']) ?></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-right">Total:</td>
                                    <td class="text-right"><?= formatMoney($mov['mov_total'],$mov['mov_gt4_id']) ?></td>
                                </tr>
                                <?php if (isset($mov['mov_igv_id']['mov_neto'])) { ?>
                                <tr>
                                    <td colspan="<?= ($mov['mov_t12_id']['t12_id']==18)?6:5?>" class="text-right">Neto a Pago:</td>
                                    <td class="text-right"><?= formatMoney($mov['mov_igv_id']['mov_neto'],$mov['mov_gt4_id']) ?></td>
                                </tr>
                                <?php } ?>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="container  flex-row justify-content-center align-items-center" id="campoFirma"
                    style="display: none;">
                    <?php
                     if($mov['mov_tipo']=="01"){ ?>
                    <div class="d-flex flex-row justify-content-center align-items-center">
                        <div class="row text-center">
                            <div class="col-md-6 ">
                                <h5>ALMACEN</h5>
                                <div class="border border-dark" style="padding: 3rem 10rem !important">
                                </div>
                            </div>
                            <div class="col-md-6 ">
                                <h5>CONFORMIDAD</h5>
                                <div class="border border-dark" style="padding: 3rem 10rem !important">
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php }elseif ($mov['mov_tipo']=="02") {?>
                    <div class="d-flex flex-row justify-content-center align-items-center">
                        <div class="text-center">
                            <div class="text-center">
                                <h5>CONTROL</h5>
                                <div class="border border-dark" style="padding: 3rem 10rem !important">
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </section>
            <?php } ?>
        </div>
    </div>
</div>
</body>
</html>
