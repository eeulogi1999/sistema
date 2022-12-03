<!-- Modal -->
<div class="modal fade" id="modal_gem" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_gem">Nuevo Empresa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <div class="form-row">
          <div class="col-md-6">
            <form id="form_gem" name="form_gem" class="form-horizontal">
            <input type="hidden" id="gem_id" name="gem_id" value="">
              <div class="form-group mb-0">
                <label for="gem_ruc">RUC <span class="required">*</span></label>
                <input type="text" class="form-control" id="gem_ruc" name="gem_ruc" required="">
              </div>
              <div class="form-group mb-0">
                <label for="gem_razonsocial">Razon Social <span class="required">*</span></label>
                <input type="text" class="form-control valid" id="gem_razonsocial" name="gem_razonsocial" required="">
              </div>
              <div class="form-group mb-0">
                <label for="gem_gdi_id">Distrito<span class="required">*</span></label>
                <select class="form-control" data-live-search="true" id="gem_gdi_id" name="gem_gdi_id" required>
                </select>
              </div>
              <div class="form-group mb-0">
                <label for="gem_direccion">Direccion <span class="required">*</span></label>
                <input type="text" class="form-control valid " id="gem_direccion" name="gem_direccion" required="">
              </div>
              <div class="form-group">
                <label for="gem_status">Status <span class="required">*</span></label>
                <select class="form-control selectpicker" id="gem_status" name="gem_status" required>
                  <option value="1">Activo</option>
                  <option value="2">Inactivo</option>
                </select>
              </div>
            </form>
          </div>
          <div class="col-md-6">
            <div class="form-group mb-0">
              <label for="gem_gde_id">Departamento<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gem_gde_id" name="gem_gde_id" required>
              </select>
            </div>
            <div class="form-group mb-0 pb-5">
              <label for="gem_gpr_id">Provincia<span class="required">*</span></label>
              <select class="form-control" data-live-search="true" id="gem_gpr_id" name="gem_gpr_id" required>
              </select>
            </div>
            <div class="d-inline p-2">
              <div class="custom-file w-50">
                <input id="set_gem_img" type="file" class="custom-file-input" onchange="previewFiles(this,'gem_img')"
                  multiple>
                <label class="custom-file-label" for="customFile">Seleccionar Imagen</label>
              </div>
              <button class="btn btn-danger mt-1 ml-4" ondrop="drop(event)" ondragover="dragover(event)">Delete</button>
            </div>
            <div id="gem_img"></div>
          </div>
        </div>
        <div class="tile-footer">
          <button id="set_gem" class="btn btn-primary" onclick="event.preventDefault();set('gem',['gem_ruc'])"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modalTable_gem" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">
          EMPRESAS &nbsp;&nbsp;&nbsp;<button type="button" onclick="openModal('gem');" class="btn btn-danger">Nuevo
            Empresa</button>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="gem_table" width="100%"></table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="select_gem" class="btn btn-warning" data-dismiss="modal">Seleccionar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalView_gem" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Datos del Empresa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>Id Empresa:</td>
              <td id="celId"></td>
            </tr>
            <tr>
              <td>RUC:</td>
              <td id="celRuc"></td>
            </tr>
            <tr>
              <td>Razon Social:</td>
              <td id="celRazonS"></td>
            </tr>
            <tr>
              <td>Direccion:</td>
              <td id="celdireccion"></td>
            </tr>
            <tr>
              <td>Estado:</td>
              <td id="celEstado"></td>
            </tr>
            <tr>
              <td>Logo:</td>
              <td id="cellogo"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


