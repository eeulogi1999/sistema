<?php 
    headerAdmin($data); 
    getModal('modalAdscripciones',$data);
    getModal('modalPersonas',$data);
    getModal('modalActivos',$data);
    getModal('modalAreas',$data);
    getModal('modalColaboradores',$data);
    getModal('modalUbicaciones',$data);
    $data['pre']='col';
    getModal('modalTable',$data);
    $data['pre']='ubi';
    getModal('modalTable',$data);
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
        <?php if($_SESSION['perMod']['gtp_w']){ ?>
        <button class="btn btn-primary" type="button" onclick="openmodal_ads();"><i class="fas fa-plus-circle"></i>
          Nuevo</button>
        <?php } ?>
      </h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/adscripciones"><?= $data['page_title'] ?></a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="ads_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>