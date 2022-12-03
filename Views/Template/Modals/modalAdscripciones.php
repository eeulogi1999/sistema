<!-- Modal -->
<div class="modal fade" id="modal_ads" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerUpdate">
                <h5 class="modal-title" id="titleModal">Actualizar Datos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#Asignacion">Asignación</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#detallesAsi">Detalles</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="Asignacion" class="container tab-pane active"><br>
                        <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son
                            obligatorios.
                        </p>
                        <div class="form-row">
                            <div class="col-md-6 ">
                                <form id="formAsi" name="formAsi" class="form-horizontal  border rounded p-3">
                                    <input type="hidden" id="ads_id" name="ads_id" value="">
                                    <p class="text-primary">Datos Generales</p>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="ads_fecha">Fecha<span class="required">*</span></label>
                                            <input type="date" class="form-control" id="ads_fecha" name="ads_fecha"
                                                required="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="#" id="nuevo_col">[<i class="fas fa-plus-circle">Nuevo</i>]</a>
                                            <label for="ads_col_id">Colaborador<span class="required">*</span></label>
                                            <select class="form-control" data-live-search="true" id="ads_col_id"
                                                name="ads_col_id" required=""></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ads_motivo">Motivo<span class="required">*</span></label>
                                        <textarea id="ads_motivo" name="ads_motivo" rows="7"
                                            class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="ads_status">Status<span class="required">*</span></label>
                                        <select class="form-control selectpicker" id="ads_status" name="ads_status"
                                            required>
                                            <option value="1">Activo</option>
                                            <option value="2">Inactivo</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6 border rounded p-2 ">
                                <p class="text-primary">Ubicación del equipo</p>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="gde_id">Departamento<span class="required">*</span></label>
                                        <select class="form-control" data-live-search="true" id="gde_id" name="gde_id"
                                            required=""></select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="gpr_id">Provincia<span class="required">*</span></label>
                                        <select class="form-control" data-live-search="true" id="gpr_id" name="gpr_id"
                                            required=""></select>
                                    </div>
                                </div>
                                <form id="formUbi" name="formUbi" class="form-horizontal ">
                                    <input type="hidden" id="ubi_id" name="ubi_id" value="">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="ubi_gdi_id">Distrito<span class="required">*</span></label>
                                            <select class="form-control" data-live-search="true" id="ubi_gdi_id"
                                                name="ubi_gdi_id" required=""></select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="#" id="nuevo_gar">[<i class="fas fa-plus-circle">Nuevo</i>]</a>
                                            <label for="ubi_gar_id">Área<span class="required">*</span></label>
                                            <select class="form-control" data-live-search="true" id="ubi_gar_id"
                                                name="ubi_gar_id" required=""></select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="#" id="nuevo_est">[<i class="fas fa-plus-circle">Nuevo</i>]</a>
                                            <label for="ubi_est_id">Establecimiento<span
                                                    class="required">*</span></label>
                                            <select class="form-control" data-live-search="true" id="ubi_est_id"
                                                name="ubi_est_id" required=""></select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="ubi_piso">Piso<span class="required">*</span></label>
                                            <input type="text" class="form-control" id="ubi_piso" name="ubi_piso"
                                                required="">   
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="border rounded p-3 ">
                                                <div class="form-row">
                                                    <label class="text-primary" for="ubi_etr_id">Código de estación de
                                                        trabajo<span class="required">*</span></label>
                                                    <input type="text" class="form-control" id="ubi_etrabajo" name="ubi_etrabajo"
                                                |   required=""> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="detallesAsi" class="container tab-pane fade"><br>
                        <input type="hidden" id="ade_id" name="ade_id" value="">
                        <div class="row">

                            <div class="col-md-3">
                                <label for="ade_fechaa">Fecha <span class="required">*</span></label>
                                <input type="date" class="form-control valid " id="ade_fechaa" name="ade_fechaa"
                                    required>

                            </div>
                        </div>
                        <div class="border rounded mt-2">


                            <div class="row px-4">
                                <div class="row col-md-12 text-center">
                                    <div class="col-md-2 px-1">
                                        <label for="ade_act_id">Activo <a class="text-success" href="#" id="nuevo_act">
                                                [<i class="fas fa-plus-circle">Seleccionar</i>]</a></label>
                                        <select class="form-control" id="ade_act_id" name="ade_act_id" disabled>
                                            <option value="">Seleccione</option>
                                            </select>
                                    </div>
                                    <div class="col-md-2 px-1">
                                        <label for="ade_serie">Serie </label>
                                        <input type="text" class="form-control valid " id="ade_serie" name="ade_serie"
                                            required>
                                    </div>
                                    <div class="col-md-2 px-1">
                                        <label for="ade_vutil">Vida util </label>
                                        <input type="text" class="form-control valid " id="ade_vutil" name="ade_vutil"
                                            required>
                                    </div>
                                    <div class="col-md-1 px-1">
                                        <label for="ade_q">Cantidad </label>
                                        <input type="text" class="form-control valid " id="ade_q" name="ade_q" required>
                                    </div>
                                    <div class="col-md-2 px-1">
                                        <label for="ade_vu">Valor Unitario </label>
                                        <input type="text" class="form-control valid " id="ade_vu" name="ade_vu"
                                            required>
                                    </div>
                                    <div class="col-md-2 px-1">
                                        <label for="ade_mt">Monto Total </label>
                                        <input type="text" class="form-control valid " id="ade_mt" name="ade_mt"
                                            required>
                                    </div>
                                    <div class="col-md-1 px-1 "
                                        style="align-content: flex-start; display: flex; justify-content: center; flex-wrap: wrap;">
                                        <label for="ade_serie">Agregar </label>
                                        <button class="btn btn-primary  btn-sm"
                                            onclick="event.preventDefault();setAde();" id="set_ade"
                                            style="display:block" title="Agredar">
                                            <i class="fa fa-plus mr-0"></i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="row pt-2">
                                <div class="col-md-12">
                                    <div class="tile mb-0">
                                        <div class="tile-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered" id="ade" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Cantidad</th>
                                                            <th>Activo</th>
                                                            <th>Serie</th>
                                                            <th>Fecha Ad.</th>
                                                            <th>Vida util</th>
                                                            <th>Valor Unitario</th>
                                                            <th>Monto Total</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="text-center">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        ACTIVOS &nbsp;&nbsp;&nbsp;<button type="button" onclick="openModalAct();" class="btn btn-danger">Nuevo Registro</button>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="act_table"></div>
      </div>
      <div class="modal-footer">
        <button type="button" id="select_act" class="btn btn-warning" data-dismiss="modal">Seleccionar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>