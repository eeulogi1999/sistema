<!-- Modal -->

<div class="modal fade" id="modalFormContent" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Nuevo Empresa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formContent" name="formContent" class="form-horizontal">
                    <input type="hidden" id="id_empresa" name="id_empresa" value="">

                    <p class="text-primary">Todos los campos son obligatorios.</p>
                    <div class="form-row">
                    <div class="col-md-12">
                    <div class="form-group  row text-center">
                                <div class="col-md-6">
                                    <label for="txtRuc">Tipo de Registro<span class="required">*</span></label>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-left">
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" id="radioCliente" name="radioStakehol"
                                                    value="1">Clientes
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" id="radioProv" name="radioStakehol"
                                                    value="2">Proveedores
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                    </div>
                        <div class="col-md-6">
                            
                            <div class="form-group mb-0">
                                <label for="txtRuc">RUC <span class="required">*</span></label>
                                <input type="text" class="form-control" id="txtRuc" name="txtRuc" required="" disabled>
                            </div>
                            <div class="form-group mb-0">
                                <label for="txtNombre">Nombre<span class="required">*</span></label>
                                <input type="text" class="form-control valid validText" id="txtNombre" name="txtNombre"
                                    required="" disabled>
                            </div>
                            <div class="form-group mb-0">
                                <label for="txtDireccion">Dirección <span class="required">*</span></label>
                                <input type="text" class="form-control valid " id="txtDireccion" name="txtDireccion"
                                    required="" disabled>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-0">
                                <label for="txtCorreo">Correo</label>
                                <input type="email" class="form-control valid validEmail" id="txtCorreo" name="txtCorreo"
                                     disabled>
                            </div>
                            <div class="form-group mb-0">
                                <label for="txtTelefono">Teléfono </label>
                                <input type="text" class="form-control valid validNumber " id="txtTelefono" name="txtTelefono"
                                     disabled >
                            </div>
                            <div class="form-group mb-0">
                                <label for="listStatus">Status <span class="required">*</span></label>
                                <select class="form-control selectpicker" id="listStatus" name="listStatus" required >
                                    <option value="1">Activo</option>
                                    <option value="2">Inactivo</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="tile-footer">
                        <button id="btnActionForm" class="btn btn-primary" type="submit"><i
                                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalViewContent" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <td>IdRegistro:</td>
                            <td id="celId"></td>
                        </tr>
                        <tr>
                            <td>Identificador:</td>
                            <td id="celIdentificador"></td>
                        </tr>
                        <tr>
                            <td>nombre:</td>
                            <td id="celnombre"></td>
                        </tr>
                        <tr>
                            <td>direccion:</td>
                            <td id="celdireccion"></td>
                        </tr>
                        <tr>
                            <td>correo:</td>
                            <td id="celcorreo"></td>
                        </tr>
                        <tr>
                            <td>telefono:</td>
                            <td id="celtel"></td>
                        </tr>
                        <tr>
                            <td>tipo:</td>
                            <td id="celTipo"></td>
                        </tr>
                        <tr>
                            <td>status:</td>
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