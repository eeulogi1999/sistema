<div class="modal fade" id="modal_des" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_des">Nuevo </span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_des" name="form_des" class="form-horizontal mb-3">
          <input type="hidden" id="des_id" name="des_id" value="">
          <div class="row">
            <div class="form-group col mb-0">
              <label for="des_tipo_id">TIPO<span class="required">*</span></label>
              <select class="form-control" id="des_tipo_id" name="des_tipo_id" readonly>
                <option value="1">CAJA 1</option>
                <option value="2">CAJA 2</option>
                <option value="3">CAJA 3</option>
                <option value="4">CAJA 4</option>
                <option value="5">BOLSA 1</option>
                <option value="6">BOLSA 2</option>
                <option value="7">BOLSA 3</option>
                <option value="8">FLETE</option>
              </select>
            </div>
            <div class="form-group col mb-0">
              <label for="des_q">Cantidad<span class="required">*</span></label>
              <input type="text" class="form-control" name="des_q" id="des_q">
            </div>
            <div class="form-group col mb-0">
              <label for="des_p">Monto<span class="required">*</span></label>
              <input type="text" class="form-control" name="des_p" id="des_p">
            </div>
            <div class="form-group col mb-0">
              <label for="des_mt">Subtotal<span class="required">*</span></label>
              <input type="text" class="form-control" name="des_mt" id="des_mt" readonly>
            </div>
            <div class="form-group col mb-0">
            <label for="des_subtotal">AGREGAR<span class="required">*</span></label> <br>
              <button class="btn btn-primary  btn-sm" onclick="event.preventDefault();setDes();"
                              id="set_des" title="Agregar">
                              <i class="fa fa-plus mr-0"></i></button>
            </div>
          </div>
        </form>
        <div class="table-responsive">
                  <table class="table table-hover table-bordered table-sm " id="des_table" width="100%"></table>
                  </div>
        <div class="tile-footer">
          <button id="set_desf" class="btn btn-primary" onclick="event.preventDefault();setDescuen()"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
