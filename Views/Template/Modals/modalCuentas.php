<div class="modal fade" id="modal_cue" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_cue">Nuevo Empresa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_cue" name="form_cue" class="form-horizontal">
          <input type="hidden" id="cue_id" name="cue_id" value="">
          <div class="form-group mb-1">
            <label for="cue_nombre">Nombre<span class="required">*</span></label>
            <input type="text" class="form-control valid" id="cue_nombre" name="cue_nombre" required="">
          </div>
          <div class="form-group mb-1">
            <label for="cue_gt4_id">Moneda<span class="required">*</span></label>
            <select class="form-control" id="cue_gt4_id" name="cue_gt4_id"></select>
          </div>
          <div class="form-group mb-1">
            <label for="cue_status">Status<span class="required">*</span></label>
            <select class="form-control" id="cue_status" name="cue_status" required>
              <option value="1">Activo</option>
              <option value="0">Inactivo</option>
            </select>
          </div>
        </form>
        <div class="tile-footer mt-3">
          <button id="set_cue" class="btn btn-primary" onclick="event.preventDefault();set('cue')"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="modalViewCue" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">DETALLE DE MOVIMIENTOS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style='font-size: 13px;'>
        <div class="row">
          <div class="col">
            <h5 class="text-center">INGRESOS</h5>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="cue_i" width="100%"></table>
            </div>
          </div>
          <div class="col">
            <h5 class="text-center">EGRESOS</h5>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="cue_e" width="100%"></table>
            </div>
          </div>
          <div class="col">
            <h5 class="text-center">GASTOS</h5>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="cue_g" width="100%"></table>
            </div>
          </div>
        </div>
        <h5 class="text-right"><strong>Neto: </strong><span id="cue_base"></span></h5>
        <h5 class="text-right"><strong>T.C. Sunat: </strong><span id="cue_tga"></span></h5>
        <h4 class="text-right"><strong>Saldo: </strong><span class="text-info" id="cue_neto"></span></h4>
        <!-- <table class="table table-hover table-bordered table-sm " id="mvb_cue" width="100%"></table> -->
        <!-- <div id="mvb_cue"> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>