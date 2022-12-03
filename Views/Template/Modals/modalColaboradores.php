<!-- Modal -->
<div class="modal fade" id="modal_col" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModal_col">Actualizar Colaborador</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form_col" name="form_col" class="form-horizontal">
                    <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son obligatorios.</p>
                    <input type="hidden" id="col_id" name="col_id" value="">
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <a href="#" id="new_gpe">[<i class="fas fa-plus-circle">Nuevo</i>]</a>
                            <a href="#" id="tab_gpe" class="text-success">[<i class="fas fa-plus-circle">Ver</i>]</a>
                            <label for="col_gpe_id">Persona<span class="required">*</span></label>
                            <select class="form-control" data-live-search="true" id="col_gpe_id" name="col_gpe_id"
                                required=""></select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="col_cod">Codigo<span class="required">*</span></label>
                            <input type="text" class="form-control" id="col_cod" name="col_cod" required="">
                        </div>
                        <div class="form-group col-md-3">
                            <a href="#" id="new_gar">[<i class="fas fa-plus-circle">Nuevo</i>]</a>
                            <a href="#" id="tab_gar" class="text-success">[<i class="fas fa-plus-circle">Ver</i>]</a>
                            <label for="col_gar_id">Area<span class="required">*</span></label>
                            <select class="form-control" data-live-search="true" id="col_gar_id" name="col_gar_id"
                                required=""></select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="col_sbase">Monto<span class="required">*</span></label>
                            <input type="text" class="form-control" id="col_sbase" name="col_sbase" required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="col_puesto">Puesto<span class="required">*</span></label>
                            <input type="text" class="form-control" id="col_puesto" name="col_puesto" required="">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="col_est_id">Establecimiento<span class="required">*</span></label>
                            <select class="form-control" data-live-search="true" id="col_est_id" name="col_est_id"
                                required=""></select>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="col_status">Status<span class="required">*</span></label>
                            <select class="form-control selectpicker" id="col_status" name="col_status" required>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                    </div>
                    <div class="tile-footer">
                        <button id="set_col" onclick="event.preventDefault();set('col')" class="btn btn-info"><i
                                class="fa fa-fw fa-lg fa-check-circle"></i><span
                                id="set_col">Actualizar</span></button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalView_col" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <td>Identificacion:</td>
                            <td id="v_col_identificacion"></td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td id="v_col_nombre"></td>
                        </tr>
                        <tr>
                            <td>Apellidos:</td>
                            <td id="v_col_apellidos"></td>
                        </tr>
                        <tr>
                            <td>Area:</td>
                            <td id="v_col_gar_id"></td>
                        </tr>
                        <tr>
                            <td>Cargo:</td>
                            <td id="v_col_puesto"></td>
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