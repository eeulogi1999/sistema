<div class="modal fade" id="modalFormContent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
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
              <input type="hidden" id="alm_id" name="alm_id" value="">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="control-label">Nombre</label>
                    <input class="form-control" id="alm_nombre" name="alm_nombre" type="text"
                      placeholder="Nombre del Almacen" required="">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Direccion</label>
                    <textarea class="form-control" id="alm_direccion" name="alm_direccion" rows="2"
                      placeholder="Ingrese Direccion" required=""></textarea>
                  </div>
                  <div class="form-group">
                    <label class="control-label">Distrito</label>
                    <input class="form-control" id="alm_gdi_id" name="alm_gdi_id" type="text"
                      placeholder="Id del Distrito" required="">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Establecimiento</label>
                    <input class="form-control" id="alm_est_id" name="alm_est_id" type="text"
                      placeholder="Id del Establecimiento" required="">
                  </div>
                  <div class="form-group">
                    <label for="listStatus">Status</label>
                    <select class="form-control selectpicker" id="alm_status" name="alm_status" required>
                      <option value="1">Activo</option>
                      <option value="2">Inactivo</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="photo">
                    <label for="foto">Foto (570x380)</label>
                    <div class="prevPhoto">
                      <span class="delPhoto notBlock">X</span>
                      <label for="foto"></label>
                      <div>
                        <img id="img" src="<?= media(); ?>/images/empresa.png">
                      </div>
                    </div>
                    <div class="upimg">
                      <input type="file" name="foto" id="foto">
                    </div>
                    <div id="form_alert"></div>
                  </div>
                </div>
              </div>
              <div class="tile-footer">
                <button id="btnActionForm" class="btn btn-primary" type="submit"><i
                    class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;<a
                  class="btn btn-secondary" href="#" data-dismiss="modal"><i
                    class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>