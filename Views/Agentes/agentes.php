<?php 
    headerAdmin($data); 
    getModal('modalAgentes',$data);
    getModal('modalPersonas',$data);
    getModal('modalEmpresas',$data);
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
        <?php if($_SESSION['perMod']['gtp_w']){ ?>
          <button class="btn btn-primary" type="button" onclick="openModal('age');">
            <i class="fas fa-plus-circle" aria-hidden="true"></i> Nuevo</button>
        <?php } ?>
      </h1>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="age_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>