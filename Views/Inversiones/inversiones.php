<?php 
    headerAdmin($data); 
    getModal('modalInversiones',$data);
    $data['pre']='age';
    getModal('modalTable',$data);
?>
<main class="app-content">
  <div class="app-title">
    <h4>
      <i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
    </h4>
    <div class="d-flex">
      <h5 class="mr-1 d-flex align-items-end">Periodo</h5>
      <input class="form-control" style="width: 170px;" type="month" id="periodo" name="periodo"
        onkeypress="return controlTag(event);">
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="resumen-tab" data-toggle="tab" href="#resumen" role="tab"
                aria-controls="resumen" aria-selected="true">INVERSIONES</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="historico-tab" data-toggle="tab" href="#historico" role="tab"
                aria-controls="historico" aria-selected="false">CUADRE</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="next-tab" data-toggle="tab" href="#next" role="tab"
                aria-controls="next" aria-selected="false">SIMULACION</a>
            </li>
          </ul>
          <div class="tab-content m-3">
            <div class="tab-pane fade show active" id="resumen" role="tabpanel" aria-labelledby="resumen-tab">
              <button class="btn btn-primary" onClick="openModal('inv')">NUEVO</button>
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="inv_table" width="100%"></table>
              </div>
            </div>
            <div class="tab-pane fade" id="historico" role="tabpanel" aria-labelledby="historico-tab">
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="cua_table" width="100%"></table>
              </div>
            </div>
            <div class="tab-pane fade" id="next" role="tabpanel" aria-labelledby="next-tab">
            <div class="card text-center">
              <div class="card-header">
                SIMULACION DE INVERSION
              </div>
                <div class="card-body">
                <form onsubmit="setTrato(event)" id="from">
                  <div class="row">
                      <div class="col"><label for="tra_ci">CAPITAL</label><input class="form-control" type="number" name="tra_ci"></div>
                      <div class="col"><label for="tra_i">TASA % <select name="tra_tp">
                      <option value="12">ANUAL</option>  
                      <option value="6">SEMESTRAL</option>
                      <option value="3">TRIMESTRAL</option>
                      <option value="1">MENSUAL</option>
                      <option value="0.46">QUINCENAL</option>
                      <option value="0.23">SEMANAL</option>
                    </select></select></label><input class="form-control" type="number" name="tra_i"></div>
                      <div class="col"><label for="tra_c">CAPITALIZACION</label><select class="form-control" name="tra_c" id="tra_c">
                      <option value="12">ANUAL</option>  
                      <option value="6">SEMESTRAL</option>
                      <option value="3">TRIMESTRAL</option>
                      <option value="1">MENSUAL</option>
                      <option value="0.46">QUINCENAL</option>
                      <option value="0.23">SEMANAL</option>
                            </select></div>
                      <div class="col"><label for="tra_n">PERIODO</label><input class="form-control" type="number" name="tra_n"></div>
                      <div class="col d-flex flex-column"><button  type="submit" class="btn btn-sm btn-primary w-50">GENERAR</button><button class="btn btn-sm btn-danger w-50" onclick="formatPDF(event)">GUARDAR</button></div>
                  </div>
                  </form>
                </div>
              </div>
              <div>
                <div class="table-responsive">
                  <table class="table table-hover table-bordered table-sm " id="sim_table" width="100%"></table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>