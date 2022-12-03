<?php 
    headerAdmin($data); 
    //getModal('modalReportes',$data);
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
      </h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/tablas"><?= $data['page_title'] ?></a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
        <input class="form-control" type="text" id="url"  placeholder="ingrese el Enlace del ingemmet"><br>
        <button class="btn btn-success" id="reportGeneral" type="button" title="Exportar a Excel" onclick="buscards()"><span>Buscar</span></button>   

        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>