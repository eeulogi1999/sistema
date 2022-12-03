<?php 
    headerAdmin($data); 
    // getModal('modalReportes',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <div>
            <h1 class="text-uppercase"><i class="fas fa-chart-pie"></i> <?= $data['page_title'] ?>
            </h1>
        </div>
      
      </div>
      <div class="container">
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="container-title">
                  <h3 class="tile-title">Seleccione Periodo </h3>
                  <div class="tile-body">
                <div class="d-flex mb-1">
     
                <input class="form-control" style="width: 200px;"type="month" id="mesPeriodo" name="mesPeriodo" onkeypress="return controlTag(event);">&nbsp;
                 <button class="mr-auto dt-button buttons-excel buttons-html5 btn btn-success" id="reportGeneral" type="button" title="Exportar a Excel"><span><i class="fas fa-file-excel" ></i> <?= $data['page_title'] ?></span></button>
                  
            </div>
            </div>
          </div>
          </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>