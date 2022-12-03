<?php 
    headerAdmin($data); 
    //getModal('modalReportes',$data);
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
      </h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/tablas"><?= $data['page_title'] ?></a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <h4>FORMATEADOR EXCEL: CONVER TO CONCAR</h4>
          <hr>
          <div class="row">
            <div class="col">
              <h5>REPORTE CONTABLE</h5>
              <div class="custom-file mb-1">
                <label class="custom-file-label" for="customFile">Seleccionar Excel</label>
                <input id="set_file" type="file" class="custom-file-input">
              </div><br>
              <h5 class="mt-3">REPORTE DE VENTAS</h5>
              <div class="custom-file mb-1">
                <label class="custom-file-label" for="customFile">Seleccionar Excel</label>
                <input id="set_file" type="file" class="custom-file-input">
              </div>
              <hr>
              <button class="btn btn-success" id="set_procesar" type="button"
                title="Procesar"><span>Procesar</span></button>
            </div>
            <div class="col">
              <h4>DESCARGAR FORMATO</h4>
              <a class="d-none" href=""></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>