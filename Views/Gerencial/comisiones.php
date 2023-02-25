<?php 
    headerAdmin($data); 
    $data['pre']='mov';
    getModal('modalTable',$data);
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
          <select class="form-control ml-2 w-auto" name="cms_age_id" id="cms_age_id"></select>
          <div class="table-responsive" style="height:0px">
            <table class="table table-hover table-bordered table-sm " id="com_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>