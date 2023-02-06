<?php 
    headerAdmin($data); 
    getModal('modalPlanillas',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <h4><i class="fas fa-user-tag"></i> <?= $data['page_title']; ?>
        </h4>
        <div class="d-flex">
            <?php if($_SESSION['perMod']['gtp_w']){ ?>
            <button class="btn btn-primary mr-3" type="button" onclick="saveColSaldos();"><i class="fas fa-plus-circle"></i>
              GUARDAR SALDOS</button>
            <?php } ?>
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
                  <table class="table table-hover table-bordered table-sm" id="pla_table" width="100%"></table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    