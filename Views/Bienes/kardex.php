<?php headerAdmin($data); ?>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-file-text-o"></i>Kardex - </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<?= base_url(); ?>/pedidos"> Pedidos</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <section id="sPedido" class="invoice">
                    </table>
                        <tr>
                            <td rowspan="3" >COD REGISTRO</td>
                            <td rowspan="2" colspan="4">DOCUMENTO DE TRASLADO, COMPROBANTE DE PAGO, DOCUMENTO INTERNO O SIMILAR</td>
                            <td rowspan="3">TIPO DE <br> OPERACION <br> (TABLA 12)</td>
                            <td colspan="3">ENTRADAS</td>
                            <td colspan="3">SALIDAS</td>
                            <td colspan="3">SALDO FINAL</td>
                        </tr>
                        <tr>
                            <td rowspan="2">CANTIDAD</td>
                            <td rowspan="2">COSTO UNITARIO</td>
                            <td rowspan="2">COSTO TOTAL</td>
                            <td rowspan="2">CANTIDAD</td>
                            <td rowspan="2">COSTO UNITARIO</td>
                            <td rowspan="2">COSTO TOTAL</td>
                            <td rowspan="2">CANTIDAD</td>
                            <td rowspan="2">COSTO UNITARIO</td>
                            <td rowspan="2">COSTO TOTAL</td>
                        </tr>
                        <tr>
                            <td>FECHA</td>
                            <td>TIPO (TABLA 10)</td>
                            <td>SERIE</td>
                            <td>NÚMERO</td>
                        </tr>
                        <?php
                        $i = 1;
                        $qc = 0;
                        $qv = 0;
                        $tc = 0;
                        $tv = 0;
                        foreach ($data['mde'] as $key => $e) {
                            if ($e['mde_mov_id']['mov_tipo']=='1') {
                                $qsaldo += floatval($e['mde_q']);
                                $comprai = floatval($e['mde_importe']);
                                $precio = floatval($e['mde_p']);
                                $tsaldo += floatval($e['mde_importe']);  
                                ?>
                                <tr>
                                    <td><?=$i?></td>
                                    <td><?=$e['mde_mov_id']['mov_fechaE']?></td>
                                    <td>'<?=$e['mde_mov_id']['mov_t10_id']['t10_codigo']?></td>
                                    <td><?=$e['mde_mov_id']['mov_serie']?></td>
                                    <td>'<?=$e['mde_mov_id']['mov_numero']?></td>
                                    <td>'<?=$e['mde_mov_id']['mov_t12_id']['t12_codigo']?></td>
                                    <td><?=$$e['mde_q'];?></td>
                                    <td><?=SMONEY.' '.formatMoney($precio);?></td>
                                    <td><?=SMONEY.' '.formatMoney($comprai);?></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><?=$qsaldo?></td>
                                    <td><?=SMONEY.' '.formatMoney(($tsaldo<0.5)?0:$tsaldo/$qsaldo);?></td>
                                    <td><?=SMONEY.' '.formatMoney($tsaldo);?></td>
                                </tr>
                                <?php
                                $qc+= floatval($e['mde_q']);
                                $tc+= floatval($comprai);
                                }
                            if ($e['mde_mov_id']['mov_tipo']=='2') {
                                $cpu = $tsaldo/$qsaldo;
                                $mtcv = $e['mde_q']*$cpu;
                                $qsaldo -= floatval($e['mde_q']);
                                $tsaldo -= $mtcv;
                                ?>
                                <tr>
                                    <td><?=$i?></td>
                                    <td><?=$e['mde_mov_id']['mov_fechaE']?></td>
                                    <td>'<?=$e['mde_mov_id']['mov_t10_id']['t10_codigo']?></td>
                                    <td><?=$e['mde_mov_id']['mov_serie']?></td>
                                    <td>'<?=$e['mde_mov_id']['mov_numero']?></td>
                                    <td>'<?=$e['mde_mov_id']['mov_t12_id']['t12_codigo']?></td>
                                    <td></td><td></td><td></td>
                                    <td><?=$e['mde_q']?></td>
                                    <td><?=SMONEY.' '.formatMoney($cpu)?></td>
                                    <td><?=SMONEY.' '.formatMoney($mtcv)?></td>
                                    <td><?=$qsaldo?></td>
                                    <td><?=SMONEY.' '.formatMoney(($tsaldo<0.5)?0:$tsaldo/$qsaldo)?></td>
                                    <td><?=SMONEY.' '.formatMoney($tsaldo)?></td>
                                </tr>
                                <?php
                                $qv+= floatval($e['mde_q']);
                                $tv+= floatval($mtcv);
                            }
                            $i++;
                            } 
                            $tp_entrada += $tc;
                            $tp_salida += $tv;
                            $tp_valorizado += $tsaldo;
                            ?>
                        <tr>
                            <td>TOTALES</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><?=$qc?></td>
                            <td></td>
                            <td><?=SMONEY.' '.formatMoney($tc);?></td>
                            <td><?=$qv?></td>
                            <td></td>
                            <td><?=SMONEY.' '.formatMoney($tv);?></td>
                            <td><?=$qsaldo?></td>
                            <td></td>
                            <td></td> 
                        </tr>
                    </table>
                </section>
            </div>
        </div>
    </div>
</main>
<?php footerAdmin($data); ?>