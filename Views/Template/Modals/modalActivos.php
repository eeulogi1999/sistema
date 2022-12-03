<!-- Modal -->
<div class="modal fade" id="modalAct" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModalAct">Actualizar Datos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formAct" name="formAct" class="form-horizontal">
                    <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son obligatorios.
                    </p>
                    <input type="hidden" id="act_id" name="act_id" value="">

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="act_codigo">Codigo</label>
                            <input type="text" class="form-control" id="act_codigo" name="act_codigo" required="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="act_nombre">Nombre</label>
                            <input type="text" class="form-control" id="act_nombre" name="act_nombre" required="">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="listStatus">Status</label>
                            <select class="form-control selectpicker" id="act_status" name="act_status" required>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="form-row">
                    <div class="col-md-12">
                        <div class="form-row">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>PROPIEDAD<a href="#" id="nuevo_pro">[<i
                                                    class="fas fa-plus-circle">Nuevo</i>]</a></th>
                                        <th class="w-50">VALOR<a href="#" id="nuevo_val">[<i
                                                    class="fas fa-plus-circle">Nuevo</i>]</a>
                                            <a class="text-success" href="#" id="select_val">[<i
                                                    class="fas fa-plus-circle">Seleccionar</i>]</a></th>
                                        <th>ACCIÓN</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select class="form-control" data-live-search="true" id="pro_id"
                                                name="pro_id" required></select>
                                        </td>
                                        <td>
                                            <div class="text-center d-flex" id="val">
                                                <input class="form-control" type="text" name="new_val" id="new_val">
                                                <select class="form-control" data-live-search="true" id="val_id"
                                                    name="val_id" style="display:none"></select>
                                                <button class="btn btn-info btn-sm ml-2" id="set_val" title="Agregar">
                                                    <i class="fa fa-save mr-0"></i></button>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <button class="btn btn-primary  btn-sm"
                                                    onclick="event.preventDefault();setAat();" id="set_aat"
                                                    title="Agregar">
                                                    <i class="fa fa-plus mr-0"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-row">
                            <table class="table table-hover table-bordered" id="aat">
                                <thead>
                                    <tr>
                                        <th>PROPIEDAD</th>
                                        <th class="w-50">VALOR</th>
                                        <th>ACCIÓN</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="act_t9p_id">Plan Contable</label>
                        <div id="act_t9p_id"></div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-inline pr-2">
                            <div class="custom-file w-75">
                                <input id="set_img" type="file" class="custom-file-input"
                                    onchange="previewFiles(this,'act_img')" multiple>
                                <label class="custom-file-label" for="customFile">Seleccionar Imagen</label>
                            </div>
                            <button class="btn btn-danger mt-1 ml-1" ondrop="drop(event)"
                                ondragover="dragover(event)">Delete</button>
                        </div>
                        <div id="act_img"></div>
                    </div>
                </div>
                <div class="tile-footer mt-3">
                    <button id="btnActionForm" class="btn btn-info" type="submit"><i
                            class="fa fa-fw fa-lg fa-check-circle"></i><span
                            id="set_act">Actualizar</span></button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                            class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalPro" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModalPro">Nuevo Atributos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formPro" name="formPro" class="form-horizontal">
                    <input type="hidden" id="pro_id" name="pro_id" value="">
                    <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son obligatorios.
                    </p>
                    <div class="form-group">
                        <label for="pro_nombre">Nombre<span class="required">*</span></label>
                        <input type="text" class="form-control valid " id="pro_nombre" name="pro_nombre" required="">
                    </div>
                    <div class="form-group">
                        <label for="pro_type">Tipo<span class="required">*</span></label>
                        <select class="form-control selectpicker" id="pro_type" name="pro_type" required>
                            <option value="1">ENTERO</option>
                            <option value="2">DECIMAL</option>
                            <option value="3">TEXTO</option>
                            <option value="4">FECHA</option>
                            <option value="5">ARCHIVO</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="pro_revalue">Mostrar Valores Predeterminados<span class="required">*</span></label>
                        <select class="form-control selectpicker" id="pro_revalue" name="pro_revalue" required>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    <div class="tile-footer">
                        <button id="btnSendPro" class="btn btn-primary" type="submit"><i
                                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;<a
                            class="btn btn-secondary" href="#" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalViewAct" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header header-primary">
                <h5 class="modal-title">Datos del Bien</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td>Codigo:</td>
                            <td id="view_act_codigo"></td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td id="view_act_nombre"></td>
                        </tr>
                        <tr>
                            <td>Plan Contable:</td>
                            <td id="view_act_t9p_id"></td>
                        </tr>
                        <tr>
                            <td>Imagenes</td>
                            <td id="view_act_img"></td>
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