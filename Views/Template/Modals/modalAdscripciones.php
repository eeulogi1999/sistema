<!-- Modal -->
<div class="modal fade" id="modal_ads" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModal_ads">Actualizar Datos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form_ads" name="form_ads" class="form-horizontal  border rounded p-3">
                    <input type="hidden" id="ads_id" name="ads_id" value="">
                    <p class="text-primary">Datos Generales</p>
                    <div class="form-row">
                        <div class="form-group col">
                            <label for="ads_fecha">Fecha<span class="required">*</span></label>
                            <input type="date" class="form-control" id="ads_fecha" name="ads_fecha" required="">
                        </div>
                        <div class="form-group col">
                            <label for="ads_col_id">Colaborador<a class="text-success" href="#" id="new_col">
                                        [<i class="fas fa-plus-circle">Ver</i>]</a></label>
                            <select class="form-control" data-live-search="true" id="ads_col_id" name="ads_col_id"
                                required=""></select>
                        </div>
                        <div class="form-group col">
                            <label for="ads_ubi_id">Localizacion <a class="text-success" href="#" id="new_ubi">
                                        [<i class="fas fa-plus-circle">Seleccionar</i>]</a></label>
                            <select class="form-control" data-live-search="true" id="ads_ubi_id" name="ads_ubi_id"
                                required=""></select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col">
                            <label for="ads_tipo">Motivo<span class="required">*</span></label>
                            <select class="form-control" data-live-search="true" id="ads_tipo" name="ads_tipo" required="">
                                <option value="1">REGISTRO</option>
                                <option value="2">ALTA</option></select>
                        </div>
                        <div class="form-group col">
                            <label for="ads_desc">Descripcion<span class="required">*</span></label>
                            <textarea id="ads_desc" name="ads_desc" rows="1" class="form-control"></textarea>
                        </div>
                        <div class="form-group col">
                            <label for="ads_status">Status<span class="required">*</span></label>
                            <select class="form-control" id="ads_status" name="ads_status" required>
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                    </div>
                </form><br>
                <div class="tile">
                        <div class="row">
                            <div class="col px-1">
                                <label for="ade_act_id">Activo <a class="text-success" href="#" id="new_act">
                                        [<i class="fas fa-plus-circle">Seleccionar</i>]</a></label>
                                <select class="form-control" id="ade_act_id" name="ade_act_id" disabled>
                                    <option value="">Seleccione</option>
                                </select>
                            </div>
                            <div class="col px-1">
                                <label for="ade_q">Cantidad </label>
                                <input type="text" class="form-control valid " id="ade_q" name="ade_q" required>
                            </div>
                            <div class="col px-1">
                                <label for="ade_vu">Valor Unitario </label>
                                <input type="text" class="form-control valid " id="ade_vu" name="ade_vu" required>
                            </div>
                            <div class="col px-1">
                                <label for="ade_mt">Monto Total </label>
                                <input type="text" class="form-control valid " id="ade_mt" name="ade_mt" required>
                            </div>
                            <div class="col px-1">
                                <label for="ade_serie">Agregar </label>
                                <button class="btn btn-primary  btn-sm" onclick="event.preventDefault();setAde();"
                                    id="set_ade" style="display:block" title="Agredar">
                                    <i class="fa fa-plus mr-0"></i></button>
                            </div>
                    </div>
                </div>
                <div class="tile">
                    <div class="row">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered" id="ade" width="100%"></table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tile-footer p-1">
                <button id="set_ads" class="btn btn-info" type="submit"><i
                        class="fa fa-fw fa-lg fa-check-circle"></i><span>Actualizar</span></button>&nbsp;&nbsp;&nbsp;
                <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                        class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalTable_act" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header header-primary">
                <h5 class="modal-title text-center text-uppercase">
                    ACTIVOS &nbsp;&nbsp;&nbsp;<button type="button" onclick="openModalAct();"
                        class="btn btn-danger">Nuevo Registro</button>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered table-sm " id="act_table" width="100%"></table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="select_act" class="btn btn-warning" data-dismiss="modal">Seleccionar</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>