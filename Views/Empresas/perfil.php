<?php
  headerAdmin($data);
  
 ?>
<main class="app-content">
  <div class="row user">
    <div class="col-md-12">
      <div class="profile">
        <div class="info"><img class="empresa-img" src="<?= base_url();?>/.uploads/<?= $_SESSION['arrBusiness']['logo'] ?>" width="200" height="150">
          <h4><?= $_SESSION['arrBusiness']['razonsocial'] ?></h4>
          <p><?= $_SESSION['arrBusiness']['ruc']; ?></p>
        </div>
        <div class="cover-image"></div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="tile p-0">
        <ul class="nav flex-column nav-tabs user-tabs">
          <li class="nav-item"><a class="nav-link active" href="#user-timeline" data-toggle="tab">Datos de la Empresa</a></li>
          <li class="nav-item"><a class="nav-link" href="#empresa-settings" data-toggle="tab">Datos de Representante Legal</a></li>
          <li class="nav-item"><a class="nav-link" href="#almacenes-settings" data-toggle="tab">Almacenes</a></li>
        </ul>
      </div>
    </div>
    <div class="col-md-9">
      <div class="tab-content">
        <div class="tab-pane active" id="user-timeline">
          <div class="timeline-post">
            <div class="post-media">
              <div class="content">
                <h5>DATOS EMPRESA</h5>
              </div>
            </div>

            <table class="table table-bordered">
              <tbody>
                <tr>
                  <td style="width:150px;">RUC:</td>
                  <td><?= $_SESSION['arrBusiness']['ruc']; ?></td>
                </tr>
                <tr>
                  <td>Razon Social:</td>
                  <td><?= $_SESSION['arrBusiness']['razonsocial']; ?></td>
                </tr>
                <tr>
                  <td>Dirección:</td>
                  <td><?= $_SESSION['arrBusiness']['direccion']; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="tab-pane fade" id="empresa-settings">
          <div class="tile empresa-settings">
            <h4 class="line-head">Datos fiscales</h4>
            <form id="formDataFiscal" name="formDataFiscal">
              <div class="row mb-4">
                <div class="col-md-6">
                  <label>Identificación Tributaria</label>
                  <input class="form-control" type="text" id="txtNit" name="txtNit" value="<?= $_SESSION['userData']['nit']; ?>" disabled>
                </div>
                <div class="col-md-6">
                  <label>Nombre fiscal</label>
                  <input class="form-control" type="text" id="txtNombreFiscal" name="txtNombreFiscal" value="<?= $_SESSION['userData']['nombrefiscal']; ?>" disabled>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 mb-4">
                  <label>Dirección fiscal</label>
                  <input class="form-control" type="text" id="txtDirFiscal" name="txtDirFiscal" value="<?= $_SESSION['userData']['direccionfiscal']; ?>" disabled>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="tab-pane " id="almacenes-settings">
          <div class="timeline-post">
            <div class="post-media">
              <div class="content">
                <h5>DATOS DE LOS ALMACENES</h5>
              </div>
            </div>
            
            <?php
            for ($i=0; $i <= isset($_SESSION['arralmacenes'][$i]); $i++) {
              $dataalmacen=$_SESSION['arralmacenes'][$i];
            ?>
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <td style="width:150px;">ID:</td>
                  <td><?= $dataalmacen['id_almacen']; ?></td>
                </tr>
                <tr>
                  <td>Nombre Comercial:</td>
                  <td><?= $dataalmacen['nombre']; ?></td>
                </tr>
                <tr>
                  <td>Dirección:</td>
                  <td><?= $dataalmacen['direccion']; ?></td>
                </tr>
              </tbody>
            </table>
          <?php }?>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>