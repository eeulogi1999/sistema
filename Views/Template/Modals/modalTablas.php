<div class="modal fade" id="modalFormContent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">Nuevo <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="tile">
          <div class="tile-body">
            <form id="formContent" name="formContent">
              <input type="hidden" id="idTabla" name="idTabla" value="">
              <div class="form-group">
                <label class="control-label">Código</label>
                <input class="form-control" id="txtCodigo" name="txtCodigo" type="text" placeholder="Nombre del Tabla"
                  required="">
              </div>
              <div class="form-group">
                <label class="control-label">Descripción</label>
                <textarea class="form-control" id="txtDescripcion" name="txtDescripcion" rows="2"
                  placeholder="Ingrese Descripción" required=""></textarea>
              </div>
              <div class="form-group">
                  <label for="listStatus">Status</label>
                  <select class="form-control selectpicker" id="listStatus" name="listStatus" required >
                      <option value="1">Activo</option>
                      <option value="2">Inactivo</option>
                  </select>
              </div>
              <div class="tile-footer">
                <button id="btnActionForm" class="btn btn-primary" type="submit"><i
                    class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"
                  data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>