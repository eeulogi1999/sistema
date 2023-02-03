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
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="val_table" width="100%"></table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="inp_table" width="100%"></table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm bg-warning" id="por_table" width="100%"></table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="out_table" width="100%"></table>
            </div>
          </div>
          <div class="tile-footer mt-3">
            <button id="set_sim" class="btn btn-primary" type="submit"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
