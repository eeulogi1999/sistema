<?php 
    headerAdmin($data); 
    getModal('modalMovimientos',$data);
    getModal('modalBienes',$data);
    getModal('modalPersonas',$data);
    getModal('modalAgentes',$data);
    getModal('modalEmpresas',$data);
    getModal('modalTableBie',$data);
    getModal('modalTableAge',$data);
    getModal('modalDescuentos',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <h4>
          <i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
          <?php if($_SESSION['perMod']['gtp_w']){ ?>
            <button class="btn btn-primary" type="button" onclick="openModalMov();"><i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
          <?php } ?>
        </h4>
        <div class="d-flex">
          <h5 class="mr-1 d-flex align-items-end">Periodo</h5>
          <input class="form-control" style="width: 170px;" type="month" id="periodo" name="periodo"
                    onkeypress="return controlTag(event);">   
        </div>
        <!-- <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<?= base_url(); ?>/tablas"><?= $data['page_title'] ?></a></li>
        </ul> -->
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                  <table class="table table-hover table-bordered table-sm " id="mov_table" width="100%"></table>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
   