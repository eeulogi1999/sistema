<!-- Modal -->
<div class="modal fade" id="modal_age" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_age">Nuevo Personas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <div class="datosform pb-1">
          <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" class="custom-control-input" id="customRadio" name="age_t" value="gem_v">
            <label class="custom-control-label" for="customRadio">EMPRESA</label>
          </div>
          <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" class="custom-control-input" id="customRadio2" name="age_t" value="gpe_v">
            <label class="custom-control-label" for="customRadio2">PERSONA</label>
          </div>
        </div>
        <form id="form_age" name="form_age" class="form-horizontal">
          <input type="hidden" id="age_id" name="age_id" value="">
          <div class="datosform pb-1">
            <label for="age_tipo">MARCA<span class="required">*</span></label>
            <input type="text" class="form-control" name="age_marca" id="age_marca">
          </div>
          <div class="datosform pb-1">
            <label for="age_tipo">TIPO<span class="required">*</span></label>
            <select class="form-control" data-live-search="true" id="age_tipo" name="age_tipo" required>
              <option value="2">CLIENTE</option>
              <option value="1">PROVEEDOR</option>
            </select>
          </div>
          <div class="datosform pb-1" id="gem_v">
            <label for="age_gem_id">EMPRESA<span class="required">*</span><a href="#" id="new_gem">
                [<i class="fas fa-plus-circle">Nuevo</i>]
              </a><a href="#" id="tab_gem" class="text-success"> 
                [<i class="fas fa-plus-circle">Ver</i>]
              </a></label>
            <select class="form-control" data-live-search="true" id="age_gem_id" name="age_gem_id" required>
            </select>
          </div>
          <div class="datosform pb-1" id="gpe_v">
            <label for="age_gpe_id">PERSONA<span class="required">*</span>
              <a href="#" id="new_gpe">
                [<i class="fas fa-plus-circle">Nuevo</i>]
              </a>
              <a href="#" id="tab_gpe" class="text-success"> 
                [<i class="fas fa-plus-circle">Ver</i>]
              </a>
            </label>
            <select class="form-control" data-live-search="true" id="age_gpe_id" name="age_gpe_id" required>
            </select>
          </div>
          <div class="datosform pb-1">
            <label for="age_status">STATUS<span class="required">*</span></label>
            <select class="form-control" data-live-search="true" id="age_status" name="age_status" required>
              <option value="1">ACTIVO</option>
              <option value="2">INACTIVO</option>
            </select>
          </div>
        </form>
        <div class="tile-footer">
          <button id="set_age" onclick="event.preventDefault();set('age')" class="btn btn-primary"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>

