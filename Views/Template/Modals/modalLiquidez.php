<div class="modal fade" id="modal_liq" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_liq">Nuevo </span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_liq" name="form_liq" class="form-horizontal">
          <input type="hidden" id="liq_id" name="liq_id" value="">
          <div class="form-group mb-0">
            <label for="liq_fecha">Fecha<span class="required">*</span></label>
            <input type="date" class="form-control valid" id="liq_fecha" name="liq_fecha" required=""
              onkeypress="return controlTag(event);">
          </div>
          <div class="form-group mb-0">
            <label for="liq_age_id">Agente<a class="text-success" href="#" id="new_age">
                [<i class="fas fa-plus-circle">Seleccionar</i>]</a><span class="required">*</span></label>
            <select class="form-control" id="liq_age_id" name="liq_age_id" readonly>
              <option value="0">Seleccione</option>
            </select>
          </div>
          <div class="form-group mb-3">
            <label for="liq_monto">Monto<span class="required">*</span></label>
            <input type="text" class="form-control valid" id="liq_monto" name="liq_monto" required="">
          </div>
        </form>
        <div class="tile-footer">
          <button id="set_liq" class="btn btn-primary" onclick="event.preventDefault();set('liq')"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="modalViewLiq" tabindex="-1" role="dialog" aria-hidden="true">
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
                <table class="table table-hover table-bordered table-sm " id="mvb_mov" width="100%"></table>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <h3 class="text-center">SALIDAS</h3>
            <div>
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="mvb_caj" width="100%"></table>
              </div>
            </div>
          </div>
        </div>
        <br>
        <h5 class="text-right"><strong>Neto: </strong><span id="liq_actualn"></span></h5>
        <h5 class="text-right"><strong>T.C. Sunat: </strong><span id="liq_tga"></span></h5>
        <h4 class="text-right"><strong>Saldo Final: </strong><span class="text-info" id="liq_actual"></span></h4>
      </div>
      <div class="modal-footer" style="justify-content: space-between">
        <a href="#" onClick="$('#modal_filter').modal('show')" style="text-decoration: underline">Historico</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_filter" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">FILTROS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_filter" name="form_filter" class="form-horizontal">
          <div class="form-group col mb-0">
            <label for="f_start">Fecha Inicio<span class="required">*</span></label>
            <input type="date" class="form-control valid" id="f_start" name="f_start" required=""
              onkeypress="return controlTag(event);">
          </div>
          <div class="form-group col mb-3">
            <label for="f_end">Fecha Fin<span class="required">*</span></label>
            <input type="date" class="form-control valid" id="f_end" name="f_end" required=""
              onkeypress="return controlTag(event);">
          </div>
        </form>
        <div class="tile-footer">
          <button id="fil_his" class="btn btn-primary" onclick="buscarHistorico()"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>BUSCAR</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>