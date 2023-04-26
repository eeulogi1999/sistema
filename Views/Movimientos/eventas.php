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
    <div class="col-md-6">
      <div class="tile">
        <h3 class="text-center">VOLUMEN VENTA NACIONAL</h3>
        <div class="tile-body">
          <select name="vol_trim" id="vol_trim" class="form-control w-auto ml-2" onChange="hisTrim(event)">
              <option value="">SELECCIONE</option>
              <option value="'2022-12-01' AND '2023-02-28'">DICIEMBRE-FEBRERO</option>
              <option value="'2023-03-01' AND '2023-05-31'">MARZO-MAYO</option>
              <option value="'2023-06-01' AND '2023-07-31'">JUNIO-AGOSTO</option>
              <option value="'2023-08-01' AND '2023-10-30'">SETIEMBRE-NOVIEMBRE</option>
            </select>
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="det_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-6">
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
  <div class="row">
  <div class="col">
      <div class="tile">
        
      <h3 class="text-center">VENTAS POR USUARIO</h3>
      <div class="tile-body">
    
      <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="rgu_table" width="100%"></table>
          </div>
     </div>
    </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>