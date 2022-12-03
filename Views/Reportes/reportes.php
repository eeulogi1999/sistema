<?php 
    headerAdmin($data); 
    //getModal('modalReportes',$data);
    getModal('modalMovimientos',$data);
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
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#cie" onclick="rezise(this);"><i class="fas fa-plus-circle"></i>SALDOS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#his" onclick="rezise(this);"><i class="fas fa-plus-circle"></i>REGISTROS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#kar" onclick="rezise(this);"><i class="fas fa-plus-circle"></i>KARDEX</a>
            </li>
          </ul>
          <div class="tab-content">
            <div id="cie" class="container-fluid tab-pane active"><br>
              <div id="cie_table"></div>
            </div>
            <div id="his" class="container-fluid tab-pane fade"><br>
              <form>
                <label for="bie_id">MATERIAL</label>
                <select name="bie_id" id="bie_id">
                  <option value="0">Seleccione</option>
                </select>
              </form>
              <!-- <div id="his_table"></div> -->
            </div>
            <div id="kar" class="container-fluid tab-pane fade"><br>
              <div id="kar_table"></div>
            </div>
          </div>
          <br>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>