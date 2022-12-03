<!-- Modal -->
<div class="modal fade" id="modal_ppa" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal_ppa">Nuevo Personas</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-primary">Todos los campos son obligatorios.</p>
                <form id="form_ppa" name="form_ppa" class="row">
                    <input type="hidden" id="ppa_id" name="ppa_id" value="">
                    <div class="form-group col mb-0">
                        <label for="ppa_col_id">Colaborador<span class="required">*</span></label>
                        <select class="form-control" id="ppa_col_id" name="ppa_col_id"></select>
                    </div>
                    <div class="form-group col mb-0">
                        <label for="ppa_tipo">Tipo<span class="required">*</span></label>
                        <select class="form-control" id="ppa_tipo" name="ppa_tipo">
                            <option value="0">Planilla</option>
                            <option value="1">Adelanto</option>
                        </select>
                    </div>
                    <div class="form-group col mb-0">
                        <label for="ppa_fecha">Fecha<span class="required">*</span></label>
                        <input type="date" class="form-control valid" id="ppa_fecha" name="ppa_fecha" required=""
                            onkeypress="return controlTag(event);">
                    </div>
                </form>
                <form id="form_caj" name="form_caj" class="row mb-3">
                    <input type="hidden" id="caj_id" name="caj_id" value="">
                    <div class="form-group col mb-0">
                        <label for="caj_cue_id">Cuenta<span class="required">*</span></label>
                        <select class="form-control" id="caj_cue_id" name="caj_cue_id"></select>
                    </div>
                    <div class="form-group col mb-0">
                        <label for="caj_t1m_id">Medio<span class="required">*</span></label>
                        <select class="form-control" id="caj_t1m_id" name="caj_t1m_id"></select>
                    </div>
                    <div class="form-group col mb-0">
                        <label for="caj_monto">Monto<span class="required">*</span></label>
                        <input type="text" class="form-control valid" id="caj_monto" name="caj_monto" required="">
                    </div>
                </form>
                <div class="tile-footer">
                    <button id="set_ppa" class="btn btn-primary" onclick="event.preventDefault();setPpa()"><i
                            class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                            class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>