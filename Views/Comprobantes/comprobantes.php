<?php 
    headerAdmin($data); 
    getModal('modalComprobantes',$data);
    //getModal('modalBienes',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <div>
            <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
                <?php if($_SESSION['perMod']['gtp_w']){ ?>
                <button class="btn btn-primary" type="button" onclick="openModalCom();" ><i class="fas fa-plus-circle"></i> Nuevo</button>
              <?php } ?>
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
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="tableFacturas">
                      <div class="tab-pane active">
                        <thead>
                          <tr>                   
                            <th>N°</th>   
                            <th>Serie y Numero</th>                    
                            <th>RUC</th>
                            <th>Moneda</th>
                            <th>Fecha Emision</th>
                            <th>Subtotal</th>
                            <th>IGV</th>
                            <th>Total</th>  
                            <th>Estado</th>                     
                            <th>Acciones</th>
                          </tr>
                        </thead>
                      </div>
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
   