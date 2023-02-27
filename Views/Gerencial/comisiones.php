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
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="resumen-tab" data-toggle="tab" href="#resumen" role="tab"
                aria-controls="resumen" aria-selected="true">RESUMEN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="historico-tab" data-toggle="tab" href="#historico" role="tab"
                aria-controls="historico" aria-selected="false">HISTORICO</a>
            </li>
          </ul>
          <div class="tab-content m-3">
            <div class="tab-pane fade show active" id="resumen" role="tabpanel" aria-labelledby="resumen-tab">
              <select class="form-control ml-2 w-auto d-inline" name="cms_age_id" id="cms_age_id"></select>
              <a id="pdf_com" class="btn btn-sm btn-danger w-auto" target="_blank" href="<?= base_url() ?>/Gerencial/getRcoPDF/1"><i class="far fa-file-pdf"></i></a>
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="com_table" width="100%"></table>
              </div>
            </div>
            <div class="tab-pane fade" id="historico" role="tabpanel" aria-labelledby="historico-tab">
              <select class="form-control ml-2 w-auto d-inline" name="his_age_id" id="his_age_id"></select>
              <input class="form-control w-auto d-inline" type="date" id="fecha_i" name="fecha_i" placeholder="FECHA INICIO">
              <input class="form-control w-auto d-inline" type="date" id="fecha_f" name="fecha_f" placeholder="FECHA FIN">
              <button class="btn btn-sm btn-danger w-auto d-inline" onClick="filterTriCom()"><i class="fas fa-search"></i></button>
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="tri_table" width="100%"></table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>