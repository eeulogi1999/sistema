<?php 
    headerAdmin($data); 
    getModal('modalSimulaciones',$data);
    getModal('modalMovimientos',$data);
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
        <h3 class="text-center">EXPORTACION</h3>
        <div class="tile-body">
        <h4>
          <?php if($_SESSION['perMod']['gtp_w']){ ?>
            <button class=" ml-2 btn btn-primary" type="button" onclick="openModalC(1);"><i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
          <?php } ?>
        </h4>
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="sim_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
      <h3 class="text-center">VENTA NACIONAL</h3>
        <div class="tile-body">
        <h4>
          <?php if($_SESSION['perMod']['gtp_w']){ ?>
            <button class=" ml-2 btn btn-primary" type="button" onclick="openModalC(2);"><i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
          <?php } ?>
        </h4>
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="nac_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>