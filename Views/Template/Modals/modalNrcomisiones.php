
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
                <div class="col">AGENTE: <select class="form-control" name="nrc_age_id" id="nrc_age_id"></select></div>
                <div class="col">FECHA INICIO: <input type="date" class="form-control" name="nrc_fechai" id="nrc_fechai"></div>
                <div class="col">FECHA FIN: <input type="date" class="form-control" name="nrc_fechaf" id="nrc_fechaf"></div>
                <div class="col">OBSERVACIÓN<input type="text" class="form-control" name="nrc_obs" id="nrc_obs"></div>
                <div class="col">FILTRAR <button class="btn btn-sm btn-success" onClick="filterTriNrc(event)"><i class="fas fa-search"></i></button></div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="drc_table" width="100%"></table>
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
