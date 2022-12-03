<!-- Modal -->
<div class="modal fade" id="modalFormContent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">Nuevo Articulo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <form id="formContent" name="formContent" class="form-horizontal">
              <input type="hidden" id="idArticulo" name="idArticulo" value="">
              <p class="text-primary">Todos los campos son obligatorios.</p>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="txtCodigo">Codigo</label>
                  <input type="text" class="form-control" id="txtCodigo" name="txtCodigo" required="">
                </div>
                <div class="form-group col-md-6">
                  <label for="listExistencia">Existencia</label>
                  <select class="form-control" data-live-search="true" id="listExistencia" name="listExistencia" required >
                    </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="txtArticulo">Articulo</label>
                  <input type="text" class="form-control valid validText" id="txtArticulo" name="txtArticulo" required="">
                </div>
                <div class="form-group col-md-6">
                  <label for="listUm">Unidad Medida</label>
                  <select class="form-control" data-live-search="true" id="listUm" name="listUm" required >
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="listCategoria">Categoria</label>
                  <select class="form-control" data-live-search="true" id="listCategoria" name="listCategoria" required=""></select>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtStock">Stock actual</label>
                    <input type="text" class="form-control valid validNumber" id="txtStock" name="txtStock" readonly value="0">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="txtPrecio">Precio</label>
                    <input type="text" class="form-control valid validNumber" id="txtPrecio" name="txtPrecio" required="">
                </div>
               
                <div class="form-group col-md-6">
                    <label for="listStatus">Status</label>
                    <select class="form-control selectpicker" id="listStatus" name="listStatus" required >
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                    </select>
                </div>
             </div>
              <div class="tile-footer">
                <button id="btnActionForm" class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
              </div>
            </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalViewContent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Datos del Articulo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>Código:</td>
              <td id="celCodigo"></td>
            </tr>
            <tr>
              <td>Descripción:</td>
              <td id="celDescripcion"></td>
            </tr>
            <tr>
              <td>Categoría:</td>
              <td id="celCategoria"></td>
            </tr>
            <tr>
              <td>Existencia:</td>
              <td id="celExistencia_id"></td>
            </tr>
            <tr>
              <td>Precio Referencial:</td>
              <td id="celPrecio"></td>
            </tr>
            <tr>
              <td>Stock Actual:</td>
              <td id="celStock"></td>
            </tr>
            
            <tr>
              <td>Unidad de Medida:</td>
              <td id="celUm_id"></td>
            </tr>
            <tr>
              <td>Estado:</td>
              <td id="celEstado"></td>
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

