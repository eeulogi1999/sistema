<?php 
    headerAdmin($data); 
    getModal('modalSimulaciones',$data);
    getModal('modalMovimientos',$data);
    $data['pre']='mov';
    getModal('modalTable',$data);
?>
<main class="app-content">
  <div class="app-title">
    <h4>
      <i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
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
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="eve_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <h3 class="text-center">VOLUMEN VENTA NACIONAL</h3>
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="det_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
      <h3 class="text-center">VOLUMEN VENTA EXPORTACIÓN</h3>
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="exp_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>