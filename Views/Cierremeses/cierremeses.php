<?php 
    headerAdmin($data); 
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <form id="formContent" name="formContent" class="form-horizontal">
        <div class="row">
          <div class="col-md-6">
            <input class="form-control" style="width: 200px;" type="month" id="mesPeriodo" name="mesPeriodo"
              onkeypress="return controlTag(event);">&nbsp;
          </div>
          <div class="col-md-6">
            <button class="btn btn-primary" type="button" onclick="procesarCierreMes();"><i class="fas fa-cog"></i>
              Procesar Cierre Mes</button>
          </div>
        </div>
      </form>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/cierreMes"><?= $data['page_title'] ?></a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <div id="cie_table"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>