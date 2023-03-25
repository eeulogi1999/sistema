
<div class="modal fade" id="modal_nrc" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_nrc">Nueva <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_nrc" name="form_nrc" class="form-horizontal">
          <input type="hidden" id="nrc_id" name="nrc_id" value="">
          <div class="row">
            <div class="col">
              <div class="form-group mb-0">
                <label for="nrc_num">NUMERO<span class="required">*</span></label>
                <input type="text" class="form-control" id="nrc_num" name="nrc_num"  readonly></input>
              </div>
              <div class="form-group mb-0">
                <label for="nrc_age_id">Agente<span class="required">*</span></label>
                <select class="form-control" id="nrc_age_id" name="nrc_age_id" ></select>
              </div>
            </div>
            <div class="col">
            <div class="form-group mb-0">
                <label for="nrc_fechai">FECHA INICIO<span class="required">*</span></label>
                <input type="date" class="form-control" name="nrc_fechai" id="nrc_fechai">
              </div>
              <div class="form-group mb-0">
                <label for="nrc_fechaf">FECHA FIN<span class="required">*</span></label>
                <input type="date" class="form-control" name="nrc_fechaf" id="nrc_fechaf">
              </div>
            </div>
          </div>
            <div class="row">
              <div class="col-md-10 form-group mb-0">
                <label for="nrc_obs">OBSERVACIÓN<span class="required">*</span></label>
                <input type="text" class="form-control" name="nrc_obs" id="nrc_obs">
              </div>
              <div class="col form-group mb-3">
                <label for="nrc_obs">FILTRAR</label>
                <button class="btn btn-sm btn-success d-block" onClick="filterTriNrc(event)"><i class="fas fa-search"></i></button>
              </div>
            </div>
            <div>
              <div class="table-responsive">
                  <table class="table table-hover table-bordered table-sm " id="drc_table" width="100%"></table>
              </div>
            </div>
          <div class="tile-footer mt-2">
            <button id="set_nrc" onclick="event.preventDefault();set('nrc')" class="btn btn-primary"><i
                class="fa fa-fw fa-lg fa-check-circle" aria-hidden="true"></i><span
                id="set_nrc">Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"
                aria-hidden="true"></i>Cerrar</button>
            <!-- <button class="btn btn-sm btn-danger" ><i class="far fa-file-pdf"></i></button> -->
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
