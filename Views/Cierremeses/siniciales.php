<?php 
    headerAdmin($data); 
    getModal('modalSiniciales',$data);
    getModal('modalTableBie',$data);
    getModal('modalBienes',$data);
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <form id="formContent" name="formContent" class="form-horizontal">
        <div class="row">
          <div class="col-md-4"><h4><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?></h4></div>
          <div class="col-md-4">
            <input class="form-control" style="width: 200px;" type="month" id="mesPeriodo" name="mesPeriodo"
              onkeypress="return controlTag(event);">&nbsp;
          </div>
          <div class="col-md-1">
            <button class="btn btn-primary" type="button" onclick="procesarCierreMes();"><i class="fas fa-search"></i></button>
          </div>
          <div class="col-md-3">
            <button class="btn btn-primary" type="button" onclick="openModal('cie');"><i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="sin_table" width="100%"></table>
            <!-- <div id="sin_table"></div> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>