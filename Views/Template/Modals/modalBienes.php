<!-- Modal -->
<div class="modal fade" id="modalFormBienes" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModalBie">Nuevo Bien</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home">Bien</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#menu1">Atributos</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " data-toggle="tab" href="#menu2"><i class="fas fa-plus-circle"></i>
                            BASE SUNAT</a>
                    </li>

                </ul>
                <p class="text-primary pt-2">Campos son obligatorios (*).</p>
                <div class="tab-content">
                    <div id="home" class="container tab-pane active"><br>
                        <form id="formBie" name="formBie" class="form-horizontal">
                            <input type="hidden" id="bie_id" name="bie_id" value="">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="bie_codigo">Codigo<span class="required">*</span></label>
                                        <input type="text" class="form-control valid " id="bie_codigo" name="bie_codigo"
                                            required="">
                                    </div>
                                    <div class="form-group mb-0">
                                        <label for="bie_t6m_id">CALIDAD<span class="required">*</span></label>
                                        <select class="form-control " id="bie_t6m_id" name="bie_t6m_id" required>
                                        </select>
                                    </div>
                                    <div class="form-group mb-0">
                                        <label for="bie_p">Precio Unitarios<span class="required">*</span></label>
                                        <input type="text" class="form-control valid " id="bie_p" name="bie_p"
                                            required="">
                                        <input type="checkbox" id="bie_igv" name="bie_igv">IGV
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="bie_nombre">Nombre <span class="required">*</span></label>
                                        <input type="text" class="form-control valid validEmail " id="bie_nombre"
                                            name="bie_nombre" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="bie_status">Status<span class="required">*</span></label>
                                        <select class="form-control selectpicker" id="bie_status" name="bie_status"
                                            required>
                                            <option value="1">Activo</option>
                                            <option value="0">Inactivo</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="menu1" class="container tab-pane fade"><br>
                        <div class="form-row">
                            <div class="col-md-6">
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
                                                        <input class="form-control" type="text" name="new_val"
                                                            id="new_val">
                                                        <select class="form-control" data-live-search="true" id="val_id"
                                                            name="val_id" style="display:none"></select>
                                                        <button class="btn btn-info btn-sm ml-2" id="set_val"
                                                            title="Agregar">
                                                            <i class="fa fa-save mr-0"></i></button>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="text-center">
                                                        <button class="btn btn-primary  btn-sm"
                                                            onclick="event.preventDefault();setBat();" id="set_bat"
                                                            title="Agregar">
                                                            <i class="fa fa-plus mr-0"></i></button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="form-row">
                                    <table class="table table-hover table-bordered" id="bat">
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
                            <div class="col-md-6">
                                <div class="d-inline p-2">
                                    <div class="custom-file w-50">
                                        <input id="set_img" type="file" class="custom-file-input" onchange="previewFiles(this,'bie_img')" multiple>
                                        <label class="custom-file-label" for="customFile">Seleccionar Imagen</label>
                                    </div>
                                    <button class="btn btn-danger mt-1 ml-4" ondrop="drop(event)" ondragover="dragover(event)">Delete</button>
                                </div>
                                <div id="bie_img"></div>
                            </div>
                        </div>
                    </div>
                    <div id="menu2" class="container tab-pane fade"><br>
                        <form id="formBbi" name="formBbi" class="form-horizontal">
                            <input type="hidden" id="bbi_id" name="bbi_id" value="">
                            <div class="form-row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group mb-0">
                                        <label for="bbi_t5e_id">Existencia</label>
                                        <select class="form-control" data-live-search="true" id="bbi_t5e_id"
                                            name="bbi_t5e_id">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4"></div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4">
                                    <label class="w-100 text-center" for="bbi_c70_id">Clase 70</label>
                                    <div id="bbi_c70_id" class="d-flex justify-content-center"></div>
                                </div>
                                <div class="col-md-4">
                                    <label class="w-100 text-center" for="bbi_c60_id">Clase 60</label>
                                    <div id="bbi_c60_id" class="d-flex justify-content-center"></div>
                                </div>
                                <div class="col-md-4">
                                    <label class="w-100 text-center" for="bbi_c61_id">Clase 61</label>
                                    <div id="bbi_c61_id" class="d-flex justify-content-center"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <br>
                <div class="tile-footer container">
                    <div class="row justify-content-end">
                        <div class="col align-self-start"></div>
                        <div class="col align-self-center"></div>
                        <div class="col align-self-center"></div>
                        <div class="col align-self-end">
                            <button id="set_bie" class="btn btn-primary" type="submit"><i
                                    class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                                    class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<!-- Modal -->
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
                                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary"
                            href="#" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="modalFormContent3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Nuevo Bien</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formContent" name="formContent" class="form-horizontal">
                    <input type="hidden" id="idBien" name="idBien" value="">
                    <p class="text-primary">Todos los campos son obligatorios.</p>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalViewBie" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header header-primary">
                <h5 class="modal-title" >Datos del Bien</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td>Codigo:</td>
                            <td id="view_bie_codigo"></td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td id="view_bie_nombre"></td>
                        </tr>
                        <tr>
                            <td>Medida:</td>
                            <td id="view_bie_t6m_id"></td>
                        </tr>
                        <tr>
                            <td>Precio:</td>
                            <td id="view_bie_p"></td>
                        </tr>
                        <tr>
                            <td>Imagenes</td>
                            <td id="view_bie_img"></td>
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