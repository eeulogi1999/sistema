<!-- Modal -->
<div class="modal fade" id="modal_gro" tabindex="-1" groe="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_gro">Nuevo Personas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_gro" name="form_gro" class="form-horizontal">
          <input type="hidden" id="gro_id" name="gro_id" value="">
          <p class="text-primary">Todos los campos son obligatorios.</p>
          <div class="form-row">
            <div class="col-md-4 border rounded p-2 m-2">
              <p class="text-primary">Datos Personales</p>
              <div class="form-group">
                <label for="gro_gt2_id">TIPO DOC<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gro_gt2_id" name="gro_gt2_id" required>
                </select>
              </div>
              <div class="form-group">
                <label for="gro_identificacion">Identificacion<span class="required">*</span></label>
                <input type="text" class="form-control" id="gro_identificacion" name="gro_identificacion" required="">
              </div>
              <div class="form-group">
                <label for="gro_nombre">Nombre<span class="required">*</span></label>
                <input type="text" class="form-control" id="gro_nombre" name="gro_nombre" required="">
              </div>
              <div class="form-group">
                <label for="gro_apellidos">Apellidos<span class="required">*</span></label>
                <input type="text" class="form-control valid validText" id="gro_apellidos" name="gro_apellidos"
                  required="">
              </div>
              <div class="form-group">
                <label for="gro_status">Status<span class="required"></span></label>
                <select class="form-control selectpicker" id="gro_status" name="gro_status" required>
                  <option value="1">Activo</option>
                  <option value="2">Inactivo</option>
                </select>
              </div>
            </div>
            <div class="col-md-4 border rounded p-2 m-2">
              <p class="text-primary">Ubicacion</p>
              <div class="form-group">
                <label for="gro_gde_id">Departamento<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gro_gde_id" name="gro_gde_id"
                  required>
                </select>
              </div>
              <div class="form-group">
                <label for="gro_gpr_id">Provincia<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gro_gpr_id" name="gro_gpr_id" required>
                </select>
              </div>
              <div class="form-group">
                <label for="gro_gdi_id">Distrito<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gro_gdi_id" name="gro_gdi_id" required>
                </select>
              </div>
              <div class="form-group">
                <label for="gro_direccion">Dirección<span class="required">*</span></label>
                <input type="text" class="form-control valid validText" id="gro_direccion" name="gro_direccion"
                  required="">
              </div>
            </div>
            <div class="col-md-3 border rounded p-2 m-2">
              <p class="text-primary">Datos de Contacto</p>
              <div class="form-group">
                <label for="gro_email">Email<span class="required">*</span></label>
                <input type="email" class="form-control valid validEmail" id="gro_email" name="gro_email" required="">
              </div>
              <div class="form-group">
                <label for="gro_telefono">Teléfono<span class="required">*</span></label>
                <input type="text" class="form-control valid validNumber" id="gro_telefono" name="gro_telefono"
                  required="" onkeypress="return contgroTag(event);">
              </div>
              <div class="form-group">
                <label for="gro_celular">Celular<span class="required">*</span></label>
                <input type="text" class="form-control valid validNumber" id="gro_celular" name="gro_celular"
                  required="" onkeypress="return contgroTag(event);">
              </div>
              <div class="form-group">
                <label for="gro_fechan">Fecha de Nacimiento<span class="required">*</span></label>
                <input type="date" class="form-control valid validText" id="gro_fechan" name="gro_fechan" required="">
              </div>
            </div>
          </div>
          <div class="tile-footer">
            <button id="set_gro" class="btn btn-primary" onclick="event.preventDefault();set('gro')"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>