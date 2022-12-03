<!-- Modal -->
<div class="modal fade" id="modalFormRegistro" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal">Nuevo <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formRegistro" name="formRegistro" class="form-horizontal">
          <input type="hidden" id="idRegistro" name="idRegistro" value="">
          <p class="text-primary">Todos los campos son obligatorios.</p>
          <div class="form-row">
            <div class="form-group col-md-5">
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-3">
                    <label for="listTdoc">Documento <span class="required">*</span></label>
                  </div>
                  <div class="col-md-9">
                    <select class="form-control" data-live-search="true" id="listTdoc" name="listTdoc" required>
                    </select>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-3">
                    <label for="txtRuc" id="labRuc">Ruc <span class="required">*</span></label>
                  </div>
                  <div class="col-md-9">
                    <input type="text" class="form-control valid validNumber" id="txtRuc" name="txtRuc" required>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-3">
                    <label for="txtRazonSocial" id="labRazonSocial">Razon Social <span class="required">*</span></label>
                  </div>
                  <div class="col-md-9">
                    <input type="text" class="form-control valid validText" id="txtRazonSocial" name="txtRazonSocial"
                      required="">
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-3">
                    <label for="txtDireccion">Dirección <span class="required">*</span></label>
                  </div>
                  <div class="col-md-9">
                    <input type="text" class="form-control valid " id="txtDireccion" name="txtDireccion" required="">
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-3">
                    <label for="txtUbigeo">Ubigeo <span class="required">*</span></label>
                  </div>
                  <div class="col-md-3 pr-0">
                    <input type="text" class="form-control valid " id="txtDistrito" name="txtDistrito" placeholder="Distrito">
                  </div>
                  <div class="col-md-3 px-0">
                    <input type="text" class="form-control valid " id="txtProvincia" name="txtProvincia" placeholder="Provincia">
                  </div>
                  <div class="col-md-3 pl-0">
                    <input type="text" class="form-control valid " id="txtDepartamento" name="txtDepartamento" placeholder="Dpto">
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group col-md-2">
            </div>
            <div class="form-group col-md-5 d-flex flex-wrap align-content-end">
              <div class="w-100">
                <div class="datosform pb-1">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="listTMoney">Tipo Moneda <span class="required">*</span></label>
                    </div>
                    <div class="col-md-8">
                      <select class="form-control" data-live-search="true" id="listTMoney" name="listTMoney" required>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="datosform pb-1">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="listComprobante">Tipo Comprobante<span class="required">*</span></label>
                    </div>
                    <div class="col-md-8">
                      <select class="form-control" data-live-search="true" id="listComprobante" name="listComprobante"
                        required>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="datosform pb-1">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="txtFechaEmision">Fecha de Emisión<span class="required">*</span></label>
                    </div>
                    <div class="col-md-8">
                      <input type="date" class="form-control valid" id="txtFechaEmision" name="txtFechaEmision"
                        required="" onkeypress="return controlTag(event);">
                    </div>
                  </div>
                </div>
                <div class="datosform pb-1" id="tcambio">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="txtTcambio">Tipo de Cambio</label>
                    </div>
                    <div class="col-md-2 pr-0 pt-1 text-center">
                      <label class="switch">
                        <input type="checkbox" id="ChangeEnabled" checked disabled>
                        <span class="slider round"></span>
                      </label>
                    </div>
                    <div class="col-md-3 px-0">
                      <input type="text" class="form-control valid " id="txtTCambioCompra" name="txtDepartamento" placeholder="Compra" readonly>
                    </div>
                    <div class="col-md-3 pl-0">
                      <input type="text" class="form-control valid " id="txtTCambioVenta" name="txtDepartamento" placeholder="Venta" readonly>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="datosform pb-2">
                    <div class="text-center">
                        <div class="form-check-inline">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="radioTdetalle" value="1" >Bienes
                          </label>
                        </div>
                        <div class="form-check-inline">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="radioTdetalle" value="2" >Servicios
                          </label>
                        </div>
                    </div>
                  </div>
                  <div class="table-responsive-sm">
                    <table class="table table-hover table-bordered" id="tableCompra" style="display:none">
                      <thead>
                        <tr>
                          <th>Cantidad</th>
                          <th class="w-25" id="tipoDetalle">Nombre Articulo o Cod</th>
                          <th>Unidad Medida</th>
                          <th class="w-5">P.U.</th>
                          <th>Tipo de afectación</th>
                          <th>Importe</th>
                          <th>Acciones</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <input type="text" class="form-control valid" id="txtCantidad" name="txtCantidad" disabled value="0.00">
                          </td>
                          <td>
                            <select class="form-control" data-live-search="true" id="listArticulo" name="listArticulo" style="display:none"></select>
                            <input type="text" class="form-control valid" id="txtDescripcion" name="txtDescripcion" style="display:none">
                          </td>
                          <td>
                            <select class="form-control" data-live-search="true" id="listUmedida" name="listUmedida" required></select>
                          </td>
                          <td>
                            <input type="text" class="form-control valid " id="txtPunitario" name="txtPunitario" value="0.00" disabled>
                          </td>
                          <td>
                            <select type="text" class="form-control" id="listAfeccion" name="listAfeccion"></select>
                          </td>
                          <td>
                            <input type="text" class="form-control valid" id="txtImporte" name="txtImporte" value="0.00" disabled>
                          </td>
                          <td>
                            <div class="text-center">
                            <button class="btn btn-primary  btn-sm" id="add_product" title="Agregar" style="display:none" ><i class="fas fa-plus"></i></button>
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="tableRegistrocompra" width="1060">
                      <thead>
                        <tr>
                          <th>N°</th>
                          <th>Cantidad</th>
                          <th>Articulo</th>
                          <th>Unidad Medida</th>
                          <th>PU</th>
                          <th>Tipo de afectación</th>
                          <th>Importe</th>
                          <th>Acciones</th>
                        </tr>
                      </thead>
                      <tbody class="text-center">
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-9 ">
                  <label class="pt-4 " for="description_observation ">Notas y/o Observaciones:</label>
                  <textarea id="description_observation" name="description_observation" rows="7" class="form-control"></textarea>
                  </div>
                  <div class="form-group col-md-3">
                    <div class="datosform">
                      <div class="row">
                        <div class="col-md-4">
                          <label for="txtExonerada">Exonerada:</label>
                        </div>
                        <div class="col-md-8">
                          <input type="text" class="form-control valid validText" id="txtExonerada" name="txtExonerada" value="0.00" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="datosform">
                      <div class="row">
                        <div class="col-md-4">
                          <label for="txtInafecta">Inafecta:</label>
                        </div>
                        <div class="col-md-8">
                          <input type="text" class="form-control valid validText" id="txtInafecta" name="txtInafecta" value="0.00" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="datosform">
                      <div class="row">
                        <div class="col-md-4">
                          <label for="txtGravada">Gravada:</label>
                        </div>
                        <div class="col-md-8">
                          <input type="text" class="form-control valid validText" id="txtGravada" name="txtGravada" value="0.00" readonly>
                        </div>
                      </div>
                    </div>
                      <div class="datosform">
                        <div class="row">
                          <div class="col-md-4">
                            <label for="txtSubtotal">Sub Total</label>
                          </div>
                          <div class="col-md-8">
                            <input type="text" class="form-control valid validText" id="txtSubtotal" name="txtSubtotal" value="0.00" readonly >
                          </div>
                        </div>
                      </div>
                      <div class="datosform">
                      <div class="row">
                        <div class="col-md-4">
                          <label for="txtIGVAplicado">IGV(18%)</label>
                        </div>
                        <div class="col-md-8">
                          <input type="text" class="form-control valid validText" id="txtIGVAplicado" name="txtIGVAplicado" value="0.00" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="datosform">
                      <div class="row">
                        <div class="col-md-4">
                          <label for="txtTotal">Total</label>
                        </div>
                        <div class="col-md-8">
                          <input type="text" class="form-control valid validText" id="txtTotal" name="txtTotal" value="0.00" readonly>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tile-footer">
            <button id="btnActionForm" class="btn btn-primary" type="submit"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button  class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle" ></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalViewUser" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title" id="titleModal">Datos del usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>Identificación:</td>
              <td id="celIdentificacion">654654654</td>
            </tr>
            <tr>
              <td>Nombres:</td>
              <td id="celNombre">Jacob</td>
            </tr>
            <tr>
              <td>Apellidos:</td>
              <td id="celApellido">Jacob</td>
            </tr>
            <tr>
              <td>Teléfono:</td>
              <td id="celTelefono">Larry</td>
            </tr>
            <tr>
              <td>Email (Usuario):</td>
              <td id="celEmail">Larry</td>
            </tr>
            <tr>
              <td>Tipo Usuario:</td>
              <td id="celTipoUsuario">Larry</td>
            </tr>
            <tr>
              <td>Estado:</td>
              <td id="celEstado">Larry</td>
            </tr>
            <tr>
              <td>Fecha registro:</td>
              <td id="celFechaRegistro">Larry</td>
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