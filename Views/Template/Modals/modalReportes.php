<div class="modal fade" id="modalFormContent" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal"> <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="tile">
          <div class="tile-body">
            <div class="d-flex mb-1">
                <button class="mr-auto dt-button buttons-excel buttons-html5 btn btn-success" onclick="tabledetalle.toExcel;" type="button" title="Esportar a Excel"><span><i class="fas fa-file-excel" ></i> Excel</span></button>
                <input class="form-control" style="width: 200px;"type="month" id="mesPeriodo" name="mesPeriodo" onkeypress="return controlTag(event);">&nbsp;
                <button class="btn btn-info" id="btnPeriodo"><i
                class="fa fa-fw fa-lg fas fa-search"></i><span >Buscar</span></button>
            </div>
            <div class="table-responsive">
              <table class="table table-hover" id="table" width="1060">
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="modalTable_his" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">
          HISTORIAL DE REGISTROS
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="his_table" width="100%"></table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>