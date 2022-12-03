<div class="modal fade " id="modalFormCom" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
    data-keyboard="false">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Nueva <?= $data['page_tag'] ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formNcr" name="formNcr" class="form-horizontal">
                    <div class="modal-body">
                        <div class="form-inline">
                            <input type="text" class="form-control valid validText m-2" id="com_serienum"
                                name="com_serienum" required="" placeholder="Documento Referente ">
                            <button id="buscarComprobante" class="btn btn-info m-2" data-toggle=""><i class=""></i>
                                Buscar
                            </button>
                            <select type="text" data="0" class="form-control m-2" id="ncr_mot" name="ncr_mot"></select>
                            <textarea class="form-control m-2 w-50" id="ncr_descripcion" name="ncr_descripcion"
                                placeholder="Descripcion" rows="1"></textarea>
                        </div>
                    </div>
                </form>
                <input type="hidden" id="com_id" name="com_id" value="">
                <div class="form-row">
                    <div class="form-group col-12">
                        <div class="row mb-4">
                            <div class="col-3">
                                <h2 class="page-header"><img
                                        src="<?= base_url() ?>/.uploads/<?= $data['est']['est_logo'] ?>" width="190">
                                </h2>
                            </div>
                            <div class="col-4 h-100 justify-content-center align-items-center">
                                <address class="text-center">
                                    <strong><?= $data['gcl']['gcl_gem_id']['gem_razonsocial'] ?></strong><br></strong>
                                    <?= $data['gcl']['gcl_gem_id']['gem_direccion'] ?><br>
                                    <?= $data['gcl']['gcl_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_gde_id']['gde_departamento'].' - '.$data['gcl']['gcl_gem_id']['gem_gdi_id']['gdi_gpr_id']['gpr_provincia'].' - '.$data['gcl']['gcl_gem_id']['gem_gdi_id']['gdi_distrito'] ?><br>
                                    <strong><?= $data['est']['est_nombre'] ?></strong><br>
                                </address>
                            </div>
                            <div class="col-5   h-100 justify-content-center align-items-center  ">
                                <div class="border rounded border-secondary py-3">
                                    <h5 class="text-center text-uppercase">
                                        RUC:<?=  $data['gcl']['gcl_gem_id']['gem_ruc'] ?></h5>
                                    <h5 class="text-center text-uppercase">
                                        <?=  $data['com']['t10']['t10_descripcion'] ?></h5>
                                    <h1 class="text-center"><span id="com_serie"></span>-<span id="com_numero"></span>
                                    </h1>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <form id="formAge" name="formAge" class="form-horizontal">
                            <div class="datosform pb-1">
                                <div class="row">
                                    <div class="col-md-3 ">
                                        <label for="gpe_gt2_id">Documento <span class="required">*</span></label>
                                    </div>
                                    <div class="col-md-6 px-0">
                                        <select class="form-control" id="gpe_gt2_id"
                                            name="gpe_gt2_id" required>
                                        </select>
                                    </div>
                                    <div class="col-md-3 px-0">
                                        <input type="text" class="form-control valid validNumber"
                                            id="gpe_identificacion" name="gpe_identificacion" required>
                                    </div>
                                </div>
                            </div>
                            <div class="datosform pb-1">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="gpe_nombre" id="labRazonSocial">Nombres <span
                                                class="required">*</span></label>
                                    </div>
                                    <div class="col-md-9 px-0">
                                        <input type="text" class="form-control valid validText" id="gpe_nombre"
                                            name="gpe_nombre" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="datosform pb-1" id="age_apellidos">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="gpe_apellidos" id="labRazonSocial">Apellidos <span
                                                class="required">*</span></label>
                                    </div>
                                    <div class="col-md-9 px-0">
                                        <input type="text" class="form-control valid validText" id="gpe_apellidos"
                                            name="gpe_apellidos" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="datosform pb-1">
                                <div class="row">
                                    <div class="col-md-3 ">
                                        <label for="gpe_direccion">Dirección <span class="required">*</span></label>
                                    </div>
                                    <div class="col-md-9 px-0">
                                        <input type="text" class="form-control valid " id="gpe_direccion"
                                            name="gpe_direccion" required="">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="datosform pb-1">
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="txtUbigeo">Ubigeo <span class="required">*</span></label>
                                </div>
                                <div class="col-md-3 px-0">
                                    <input data="" type="text" class="form-control dropdown-toggle"
                                        data-toggle="dropdown" id="gde_id" name="gde_id" autocomplete="off"
                                        placeholder="Departamento">
                                    <ul class="dropdown-menu" id="gde_id_list">
                                    </ul>
                                </div>
                                <div class="col-md-3 px-0">
                                    <input data="" type="text" class="form-control dropdown-toggle"
                                        data-toggle="dropdown" id="gpr_id" name="gpr_id" autocomplete="off"
                                        placeholder="Provincia">
                                    <ul class="dropdown-menu" id="gpr_id_list">
                                    </ul>
                                </div>
                                <div class="col-md-3 px-0">
                                    <input data="" type="text" class="form-control dropdown-toggle"
                                        data-toggle="dropdown" id="gdi_id" name="gdi_id" autocomplete="off"
                                        placeholder="Distrito">
                                    <ul class="dropdown-menu" id="gdi_id_list">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="datosform pb-1">
                            <div class="row">
                                <div class="col-md-3 pr-0">
                                    <label for="txtUbigeo">Correo</label>
                                </div>
                                <div class="col-md-9 px-0">
                                    <input type="text" class="form-control valid" id="gcl_correo" name="gcl_correo"
                                        placeholder="Correo">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-6 d-flex flex-wrap ">
                        <div class="w-100">
                            <form id="formCom" name="formCom" class="form-horizontal">
                                <div class="datosform pb-1">
                                    <div class="row">
                                        <div class="col-md-4 text-right">
                                            <label for="com_gt4_id">Moneda <span class="required">*</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <select class="form-control" data-live-search="true" id="com_gt4_id"
                                                name="com_gt4_id" required>
                                            </select>
                                        </div>
                                        <div class="col-md-1 px-0">
                                            <label for="com_gtc_id">IGV %</label>
                                        </div>
                                        <div class="col-md-3">
                                            <input class="form-control" id="com_gtc_id" placeholder="18%" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="datosform pb-1">
                                    <div class="row">
                                        <div class="col-md-4 text-right">
                                            <label for="com_fechaE">Fecha de Emisión<span
                                                    class="required">*</span></label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="date" class="form-control valid" id="com_fechaE"
                                                name="com_fechaE" required="" onkeypress="return controlTag(event);"
                                                min="<?php echo date("Y-m-d", strtotime(date("Y-m-d") . "- 07 days")); ?>"
                                                max="<?php echo date("Y-m-d"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="datosform pb-1" id="view_fechav" style="display: none;">
                                    <div class="row">
                                        <div class="col-md-4 text-right">
                                            <label for="com_fechaV">Fecha de Vencimiento</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="date" class="form-control valid" id="com_fechaV"
                                                name="com_fechaV" onkeypress="return controlTag(event);"
                                                min="<?php echo date("Y-m-d"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="datosform pb-1">
                                    <div class="row">
                                        <div class="col-md-4 text-right">
                                            <label for="com_t1m_id">Tipo de Pago <span class="required">*</span></label>
                                        </div>
                                        <div class="col-md-3 pr-0">
                                            <select class="form-control" data-live-search="true" id="com_t1m_id"
                                                name="com_t1m_id" required>
                                                <option value="contado">CONTADO</option>
                                                <option value="credito">CREDITO</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 ">
                                            <input type="text" class="form-control valid" id="num_cuotas"
                                                name="num_cuotas" value="1">
                                        </div>
                                        <div class="col-md-3 px-0">
                                            <button class="btn btn-primary-e ng-star-inserted" id="add_cuotas"
                                                type="button">Agregar cuotas</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
                                                <input type="radio" class="form-check-input" name="radioTdetalle"
                                                    id="radio_1" value="1">Bienes
                                            </label>
                                        </div>
                                        <div class="form-check-inline">
                                            <label class="form-check-label">
                                                <input type="radio" class="form-check-input" name="radioTdetalle"
                                                    id="radio_2" value="2">Servicios
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive-sm">
                                    <table class="table table-hover table-bordered" id="tableCompra"
                                        style="display:none">
                                        <thead>
                                            <tr>
                                                <th class="w-25" class="d-flex align-items-start">
                                                    <div id="tipoDetalle">Nombre Articulo o Cod</div><a href="#"
                                                        onclick="openModalBienes();" id="nuevo_ces">[<i
                                                            class="fas fa-plus-circle">Nuevo</i>]</a>
                                                </th>
                                                <th>Cantidad</th>
                                                <th>Unidad Medida</th>
                                                <th class="w-5 justify-content-center">P.U.
                                                    <span id="view_conigv"><input type="checkbox" id="cde_conigv"
                                                            name="cde_conigv">&nbsp;+Igv</span>
                                                </th>
                                                <th>Tipo de afectación</th>
                                                <th>Importe</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div id="selectBienes">
                                                        <input data="" type="text" class="form-control dropdown-toggle"
                                                            data-toggle="dropdown" id="ces_bie_id" name="ces_bie_id"
                                                            autocomplete="off" placeholder="Seleccione Articulo">
                                                        <ul class="dropdown-menu" id="ces_bie_id_list">
                                                        </ul>
                                                    </div>
                                                    <div id="selectServicios" style="display:none">
                                                        <input data="" type="text" class="form-control dropdown-toggle"
                                                            data-toggle="dropdown" id="ces_ser_id" name="ces_ser_id"
                                                            autocomplete="off" placeholder="Seleccione Servicio">
                                                        <ul class="dropdown-menu" id="ces_ser_id_list">
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control valid" id="cde_q"
                                                        name="cde_q" disabled value="">
                                                </td>
                                                <td>
                                                    <select class="form-control" data-live-search="true" id="cde_t6m_id"
                                                        name="cde_t6m_id" required></select>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control valid " id="cde_vu"
                                                        name="cde_vu" value="" disabled>
                                                </td>
                                                <td>
                                                    <select type="text" class="form-control" id="cde_afectacion"
                                                        name="cde_afectacion"></select>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control valid" id="cde_importe"
                                                        name="cde_importe" value="" disabled>
                                                </td>
                                                <td>
                                                    <div class="text-center">
                                                        <button class="btn btn-primary  btn-sm" id="add_cde"
                                                            title="Agregar" style="display:none"><i
                                                                class="fas fa-plus"></i></button>
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
                                    <table class="table table-hover table-bordered" id="tableRegistrocompra"
                                        width="1060">
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
                                    <label class="pt-4 " for="com_observaciones">Notas y/o Observaciones:</label>
                                    <textarea id="com_observaciones" name="com_observaciones" rows="7"
                                        class="form-control"></textarea>
                                </div>

                                <div class="form-group col-md-3">
                                    <form id="formCte" name="formCte">
                                        <div class="datosform">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="com_exonerada">Exonerada:</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control valid validText"
                                                        id="com_exonerada" name="com_exonerada" value="0.00" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="datosform">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="com_inafecta">Inafecta:</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control valid validText"
                                                        id="com_inafecta" name="com_inafecta" value="0.00" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="datosform">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="com_gravada">Gravada:</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control valid validText"
                                                        id="com_gravada" name="com_gravada" value="0.00" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="datosform">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="cde_subtotal">Sub Total</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control valid validText"
                                                        id="com_subtotal" name="com_subtotal" value="0.00" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="datosform">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="cde_igv">IGV(18%)</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control valid validText" id="com_igv"
                                                        name="com_igv" value="0.00" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="datosform">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="cde_total">Total</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control valid validText"
                                                        id="com_total" name="com_total" value="0.00" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row tile-footer">
                    <div class="col-md-6">
                        <button id="btnSendCom" class="btn btn-primary">
                            <i class="fa fa-fw fa-lg fa-check-circle"></i>
                            <span>Guardar</span>
                        </button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-danger" type="button" data-dismiss="modal">
                            <i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar
                        </button>
                    </div>
                    <div class="col-md-6 text-right">
                        <button id="btnEmitirCom" class="btn btn-info">
                            <i class="fa fa-fw fa-lg fa-check-circle"></i>
                            <span >Emitir Factura</span>
                        </button>&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalFormAcr" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Agregar Cuotas </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formAcr" name="formAcr" class="form-horizontal">
                <div class="modal-body">
                    <div class="datosform pb-1" id="conten_cuotas">
                    </div>
                </div>
            </form>
            <div class="row tile-footer">
                <div class="col-md-6 m-2"><button id="btnSendNcr" class="btn btn-primary">
                        <i class="fa fa-fw fa-lg fa-check-circle"></i><span >Guardar</span>
                    </button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" type="button" data-dismiss="modal">
                        <i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="modalFormMes" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Especificar Bienes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formMes" name="formMes" class="form-horizontal">
                <div class="modal-body">
                    <input type="hidden" id="mes_id" name="mes_id" value="">
                    <p class="text-primary">Los campos con asterisco (<span class="required">*</span>) son obligatorios.
                    </p>
                    <div class="row">
                        <div class="col-md-3">
                            <label for="mes">Id</label>
                            <input type="text" class="form-control valid " id="mes" name="mes" readonly value="1">
                        </div>
                        <div class="col-md-3">
                            <label for="mes_q">Monto</label>
                            <input type="text" class="form-control valid " id="mes_q" name="mes_q" required="">
                        </div>
                        <div class="col-md-6">
                            <label for="mes_bie_id">Fechas de Pago</label>
                            <input type="text" class="form-control valid " id="mes_bie_id" name="mes_bie_id"
                                required="">
                        </div>
                    </div>
                    <div class="row tile-footer">
                        <div class="col-md-6"><button id="btnSendMes" class="btn btn-primary" type="submit">
                                <i class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span>
                            </button>&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-danger" type="button" data-dismiss="modal">
                                <i class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
