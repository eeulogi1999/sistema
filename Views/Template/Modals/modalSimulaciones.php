<div class="modal fade" id="modal_sim" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_sim">Nueva <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_sim" name="form_sim" class="form-horizontal">
          <input type="hidden" id="sim_id" name="sim_id" value="">
          <div class="row">
            <div class="form-group col-md-4">
              <label for="sim_bie_id">MATERIAL<span class="required">*</span></label>
              <select class="form-control" id="sim_bie_id" name="sim_bie_id"></select>
            </div>
            <div class="form-group col">
              <label for="sim_obs">OBSERVACIONES<span class="required">*</span></label>
              <input type="text" class="form-control valid" id="sim_obs" name="sim_obs">
            </div>
          </div>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="val_table" width="100%"></table>
            </div>
          </div><br>
          <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="res_table" width="100%"></table>
              </div>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="inp_table" width="100%"></table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm" id="por_table" width="100%"></table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="out_table" width="100%"></table>
            </div>
          </div>
          <div class="tile-footer">
            <button id="set_sim" onclick="event.preventDefault();set('sim')" class="btn btn-info"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span
                id="set_sim">Actualizar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
