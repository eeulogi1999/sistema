<?php 
    headerAdmin($data); 
    getModal('modalAsistencias',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <h4><i class="fas fa-user-tag"></i> <?= $data['page_title']; ?>
        <?php if($_SESSION['perMod']['gtp_w']){ ?>
        <button class="btn btn-primary" type="button" onclick="openAsi();"><i class="fas fa-plus-circle"></i>
          Nuevo</button>
        <?php } ?>
        </h4>
        <div class="d-flex">
          <div class="custom-file w-50">
            <label class="custom-file-label" for="customFile">Seleccionar Excel</label>
            <input id="asi_xlsx" type="file" class="custom-file-input">
          </div>
          <button class="btn btn-primary" type="button" onclick="importAsi();" ><i class="fas fa-plus-circle"></i>Importar</button>
        </div>
        <div class="d-flex">
          <h5 class="mr-1 d-flex align-items-end">Semana</h5>
          <input class="form-control" style="width: 170px;" type="week" id="week" name="week"
                    onkeypress="return controlTag(event);">   
        </div>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                  <table class="table table-hover table-bordered table-sm" id="asi_table" width="100%"></table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    