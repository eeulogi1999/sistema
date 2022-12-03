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
            <?php if($_SESSION['permisosMod']['w']){ ?>
            <button class="btn btn-primary" type="button" onclick="procesarCierreMes();"><i class="fas fa-cog"></i>
              Procesar Cierre Mes</button>
            <?php } ?>
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
            <table class="table table-hover table-bordered" id="tableContent">
              <thead>
                <tr>
                  <th>N°</th>
                  <th>Periodo</th>
                  <th>N° Productos </th>
                  <th>Valor Total</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>