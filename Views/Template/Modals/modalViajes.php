<!-- Modal -->
<div class="modal fade" id="modal_via" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_via">Nuevo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form id="form_via" name="form_via" class="form-horizontal">
              <input type="hidden" id="via_id" name="via_id" value="">
              <p class="text-primary">Todos los campos son obligatorios.</p>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label class="control-label">Nombre</label>
                  <input type="text" class="form-control valid validText" id="via_nombre" name="via_nombre" required="">
                </div>
                <div class="form-row">
                    <label for="via_gus_id">Usuario<span class="required">*</span><a href="#" id="new_gus">
                    [<i class="fas fa-plus-circle">Nuevo</i>]
                  </a><a href="#" id="tab_gus" class="text-success"> 
                    [<i class="fas fa-plus-circle">Ver</i>]
                  </a></label>
                <select class="form-control" data-live-search="true" id="via_gus_id" name="via_gus_id" required>
                </select>
                </div>
                <div class="form-group col-md-6">
                  <label class="control-label">Descripción</label>
                  <input type="text" class="form-control valid validText" id="via_descripcion" name="via_descripcion" required="">
                </div>
                <div class="form-group col-md-6">
                  <label for="via_status">Status <span class="required">*</span></label>
                  <select class="form-control selectpicker" id="via_status" name="via_status" required>
                    <option value="1">Activo</option>
                    <option value="2">Inactivo</option>
                  </select>
                </div>
              </div>
              <div class="tile-footer">
                <button id="set_via" class="btn btn-primary" onclick="event.preventDefault();set('via')"><i
                    class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                    class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
              </div>
            </form>
      </div>
    </div>
  </div>
</div>
