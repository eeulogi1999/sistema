<?php 
    headerAdmin($data); 
    getModal('modalTableAge',$data);
    getModal('modalAgentes',$data);
    getModal('modalPersonas',$data);
    getModal('modalEmpresas',$data);
    getModal('modalLiquidez',$data);
    getModal('modalMovimientos',$data);
    getModal('modalCajas',$data);
?>
<main class="app-content">
  <div class="app-title">
    <h4>
      <i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
      <button class="btn btn-primary" type="button" onclick="openModal('liq');"><i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
    </h4>
    <div class="d-flex">
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
            <table class="table table-hover table-bordered table-sm " id="liq_table" width="100%"></table>
            <!-- <div id="liq_table"></div> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>