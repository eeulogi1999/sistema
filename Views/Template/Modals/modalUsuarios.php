<div class="modal fade" id="modal_gus" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_gus">Nuevo </span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_gus" name="form_gus" class="form-horizontal">
          <input type="hidden" id="gus_id" name="gus_id" value="">
          <div class="row mb-3">
            <div class="form-group col mb-0">
              <label for="gus_gpe_id">PERSONA<span class="required">*</span>
                <a href="#" id="new_gpe">
                  [<i class="fas fa-plus-circle">Nuevo</i>]
                </a>
                <a href="#" id="tab_gpe" class="text-success">
                  [<i class="fas fa-plus-circle">Ver</i>]
                </a>
              </label>
              <select class="form-control" data-live-search="true" id="gus_gpe_id" name="gus_gpe_id" required>
              </select>
            </div>
            <div class="form-group col mb-0">
              <label for="gus_user">USUARIO<span class="required">*</span></label>
              <input type="text" class="form-control valid" id="gus_user" name="gus_user">
            </div>
            <div class="form-group col mb-0">
              <label for="gus_password">CONTRASEÑA<span class="required">*</span></label>
              <input type="password" class="form-control valid" id="gus_password" name="gus_password">
            </div>
          </div>
          <div class="row mb-3">
            <div class="form-group col mb-0">
              <label for="gus_gar_id">AREA<span class="required">*</span>
                <a href="#" id="new_gar">
                  [<i class="fas fa-plus-circle">Nuevo</i>]
                </a>
                <a href="#" id="tab_gar" class="text-success">
                  [<i class="fas fa-plus-circle">Ver</i>]
                </a>
              </label>
              <select class="form-control" data-live-search="true" id="gus_gar_id" name="gus_gar_id" required>
              </select>
            </div>
            <div class="form-group col mb-0">
              <label for="gus_gro_id">ROL<span class="required">*</span>
                <a href="#" id="new_gro">
                  [<i class="fas fa-plus-circle">Nuevo</i>]
                </a>
                <a href="#" id="tab_gro" class="text-success">
                  [<i class="fas fa-plus-circle">Ver</i>]
                </a>
              </label>
              <select class="form-control" data-live-search="true" id="gus_gro_id" name="gus_gro_id" required>
              </select>
            </div>
            <div class="form-group col mb-0">
              <label for="gus_gcl_id">GCL<span class="required">*</span>
                <a href="#" id="new_gcl">
                  [<i class="fas fa-plus-circle">Nuevo</i>]
                </a>
                <a href="#" id="tab_gcl" class="text-success">
                  [<i class="fas fa-plus-circle">Ver</i>]
                </a>
              </label>
              <select class="form-control" data-live-search="true" id="gus_gcl_id" name="gus_gcl_id" required>
              </select>
            </div>
            <div class="form-group col mb-1">
              <label for="gus_status">Status<span class="required">*</span></label>
              <select class="form-control" id="gus_status" name="gus_status" required>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
              </select>
            </div>
          </div>
          <div class="row mb-3">
            <div class="form-group col ">
              <label for="gus_gde_id">Departamento<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gus_gde_id" name="gus_gde_id" required>
              </select>
            </div>
            <div class="form-group col">
              <label for="gus_gpr_id">Provincia<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gus_gpr_id" name="gus_gpr_id" required>
              </select>
            </div>
            <div class="form-group col">
              <label for="gus_gdi_id">Distrito<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gus_gdi_id" name="gus_gdi_id" required>
              </select>
            </div>
          </div>
        </form>
        <div class="tile-footer">
          <button id="set_gus" class="btn btn-primary" onclick="event.preventDefault();set('gus',{php:true})"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>


<div class="modal fade" id="modal_gac" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title h4" >Asignar Permisos</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm" id="gac_table" width="100%"></table>
          </div>
        </div>
    </div>
  </div>
</div>
