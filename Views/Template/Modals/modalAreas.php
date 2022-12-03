<!-- Modal -->
<div class="modal fade" id="modal_gar" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_gar">Nuevo Areas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form id="form_gar" name="form_gar" class="form-horizontal">
              <input type="hidden" id="gar_id" name="gar_id" value="">
              <p class="text-primary">Todos los campos son obligatorios.</p>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label class="control-label">Nombre</label>
                  <input type="text" class="form-control valid validText" id="gar_nombre" name="gar_nombre" required="">
                </div>
                <div class="form-group col-md-6">
                  <label class="control-label">Descripción</label>
                  <input type="text" class="form-control valid validText" id="gar_descripcion" name="gar_descripcion" required="">
                </div>
              </div>
              <div class="tile-footer">
                <button id="set_gar" class="btn btn-primary" onclick="event.preventDefault();set('gar')"><i
                    class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                    class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
              </div>
            </form>
      </div>
    </div>
  </div>
</div>
