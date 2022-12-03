<div class="modal fade" id="modal_mer" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_mer">Nuevo Empresa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_mer" name="form_mer" class="form-horizontal">
          <input type="hidden" id="mer_id" name="mer_id" value="">
          <div class="form-group mb-1">
            <label for="mer_fecha">FECHA<span class="required">*</span></label>
            <input type="date" class="form-control valid" id="mer_fecha" name="mer_fecha" required=""
                      onkeypress="return controlTag(event);">
          </div>
          <div class="form-group mb-1">
            <label for="mer_bie_id" class="mb-3">Material<a class="text-success" href="#" id="new_bien">
                [<i class="fas fa-plus-circle">Seleccionar</i>]</a></label>
            <select class="form-control" id="mer_bie_id" name="mer_bie_id">
              <option value="">Seleccione</option>
            </select>
          </div>
          <div class="form-group mb-1">
            <label for="mer_descripcion">DESCRIPCION<span class="required">*</span></label>
            <input type="text" class="form-control valid" id="mer_descripcion" name="mer_descripcion" required="">
          </div>
          <div class="form-group mb-1">
            <label for="mer_q">CANTIDAD<span class="required">*</span></label>
            <input type="text" class="form-control valid" id="mer_q" name="mer_q" required="">
          </div>
          <div class="form-group mb-1">
            <label for="mer_mt">VALORIZADO<span class="required">*</span></label>
            <input type="text" class="form-control valid" id="mer_mt" name="mer_mt" required="">
          </div>
          <input type="hidden" id="mer_alm_id" name="mer_alm_id" value="01">
        </form>
        <div class="tile-footer mt-3">
          <button id="set_mer" class="btn btn-primary"
            onclick="event.preventDefault();set('mer',['mer_alm_id','mer_bie_id','mer_fecha'])"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>