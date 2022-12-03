<style>
    .fil_2 p {
        margin: 1px;
    }

    .title-p {
        font-size: 10px;
        text-transform: uppercase;
    }
</style>


<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <?php
                if(empty($data['gcl'])){
                ?>
            <p>Datos no encontrados</p>
            <?php }else{
                    $gcl = $data['gcl'];
                    $mov = $data['mov']; 
                    $alm = $data['alm'];     
                ?>


            <?php if($mov['mov_t10_id']['t10_id']=="49"){
                $titlconcmov="CONCEPTO DE ENTRADA";
                 $conceptomov="ENTRADA A PRODUCCION";
                 $responsable="BENITO";
                }else if ($mov['mov_t10_id']['t10_id']=="50") {
                $titlconcmov="CONCEPTO DE SALIDA";
                $conceptomov="SALIDA A PRODUCCION";
                $responsable="PABLITO";
             } ?>
            <section id="sPedido" class="invoice">
                <div class="row">
                    <div class="col-3">
                        <div class="page-header">
                            <img src="<?= base_url();?>/.uploads/<?= (!empty($alm['alm_est_id']['est_logo'])) ? $alm['alm_est_id']['est_logo'] : $gcl['gcl_imagen'];?>"
                                width="190">
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="  justify-content-center ">
                            <div class="d-flex text-center pt-1" style="justify-content: space-evenly;">
                                <h3 class="text-center text-uppercase"><?= $mov['mov_t10_id']['t10_descripcion'];?></h3>
                                <h2 class="text-info">
                                    <?= $mov['mov_serie'].'-'.str_pad($mov['mov_numero'],8,0,STR_PAD_LEFT) ?></h2>
                            </div>

                            <div class="row  align-items-center py-3 pl-3">

                                <div class="col-7 ">
                                    <p class="mb-1 text-uppercase"> <strong>R.U.C.</strong>
                                        <?= $gcl['gcl_gem_id']['gem_ruc'] ?></p>
                                    <p class="mb-1 text-uppercase"><strong>Razon Social:</strong>
                                        <?= $gcl['gcl_gem_id']['gem_razonsocial']; ?></p>
                                    <p class="mb-1 text-uppercase "> <strong>DOMICILIO FISCAL:</strong>
                                        <?= $gcl['gcl_gem_id']['gem_direccion']; ?></p>

                                </div>
                                <div class="col-5">
                                    <p class="mb-1 "><strong>ALMACEN:</strong>
                                        <?= $alm['alm_est_id']['est_nombre'].' - '.$alm['alm_nombre'] ?></p>
                                    <p class="mb-1 "><strong>DIRECCIÓN: </strong> <?= $alm['alm_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].'-'.
                            $alm['alm_gdi_id']['gdi_gpr_id']['gpr_provincia'].'-'.
                            $alm['alm_gdi_id']['gdi_distrito']?></p>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row invoice-info mx-1 my-2">
                    <div class="fil_2 col-4 border rounded border-secondary  justify-content-center align-items-center">
                        <p class="title-p"><?=$titlconcmov?></p>
                        <P><?=$conceptomov?></P>
                    </div>
                    <div class="fil_2 col-4 border rounded border-secondary  justify-content-center align-items-center">
                        <p class="title-p">ENTREGADO A:</p>
                        <P><?=$responsable?></P>
                    </div>
                    <div class="fil_2 col-2 border rounded border-secondary  justify-content-center align-items-center">
                        <P class="title-p">FECHA:</P>
                        <P><?= $mov['mov_fechaE']; ?></P>
                    </div>
                    <div class="fil_2 col-2 border rounded border-secondary  justify-content-center align-items-center">
                        <p class="title-p">DOCUMENTO ASOCIADO:</p>
                        <p id="extradocdata" onmouseover="changelabelinput()" style="display:none"></p>
                        <input id="extradoc" type="text"  style="border: none;" onmouseout="changelabelout()">
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
                                    <th class="text-left">Descripción</th>
                                    <th class="text-right">Precio Unitario</th>
                                    <th class="text-right">Importe</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $detalles = $mov['mov_mde'];
                                if(count($detalles) > 0){
                                    foreach ($detalles as $producto) {
                                    ?>
                                <tr>
                                    <td class="text-center"><?= $producto['mde_q']; ?></td>
                                    <td class="text-center"> <a href="#"
                                            onclick="ftnViewBie(<?= $producto['mde_bie_id']['bie_id'] ?>)"><?= $producto['mde_bie_id']['bie_codigo'] ?></a>
                                    </td>
                                    <td class="text-left"><?= $producto['mde_t6m_id']['t6m_descripcion']; ?></td>
                                    <td class="text-left"><?= $producto['mde_bie_id']['bie_nombre'] ?>
                                    </td>
                                    <td class="text-right">
                                        <?=formatMoney($producto['mde_vu']) ?></td>
                                    <td class="text-right"><?=formatMoney($producto['mde_importe']) ?></td>
                                </tr>
                                <?php 
                                    }
                                }
                                        $mov['mov_igv_id'] = json_decode($mov['mov_igv_id'],true);
                                    ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="5" class="text-right">Total:</th>
                                    <td class="text-right"><?= formatMoney($mov['mov_total']) ?></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="container row justify-content-center align-items-center" id="campoFirma">
                    <?php
                     if($mov['mov_t10_id']['t10_id']=="49"){ ?>
                    <div class="d-flex row justify-content-center align-items-center">
                        <div class="d-flex text-center">
                            <div class="col-md-6 col-sm-6">
                                <h5>ALMACEN</h5>
                                <div class="border border-dark" style="padding: 3rem 10rem !important">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <h5>CONFORMIDAD</h5>
                                <div class="border border-dark" style="padding: 3rem 10rem !important">
                                </div>
                                .
                            </div>
                        </div>
                    </div>
                    <?php }elseif ($mov['mov_t10_id']['t10_id']=="50") {?>
                    <div class="d-flex row justify-content-center align-items-center">
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