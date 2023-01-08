<div class="modal fade" id="modal_gcl" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_gcl">Nuevo </span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_gcl" name="form_gcl" class="form-horizontal">
          <input type="hidden" id="gcl_id" name="gcl_id" value="">
          <div class="row mb-3">
            <div class="form-group col mb-0">
              <label for="gcl_gem_id">EMPRESA<span class="required">*</span>
                <a href="#" id="new_gem">
                  [<i class="fas fa-plus-circle">Nuevo</i>]
                </a>
                <a href="#" id="tab_gem" class="text-success">
                  [<i class="fas fa-plus-circle">Ver</i>]
                </a>
              </label>
              <select class="form-control" data-live-search="true" id="gcl_gem_id" name="gcl_gem_id" required>
              </select>
            </div>
            <div class="form-group col mb-0">
              <label for="gcl_correo">CORREO<span class="required">*</span></label>
              <input type="text" class="form-control valid" id="gcl_correo" name="gcl_correo">
            </div>
          </div>
          <div class="row mb-3">
            <div class="form-group col mb-0">
              <label for="gcl_pweb">P. WEB<span class="required">*</span></label>
              <input type="text" class="form-control valid" id="gcl_pweb" name="gcl_pweb">
            </div>
            <div class="form-group col mb-0">
              <label for="gcl_telefono">TELEFONO<span class="required">*</span></label>
              <input type="text" class="form-control valid" id="gcl_telefono" name="gcl_telefono">
            </div>
            <div class="form-group col mb-0">
              <label for="gcl_status">Status<span class="required">*</span></label>
              <select class="form-control" id="gcl_status" name="gcl_status" required>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
              </select>
            </div>
          </div>
          <div class="row mb-3">
            <div class="form-group col ">
              <label for="gcl_gde_id">Departamento<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gcl_gde_id" name="gcl_gde_id" required>
              </select>
            </div>
            <div class="form-group col">
              <label for="gcl_gpr_id">Provincia<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gcl_gpr_id" name="gcl_gpr_id" required>
              </select>
            </div>
            <div class="form-group col">
              <label for="gcl_gdi_id">Distrito<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gcl_gdi_id" name="gcl_gdi_id" required>
              </select>
            </div>
          </div>
        </form>
        <div class="tile-footer">
          <button id="set_gcl" class="btn btn-primary" onclick="event.preventDefault();set('gcl')"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
