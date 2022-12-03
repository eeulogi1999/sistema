<?php 
    headerAdmin($data); 
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?></h1>
    </div>
    <div class="d-flex app-title-center pt-1">
      <input class="form-control" style="width: 200px;" type="month" id="mesPeriodo" name="mesPeriodo"
            onkeypress="return controlTag(event);" value="<?= (isset($data['periodo'])) ? $data['periodo'] : '' ?>">&nbsp;
      <button class="btn btn-primary" onclick="location.href = base_url+'/CierreMes/productosMes/'+document.querySelector('#mesPeriodo').value;">
      <i class="fas fa-cog"></i>Buscar</button>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/cierreMes"><?= $data['page_title'] ?></a></li>
    </ul>
  </div>
  <?php if ($data['status']) { ?>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-sm table-bordered" id="tableContent">
              <thead class="text-center">
                <tr>
                  <th>N°</th>
                  <th colspan="4">INFORMACION DEL PRODUCTO</th>
                  <th colspan="4">UNIDADES</th>
                  <th colspan="4">VALORIZADOS</th>
                  <th></th>
                </tr>
                <tr>
                  <th>N°</th>
                  <th>COD.</th>
                  <th>DESCRIPCION</th>
                  <th>U. M.</th>
                  <th>V. U.</th>
                  <th>INICIAL</th>
                  <th>ING.</th>
                  <th>SAL.</th>
                  <th>FIN</th>
                  <th>INICIAL</th>
                  <th>ING.</th>
                  <th>SAL.</th>
                  <th>FINAL</th>
                  <th>ACCIONES</th>
                </tr>
              </thead>
              <tbody>
                <?php  
                $qs = 0;
                $qc = 0;
                $qv = 0;
                $mts = 0;
                $mtc = 0;
                $mtv = 0;
                $mtff = 0;
                $qff = 0;
                foreach ($data['arrData'] as $key => $registro) {
                  $qf = $registro['cie_qs']+$registro['cie_qc']-$registro['cie_qv'];
                  $mtf = $registro['cie_mts']+$registro['cie_mtc']-$registro['cie_mtv'];
                  if ($registro['cie_mts']!= 0 || $registro['cie_mtc']!= 0 || $registro['cie_mtv']!= 0) {
                    $qs += $registro['cie_qs'];
                    $qc += $registro['cie_qc'];
                    $qv += $registro['cie_qv'];
                    $mts += $registro['cie_mts'];
                    $mtc += $registro['cie_mtc'];
                    $mtv += $registro['cie_mtv'];
                    $mtff += $mtf;
                    $qff += $qf;
                  ?>
                  <tr>
                    <td><?=$registro['cie_nro']?></td>
                    <td><?=$registro['cie_bie_id']['bie_codigo']?></td>
                    <td><?=$registro['cie_bie_id']['bie_nombre']?></td>
                    <td><?=$registro['cie_bie_id']['bie_t6m_id']['t6m_descripcion']?></td>
                    <td class="text-right"><?= number_format(($mts+$mtc)/($qs+$qc),2,'.',',')?></td>
                    <td class="text-right"><?= number_format($registro['cie_qs'],2,".",",") ?></td>
                    <td class="text-right"><?= number_format($registro['cie_qc'],2,".",",") ?></td>
                    <td class="text-right"><?= number_format($registro['cie_qv'],2,".",",") ?></td>
                    <td class="text-right"><?= number_format($qf,2,".",",") ?></td>
                    <td class="text-right"><?= formatMoney($registro['cie_mts'])?></td>
                    <td class="text-right"><?= formatMoney($registro['cie_mtc'])?></td>
                    <td class="text-right"><?= formatMoney($registro['cie_mtv'])?></td>
                    <td class="text-right"><?= formatMoney($mtf)?></td>
                    <td>
                      <a class="btn btn-info btn-sm" href="<?= base_url()?>/CierreMes/productoHistorico/<?= $registro['cie_bie_id']['bie_codigo']?>" target="_blank" title="Ver Articulo"><i class="far fa-eye"></i></button>
                    </td>
                  </tr>
                <?php 
                    }
                } 
                ?>
              </tbody>
              <tfoot>
                <td colspan="5">TOTAL</td>
                <td class="text-right"><?=$qs?></td>
                <td class="text-right"><?=$qc?></td>
                <td class="text-right"><?=$qv?></td>
                <td class="text-right"><?=$qff?></td>
                <td class="text-right"><?=formatMoney($mts)?></td>
                <td class="text-right"><?=formatMoney($mtc)?></td> 
                <td class="text-right"><?=formatMoney($mtv)?></td>
                <td class="text-right"><?=formatMoney($mtff)?></td> 
                <td></td>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php }  ?>
</main>
<?php footerAdmin($data); ?>