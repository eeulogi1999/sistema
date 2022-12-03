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
                ?>
                <section id="sPedido" class="invoice">
                    <div class="row mb-4">
                        <div class="col-4">
                            <h2 class="page-header"><img src="<?= base_url();?>/.uploads/<?= $_SESSION['arrBusiness']['logo'] ?>" width="150"></h2>
                        </div>
                        <div class="col-4">
                            <h5 class="text-center">GUIA DE REMISION - REMITENTE</h5>
                            <h4 class="text-center"><?= $registro['num_operacion']; ?></h4>
                        </div>
                        <div class="col-4">
                            <h5 class="text-right">Fecha: <?= $registro['fecha_emision']; ?></h5>
                        </div>
                    </div>
                    <div class="row invoice-info">
                        <div class="col-4">
                            <h5 class="border-bottom">DATOS DE LA EMPRESA</h5>
                            <address>
                                <strong>Razon Social:</strong> <?= $empresaLocal['razonsocial']; ?><br>
                                <strong> Ruc:</strong> <?= $empresaLocal['ruc']; ?><br>
                                <strong> Direccion:</strong> <?= $empresaLocal['direccion']; ?><br>
                              
                            </address>
                        </div>
                        <div class="col-6">
                             <h5 class="border-bottom">PERSONAL ENCARGADO</h5>
                            <address>
                                <strong><?= $cliente['nombre']; ?></strong><br>
                                <strong> DNI:</strong> <?= $cliente['identificador']; ?><br>
                                <strong> Direccion:</strong> <?= $cliente['direccion']; ?><br>
                                <strong> Email:</strong> <?= $cliente['correo']; ?>
                            </address>
                        </div>
                        <div class="col-2">
                             <h5 class="border-bottom">RESUMEN DE DETALLE</h5>
                            <b>Moneda: </b><?= $registro['moneda']; ?><br>
                            <b>Monto:</b> <?= SMONEY.' '. formatMoney($registro['total']); ?>
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
                                                <td class="text-left"><?=  ($producto['descripcion']<>null) ? $producto['descripcion'] : $producto['articulo'] ; ?></td>
                                                <td class="text-right"><?= SMONEY.' '. formatMoney($producto['precio_unitario']) ?></td>
                                                <td class="text-right"><?= SMONEY.' '. formatMoney($producto['importe']) ?></td>
                                            </tr>
                                            <?php 
                                            }
                                        }
                                    ?>
                                </tbody>
                                <tfoot >
                                    <tr>
                                        <th colspan="4" class="text-right">Sub-Total:</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['subtotal']) ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" class="text-right">Igv:</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['igv']) ?></td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" class="text-right">Total:</th>
                                        <td class="text-right"><?= SMONEY.' '. formatMoney($registro['total']) ?></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="row d-print-none mt-2">
                        <div class="col-12 text-right"><a class="btn btn-primary"
                                href="javascript:window.print('#sPedido');"><i class="fa fa-print"></i> Imprimir</a>
                        </div>
                    </div>
                </section>
                <?php } ?>
            </div>
        </div>
    </div>
</main>
<?php footerAdmin($data); ?>