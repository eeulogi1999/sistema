<?php 
    headerAdmin($data); 
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?></h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/cierreMes"><?= $data['page_title'] ?></a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered fs-1" id="tableContent">
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
                  <th>CODIGO</th>
                  <th>DESCRIPCION</th>
                  <th>U. M.</th>
                  <th>V. U.</th>
                  <th>INICIAL</th>
                  <th>INGRESO</th>
                  <th>SALIDA</th>
                  <th>FINAL</th>
                  <th>INICIAL</th>
                  <th>INGRESO</th>
                  <th>SALIDA</th>
                  <th>FINAL</th>
                  <th>ACCIONES</th>
                </tr>
              </thead>
              <tbody>
                
                <?php  foreach ($data['arrData'] as $key => $registro) {?>
                  <tr>
                    <td><?=$registro['i']?></td>
                    <td><?=$registro['articulo']['codigo']?></td>
                    <td><?=$registro['articulo']['nombre']?></td>
                    <td><?=$registro['articulo']['um_id']?></td>
                    <td><?=$registro['articulo']['precio']?></td>
                    <td><?=$registro['qs']?></td>
                    <td><?=$registro['qc']?></td>
                    <td><?=$registro['qv']?></td>
                    <td><?=$registro['qs']+$registro['qc']-$registro['qv']?></td>
                    <td><?=$registro['mts']?></td>
                    <td><?=$registro['mtc']?></td>
                    <td><?=$registro['mtv']?></td>
                    <td><?=$registro['mts']+$registro['mtc']-$registro['mtv']?></td>
                    <td>
                      <button class="btn btn-info btn-sm" onClick="fntViewInfo(<?=$registro['articulo']['id_articulo']?>)" title="Ver Articulo"><i class="far fa-eye"></i></button>
                    </td>
                  </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>