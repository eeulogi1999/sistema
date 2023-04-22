<div class="modal fade" id="modal_inv" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_inv">Nuevo </span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_inv" name="form_inv" class="form-horizontal">
            <input type="hidden" id="inv_id" name="inv_id" value="">
            <div class="row mb-3">
              <div class="form-group col mb-0">
                <label for="inv_age_id">Agente<a class="text-success" href="#" id="new_age">
                        [<i class="fas fa-plus-circle">Seleccionar</i>]</a><span class="required">*</span></label>
                <select class="form-control" id="inv_age_id" name="inv_age_id" readonly>
                <option value="0">Seleccione</option>
                </select>
              </div>
              <div class="form-group col mb-0">
                <label for="inv_fecha">Fecha<span class="required">*</span></label>
                <input type="date" class="form-control valid" id="inv_fecha" name="inv_fecha" required=""
                      onkeypress="return controlTag(event);">
              </div>
              <div class="form-group col mb-0">
                <label for="inv_gt4_id">Moneda<span class="required">*</span></label>
                <select class="form-control" id="inv_gt4_id" name="inv_gt4_id"></select>
              </div>
            </div>
            <div class="row mb-3" id="v_gasto">
              <div class="form-group col mb-0">
                <label for="inv_tipo">Tipo Movimiento<span class="required">*</span></label>
                <select class="form-control" id="inv_tipo" name="inv_tipo">
                  <option value="1">INGRESO</option>
                  <option value="2">SALIDA</option>
                </select>
              </div>
              <div class="form-group col mb-0">
                <label for="inv_obs">Observaciones<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="inv_obs" name="inv_obs">
              </div>
            </div>
            <div class="row mb-3">
              <div class="form-group col mb-0">
                <label for="inv_cue_id">Cuenta</label>
                <select class="form-control" id="inv_cue_id" name="inv_cue_id"></select>
              </div>
              <div class="form-group col mb-0">
                <label for="inv_t1m_id">Medio de Pago</label>
                <select class="form-control" id="inv_t1m_id" name="inv_t1m_id"></select>
              </div>
              <div class="form-group col mb-0">
                <label for="inv_monto">Monto<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="inv_monto" name="inv_monto" required="">
              </div>
            </div>
        </form>
        <div class="tile-footer">
          <button id="set_inv" class="btn btn-info"
            onclick="event.preventDefault();set('inv')"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="modalView_Inv" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">DETALLE DE MOVIMIENTOS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="d-flex justify-content-center">
          <h2>
            AGENTE :<span id="h_age_id"></span>
            <a class="text-danger px-1" target="_blank" id="liq_pdf" href="#"><i class="fas fa-file-pdf"></i></a>
            <a class="text-success px-1" target="_blank" id="liq_xlsx" href="#"><i class="fas fa-file-excel"></i></a>
          </h2>
        </div>
        <div class="row">
          <div class="col-md-6">
            <h3 class="text-center">INGRESOS</h3>
            <div>
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="ing_table" width="100%"></table>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <h3 class="text-center">SALIDAS</h3>
            <div>
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="egr_table" width="100%"></table>
              </div>
            </div>
          </div>
        </div>
        <br>
        <h4 class="text-right"><strong>Saldo Final: </strong><span class="text-info" id="inv_saldo"></span></h4>
      </div>
      <div class="modal-footer" style="justify-content: space-between">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>