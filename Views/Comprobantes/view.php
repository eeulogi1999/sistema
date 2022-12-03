<?php headerAdmin($data); ?>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-file-text-o"></i> <?= $data['page_title'] ?></h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<?= base_url(); ?>/pedidos"> Pedidos</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <?php
                if(empty($data['gcl'])){
                ?>
                <p>Datos no encontrados</p>
                <?php }else{
                    $gcl = $data['gcl'];
                    $com = $data['com']; 
                    $alm = $data['alm']; 
                    $est = $data['est'];
                    $rso_nomb = "";
                    $rsocial_nombre = "";
                    $Empresa_Persona = "";
                    $Empresa_Persona_d = "";
                    $direccion = "";            
                    if(empty($com['com_age_id']['age_gem_id'])){

                        $rso_nomb = "Nombre: ";
                        $rsocial_nombre = $com['com_age_id']['age_gpe_id']['gpe_nombre'];
                        $Empresa_Persona = "DNI: ";
                        $Empresa_Persona_d = $com['com_age_id']['age_gpe_id']['gpe_identificacion'];
                        $direccion = $com['com_age_id']['age_gpe_id']['gpe_direccion'];
                        $ciudad = $com['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_distrito'].' - '
                        .$com['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '
                        .$com['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'];
                        
                    }
                    if(empty($com['com_age_id']['age_gpe_id'])){
                        $rso_nomb = "Razon Social: ";
                        $rsocial_nombre = $com['com_age_id']['age_gem_id']['gem_razonsocial'];
                        $Empresa_Persona = "RUC: ";
                        $Empresa_Persona_d = $com['com_age_id']['age_gem_id']['gem_ruc'];
                        $direccion = $com['com_age_id']['age_gem_id']['gem_direccion'];
                        $ciudad = $com['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_distrito'].' - '
                        .$com['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '
                        .$com['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'];

                    }
                ?>
                <section id="sPedido" class="invoice">
                    <div class="row mb-4">
                        <div class="col-3">
                            <h2 class="page-header"><img
                                    src="<?= base_url();?>/.uploads/<?= ($com['com_est_id']['est_id'] > 1) ? $com['com_est_id']['est_logo'] : $gcl['gcl_imagen'];?>"
                                    width="190"></h2>
                        </div>

                        <div class="col-5 h-100 justify-content-center align-items-center">

                            <address class="text-center">
                                <strong c><?= $gcl['gcl_gem_id']['gem_razonsocial']; ?><br></strong>
                                <?= $gcl['gcl_gem_id']['gem_direccion']; ?><br>
                                Establecimiento: <?= $est['est_nombre'] ?><br>
                                <!-- <strong>   Telefono: </strong><br>
                                <strong>   Correo informes:</strong><br>
                                <strong>  Página:</strong> <br> -->
                            </address>
                        </div>

                        <div
                            class="col-4 border rounded border-secondary h-100 justify-content-center align-items-center py-3">
                            <div>
                                <h5 class="text-center text-uppercase">R.U.C. <?= $gcl['gcl_gem_id']['gem_ruc'] ?></h5>
                                <h5 class="text-center text-uppercase"><?= $com['com_t10_id']['t10_descripcion'];?></h5>
                                <h1 class="text-center"><?= $com['com_serie'].'-'.str_pad($com['com_numero'],8,0,STR_PAD_LEFT) ?></h1>
                            </div>
                        </div>
                    </div>
                    <div class="row invoice-info">

                        <div class="col-8 " style="height: 120px;">

                            <div
                                class="border rounded border-secondary h-100 justify-content-center align-items-center p-3">
                                <strong><?= $Empresa_Persona ?></strong> <?= $Empresa_Persona_d ?><br>
                                <strong><?= $rso_nomb?> </strong><?= $rsocial_nombre ?><br>
                                <strong> Direccion:</strong> <?= $direccion ?><br>
                                <strong> Ciudad:</strong> <?= $ciudad ?><br>
                                <!-- <strong> Email:</strong> <?= $cliente['correo']; ?> -->
                            </div>
                        </div>
                        <div
                                class="col-4 border rounded border-secondary h-100 justify-content-center align-items-center">
                            <div class=" p-3"  style="height: 118px;">
                                <b class="text-right">Fecha :</b> <?= $com['com_fechaE']; ?><br>
                                <b>Moneda: </b><?= $com['com_gt4_id']['gt4_descripcion']; ?><br>
                                <b>Monto:</b> <?= formatMoney($com['com_total']); ?>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 table-responsive">
                            <table id="tableformato" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center">Cantidad</th>
                                        <th class="text-left">Unidad Medida</th>
                                        <th class="text-left">Descripción</th>
                                        <th class="text-right">Precio Unitario</th>
                                        <th class="text-right">Importe</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                        $detalles = $com['com_cde'];
                                        if(count($detalles) > 0){
                                            foreach ($detalles as $producto) {
                                            ?>
                                    <tr>
                                        <td class="text-center"><?= $producto['cde_q']; ?></td>
                                        <td class="text-left"><?= $producto['cde_t6m_id']['t6m_descripcion']; ?></td>
                                        <td class="text-left">
                                            <?=  (!empty($producto['cde_ces_id'][0]['ces_descripcion'])) ? $producto['cde_ces_id'][0]['ces_descripcion'] :  'Falta Identificar'; ?>
                                        </td>
                                        <td class="text-right">
                                            <?=formatMoney($producto['cde_vu']) ?></td>
                                        <td class="text-right"><?=formatMoney($producto['cde_importe']) ?></td>
                                    </tr>
                                    <?php 
                                            }
                                        }
                                        $com['com_igv_id'] = json_decode($com['com_igv_id'],true);
                                    ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="4" class="text-right">Sub-Total:</th>
                                        <td class="text-right"><?= formatMoney($com['com_subtotal']) ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" class="text-right">Igv (18%):</th>
                                        <td class="text-right"><?= formatMoney($com['com_igv_id']['com_igv']) ?></td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" class="text-right">Total:</th>
                                        <td class="text-right"><?= formatMoney($com['com_total']) ?></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <div class="container  flex-row justify-content-center align-items-center" id="campoFirma"
                        style="display: none;">
                        <?php
                     if($registro['tcomprobante']=="Nota de Entrada"){ ?>
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



                        <?php }elseif ($registro['tcomprobante']=="Nota de Salida") {?>

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
                    <div class="row d-print-none mt-2">
                        <div class="col-12 text-right"><a id="print" onclick="myFunction()" class="btn btn-primary"
                                href="javascript:window.print('#sPedido');"><i class="fa fa-print"></i> Imprimir</a>
                        </div>
                    </div>
                    <div class="row d-print-none mt-2">
                        <div class="col-12 text-right"><a  class="btn btn-danger "
                                href="<?= base_url(); ?>/<?= $url?>"><i class="fas fa-arrow-left"></i> &nbsp &nbsp  Volver &nbsp &nbsp</a>
                        </div>
                    </div>
                </section>
                <?php } ?>
            </div>
        </div>
    </div>
</main>
<script>
    function myFunction() {
        document.getElementById("campoFirma").style.display = "block";
        setTimeout(function () {
            document.getElementById("campoFirma").style.display = "none";
        }, 500);
    }
</script>
<?php footerAdmin($data); ?>