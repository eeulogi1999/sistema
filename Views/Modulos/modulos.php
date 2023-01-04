<?php 
    headerAdmin($data); 
    getModal('modalModulos',$data);
?>
    <div id="contentAjax"></div> 
    <main class="app-content">
      <div class="app-title">
      <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
          <button class="btn btn-primary" type="button" onclick="openModal('gmo');">
            <i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
            <button class="btn btn-primary" type="button" onclick="migrarGmo();">
            <i class="fas fa-plus-circle" aria-hidden="true"></i>MIGRAR JSON</button>
      </h1>
    </div>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered table-sm" id="gmo_table" width="100%"></table>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    