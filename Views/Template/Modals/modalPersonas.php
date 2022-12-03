<!-- Modal -->
<div class="modal fade" id="modal_gpe" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_gpe">Nuevo Personas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_gpe" name="form_gpe" class="form-horizontal">
          <input type="hidden" id="gpe_id" name="gpe_id" value="">
          <p class="text-primary">Todos los campos son obligatorios.</p>
          <div class="form-row">
            <div class="col-md-4 border rounded p-2 m-2">
              <p class="text-primary">Datos Personales</p>
              <div class="form-group">
                <label for="gpe_gt2_id">TIPO DOC<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gpe_gt2_id" name="gpe_gt2_id" required>
                </select>
              </div>
              <div class="form-group">
                <label for="gpe_identificacion">Identificacion<span class="required">*</span></label>
                <input type="text" class="form-control" id="gpe_identificacion" name="gpe_identificacion" required="">
              </div>
              <div class="form-group">
                <label for="gpe_nombre">Nombre<span class="required">*</span></label>
                <input type="text" class="form-control" id="gpe_nombre" name="gpe_nombre" required="">
              </div>
              <div class="form-group">
                <label for="gpe_apellidos">Apellidos<span class="required">*</span></label>
                <input type="text" class="form-control valid validText" id="gpe_apellidos" name="gpe_apellidos"
                  required="">
              </div>
              <div class="form-group">
                <label for="gpe_status">Status<span class="required"></span></label>
                <select class="form-control selectpicker" id="gpe_status" name="gpe_status" required>
                  <option value="1">Activo</option>
                  <option value="2">Inactivo</option>
                </select>
              </div>
            </div>
            <div class="col-md-4 border rounded p-2 m-2">
              <p class="text-primary">Ubicacion</p>
              <div class="form-group">
                <label for="gpe_gde_id">Departamento<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gpe_gde_id" name="gpe_gde_id"
                  required>
                </select>
              </div>
              <div class="form-group">
                <label for="gpe_gpr_id">Provincia<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gpe_gpr_id" name="gpe_gpr_id" required>
                </select>
              </div>
              <div class="form-group">
                <label for="gpe_gdi_id">Distrito<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gpe_gdi_id" name="gpe_gdi_id" required>
                </select>
              </div>
              <div class="form-group">
                <label for="gpe_direccion">Dirección<span class="required">*</span></label>
                <input type="text" class="form-control valid validText" id="gpe_direccion" name="gpe_direccion"
                  required="">
              </div>
            </div>
            <div class="col-md-3 border rounded p-2 m-2">
              <p class="text-primary">Datos de Contacto</p>
              <div class="form-group">
                <label for="gpe_email">Email<span class="required">*</span></label>
                <input type="email" class="form-control valid validEmail" id="gpe_email" name="gpe_email" required="">
              </div>
              <div class="form-group">
                <label for="gpe_telefono">Teléfono<span class="required">*</span></label>
                <input type="text" class="form-control valid validNumber" id="gpe_telefono" name="gpe_telefono"
                  required="" onkeypress="return controlTag(event);">
              </div>
              <div class="form-group">
                <label for="gpe_celular">Celular<span class="required">*</span></label>
                <input type="text" class="form-control valid validNumber" id="gpe_celular" name="gpe_celular"
                  required="" onkeypress="return controlTag(event);">
              </div>
              <div class="form-group">
                <label for="gpe_fechan">Fecha de Nacimiento<span class="required">*</span></label>
                <input type="date" class="form-control valid validText" id="gpe_fechan" name="gpe_fechan" required="">
              </div>
            </div>
          </div>
          <div class="tile-footer">
            <button id="set_gpe" class="btn btn-primary" onclick="event.preventDefault();set('gpe')"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modalTable_gpe" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">
          PERSONAS &nbsp;&nbsp;&nbsp;<button type="button" onclick="openModal('gpe');" class="btn btn-danger">Nuevo
            Persona</button>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="gpe_table" width="100%"></table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="select_gpe" class="btn btn-warning" data-dismiss="modal">Seleccionar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>