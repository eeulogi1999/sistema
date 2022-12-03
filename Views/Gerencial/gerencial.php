<?php 
    headerAdmin($data); 
    // getModal('modalTableAge',$data);
    // getModal('modalAgentes',$data);
    // getModal('modalPersonas',$data);
    // getModal('modalEmpresas',$data);
    // getModal('modalliquidez',$data);
    getModal('modalMovimientos',$data);
    // getModal('modalCajas',$data);
    getModal('modalReportes',$data);
    getModal('modalTableBie',$data);
    getModal('modalTableLiq',$data);
    getModal('modalTableCue',$data);
?>
<main class="app-content">
  <div class="app-title">
    <h4>
      <i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
    </h4>
    <div class="d-flex">
      <button class="mr-3 btn btn-warning" onclick="cierre()" ><i class="fa fa-cog" aria-hidden="true"></i> CIERRE</button>
      <a class="mr-3 btn btn-danger" target="_blank" href="<?= base_url()?>/Gerencial/getPdf"><i class="far fa-file-pdf" aria-hidden="true"></i> PDF</a>
      <h5 class="mr-1 d-flex align-items-end">Periodo</h5>
      <input class="form-control" style="width: 170px;" type="month" id="periodo" name="periodo"
                onkeypress="return controlTag(event);">   
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive" style="height:0px">
            <table class="table table-hover table-bordered table-sm " id="res_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>