<!-- Modal -->
<div class="modal fade" id="modal_ubi" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModal_ubi">Actualizar Colaborador</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form_ubi" name="form_ubi" class="form-horizontal">
                    <input type="hidden" id="ubi_id" name="ubi_id" value="">
                    <div class="form-row">
                        <div class="form-group col">
                            <label for="ubi_clave">PROPIEDAD<span class="required">*</span></label>
                            <input type="text" class="form-control" id="ubi_clave" name="ubi_clave" required="">
                        </div>
                        <div class="form-group col">
                            <label for="ubi_valor">DESCRIPCION</label>
                            <input type="text" class="form-control" id="ubi_valor" name="ubi_valor" required="">
                        </div>
                        <div class="form-group col">
                            <label for="ubi_est_id">ESTABLECIMIENTO <a class="text-success" href="#" id="new_est">
                                        [<i class="fas fa-plus-circle">Seleccionar</i>]</a></label>
                            <select class="form-control" id="ubi_est_id" name="ubi_est_id"
                                required=""></select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col">
                            <label for="ubi_alm_id">ALMACEN<span class="required">*</span></label>
                            <select class="form-control" id="ubi_alm_id" name="ubi_alm_id" required=""></select>
                        </div>
                        <div class="form-group col">
                            <label for="ubi_gar_id">AREA<span class="required">*</span></label>
                            <select class="form-control" id="ubi_gar_id" name="ubi_gar_id" required=""></select>
                        </div>
                        <div class="form-group col">
                            <label for="ubi_status">ESTADO<span class="required">*</span></label>
                            <select class="form-control" id="ubi_status" name="ubi_status" required>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                    </div>
                    <div class="tile-footer">
                        <button id="set_ubi" onclick="event.preventDefault();set('ubi')" class="btn btn-info"><i
                                class="fa fa-fw fa-lg fa-check-circle"></i><span
                                id="set_ubi">Actualizar</span></button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalView_ubi" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <td>Identificacion:</td>
                            <td id="v_ubi_identificacion"></td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td id="v_ubi_nombre"></td>
                        </tr>
                        <tr>
                            <td>Apellidos:</td>
                            <td id="v_ubi_apellidos"></td>
                        </tr>
                        <tr>
                            <td>Area:</td>
                            <td id="v_ubi_gar_id"></td>
                        </tr>
                        <tr>
                            <td>Cargo:</td>
                            <td id="v_ubi_puesto"></td>
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