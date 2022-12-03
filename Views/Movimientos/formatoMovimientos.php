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
                if(empty($data['arrEmpresa'])){
                ?>
                <p>Datos no encontrados</p>
                <?php }else{
                    $cliente = $data['arrEmpresa'];
                    $empresaLocal = $data['arrEmpresaLocal']; 
                    $registro = $data['arrRegistro'];
                    $detalles = $data['arrDetalles'];
                    if ($registro['tcomprobante']=="Factura") {
                        $labelTdoc="RUC";
                        $labelnom="RAZON SOCIAL";
                    }else {
                        $labelTdoc="DNI";
                        $labelnom="NOMBRE";
                    }
                    
                    if ($_SESSION['t_movimiento']==1) {
                        $url="Entrada";
                    }else {
                        $url="Salida";
                    }
            
                ?>
                <section id="sPedido" class="invoice">
                    <div class="row mb-4">
                        <div class="col-3">
                            <h2 class="page-header"><img
                                    src="<?= base_url();?>/.uploads/<?= $_SESSION['arrBusiness']['logo'] ?>"
                                    width="190"></h2>
                        </div>

                        <div class="col-5 h-100 justify-content-center align-items-center">

                            <address class="text-center">
                                <strong c><?= $empresaLocal['razonsocial']; ?><br></strong>
                                <?= $empresaLocal['direccion']; ?><br>
                                <?= $_SESSION['arrAlmacen']['nombre'];?><br>
                                <!-- <strong>   Telefono: </strong><br>
                                <strong>   Correo informes:</strong><br>
                                <strong>  Página:</strong> <br> -->
                            </address>
                        </div>

                        <div
                            class="col-4 border rounded border-secondary h-100 justify-content-center align-items-center py-3">
                            <div>
                                <h5 class="text-center text-uppercase">R.U.C. <?= $empresaLocal['ruc']; ?></h5>
                                <h5 class="text-center text-uppercase"><?= $registro['tcomprobante']?></h5>
                                <h1 class="text-center"><?= $registro['num_operacion']  ?></h1>
                            </div>
                        </div>
                    </div>
                    <div class="row invoice-info">

                        <div class="col-8 " style="height: 120px;">

                            <div
                                class="border rounded border-secondary h-100 justify-content-center align-items-center p-3">
                                <!--<strong> <?= $labelTdoc?>:</strong> <?= $cliente['identificador']; ?><br> -->
                                <strong><?= $labelnom?>:</strong><?= $cliente['nombre']; ?><br>

                                <strong> Direccion:</strong> <?= $cliente['direccion']; ?><br>
                                <!-- <strong> Email:</strong> <?= $cliente['correo']; ?> -->
                            </div>
                        </div>
                        <div
                                class="col-4 border rounded border-secondary h-100 justify-content-center align-items-center">
                            <div class=" p-3"  style="height: 118px;">
                                <b class="text-right">Fecha :</b> <?= $registro['fecha_emision']; ?><br>
                                <b>Moneda: </b><?= $registro['moneda']; ?><br>
                                <b>Monto:</b> <?= SMONEY.' '. formatMoney($registro['total']); ?>
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
                                        if(count($detalles) > 0){
                                            foreach ($detalles as $producto) {
                                            ?>
                                    <tr>
                                        <td class="text-center"><?= $producto['cantidad'] ?></td>
                                        <td class="text-left"><?= $producto['um'] ?></td>
                                        <td class="text-left">
                                            <?=  ($producto['descripcion']<>null) ? $producto['descripcion'] : $producto['articulo'] ; ?>
                                        </td>
                                        <td class="text-right">
                                            <?= SMONEY.' '. formatMoney($producto['precio_unitario']) ?></td>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($producto['importe']) ?></td>
                                    </tr>
                                    <?php 
                                            }
                                        }
                                    ?>
                                </tbody>
                                <tfoot>

                                    <tr>

                                        <?php 
                                        if ($registro['operacion_id']==132 || $registro['operacion_id']==133) {
                                          
                                        
                                        ?>
                                        <th colspan="4" class="text-right">Total:</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['subtotal']) ?>
                                        </td>
                                        <?php }else {?>
                                    <tr>
                                        <th colspan="4" class="text-right">Sub-Total:</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['subtotal']) ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" class="text-right">Igv (18%):</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['igv']) ?></td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" class="text-right">Total:</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['total']) ?></td>
                                    </tr>
                                    <?php }?>
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