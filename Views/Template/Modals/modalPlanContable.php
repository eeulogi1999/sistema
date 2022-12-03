<div class="modal fade" id="modalFormContent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered " role="document">
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
              <input type="hidden" id="idplancontable" name="idplancontable" value="">
              <div class="form-row">
              <div class="form-group col-md-4">
                <label class="control-label">Codigo de Cuenta</label>
                <input class="form-control" id="txtCodigo" name="txtCodigo" type="text" placeholder="Codigo Cuenta"  required="">
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Elemento</label>
                <input class="form-control" id="txtElemento" name="txtElemento" type="text" required="">
              </div>
              <div class="form-group col-md-4">
              <label class="control-label">Tipo de Cuenta</label>
              <select type="text" class="form-control" id="txtTcuenta" name="txtTcuenta">
            <option value="Activo">Activo</option>
            <option value="Pasivo">Pasivo</option>
            <option value="Patrimonio">Patrimonio</option>
            <option value="Ingresos">Ingresos</option>
            <option value="Cuentas de analíticas o de explotación">Cuentas de analíticas o de explotación</option>
            <option value="Cuentas de Orden Acrededoras">Cuentas de Orden Acrededoras</option>
            <option value="Cuentas de orden Deudoras">Cuentas de orden Deudoras</option>
            <option value="Gastos por naturaleza">Gastos por naturaleza</option>
            <option value="Saldos intermediarios de Gestión">Saldos intermediarios de Gestión</option>
                            </select>
              </div>
              <div class="form-group col-md-12">
                <label class="control-label">Descripción</label>
                <textarea class="form-control" id="txtDescripcion" name="txtDescripcion" rows="4"
                  placeholder="Ingrese Descripción" required=""></textarea>
              </div>
              
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

-- Modal -->
<div class="modal fade" id="modalViewContent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Datos del Plan Contable</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
          <tr>
              <td>Id Plan:</td>
              <td id="celPlan_Id"></td>
            </tr>
            <tr>
              <td>Elemento:</td>
              <td id="celElemento"></td>
            </tr>
            <tr>
              <td>Codigo de Cuenta:</td>
              <td id="celCodigo"></td>
            </tr>
            
            <tr>
              <td>Descripción:</td>
              <td id="celDescripcion"></td>
            </tr>         
           
            <tr>
              <td>Tipo de Cuenta:</td>
              <td id="celT_cuenta"></td>
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