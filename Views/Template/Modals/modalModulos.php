<div class="modal fade" id="modal_gmo" tabindex="-1" gmoe="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_gmo">Nuevo Personas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_gmo" name="form_gmo" class="form-horizontal">
          <input type="hidden" id="gmo_id" name="gmo_id" value="">
          <p class="text-primary">Todos los campos son obligatorios.</p>
          <div class="form-gmoup">
            <label for="gmo_titulo">Nombre</label>
            <input class="form-control" id="gmo_titulo" name="gmo_titulo" type="text"
              placeholder="Nombre" required="">
          </div>
          <div class="form-gmoup">
            <label for="gmo_descripcion">Descripcion</label>
            <input class="form-control" id="gmo_descripcion" name="gmo_descripcion" type="text"
              placeholder="Descripcion" required="">
          </div>
          <div class="form-gmoup">
            <label for="gmo_status">Status</label>
            <select class="form-control selectpicker" id="gmo_status" name="gmo_status" required>
              <option value="1">Activo</option>
              <option value="2">Inactivo</option>
            </select>
          </div>
          <div class="tile-footer">
            <button id="set_gmo" class="btn btn-primary" onclick="event.preventDefault();setGmo()"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>