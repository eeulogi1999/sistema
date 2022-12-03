<div class="modal fade" id="modal_caj" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_caj">Nuevo </span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_caj" name="form_caj" class="form-horizontal">
            <input type="hidden" id="caj_id" name="caj_id" value="">
            <div class="row mb-3">
              <div class="form-group col mb-0">
                <label for="caj_age_id">Agente<a class="text-success" href="#" id="new_age">
                        [<i class="fas fa-plus-circle">Seleccionar</i>]</a><span class="required">*</span></label>
                <select class="form-control" id="caj_age_id" name="caj_age_id" readonly>
                <option value="0">Seleccione</option>
                </select>
              </div>
              <div class="form-group col mb-0">
                <label for="caj_fecha">Fecha<span class="required">*</span></label>
                <input type="date" class="form-control valid" id="caj_fecha" name="caj_fecha" required=""
                      onkeypress="return controlTag(event);">
              </div>
              <div class="form-group col mb-0">
                <label for="caj_gt4_id">Moneda<span class="required">*</span></label>
                <select class="form-control" id="caj_gt4_id" name="caj_gt4_id"></select>
              </div>
            </div>
            <div class="row mb-3" id="v_gasto">
              <div class="form-group col mb-0">
                <label for="caj_tga_id">Tipo de Gasto<span class="required">*</span></label>
                <select class="form-control" id="caj_tga_id" name="caj_tga_id"></select>
              </div>
              <div class="form-group col mb-0">
                <label for="caj_responsable">Responsable<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="caj_responsable" name="caj_responsable">
              </div>
              <div class="form-group col mb-0">
                <label for="caj_observaciones">Observaciones<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="caj_observaciones" name="caj_observaciones">
              </div>
            </div>
            <div class="row mb-3">
              <div class="form-group col mb-0">
                <label for="caj_cue_id">Cuenta</label>
                <select class="form-control" id="caj_cue_id" name="caj_cue_id"></select>
              </div>
              <div class="form-group col mb-0">
                <label for="caj_t1m_id">Medio de Pago</label>
                <select class="form-control" id="caj_t1m_id" name="caj_t1m_id"></select>
              </div>
              <div class="form-group col mb-0">
                <label for="caj_d_cue_id">Cuenta Destino</label>
                <select class="form-control" id="caj_d_cue_id" name="caj_d_cue_id"></select>
              </div>
              <div class="form-group col mb-0">
                <label for="caj_monto">Monto<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="caj_monto" name="caj_monto" required="">
              </div>
            </div>
        </form>
        <div class="tile-footer">
          <button id="set_caj" class="btn btn-primary"
            onclick="event.preventDefault();setCaj()"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>



<div class="modal fade" id="modalView_caj" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header header-primary">
                <h5 class="modal-title" >DETALLE DEL MOVIMIENTO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body display-6" id="content_pdf">
              <div class="d-flex justify-content-center">
              <img src="<?= media();?>/images/text_cacel.png" alt="" height="30px">
              </div>
              <hr>
              <h3 class="text-center">CONSTANCIA DE <span id="v_caj_tipo"></span></h3>
              <div class="row mb-3">
                <div class="form-group col mb-0">
                  <strong>Fecha: </strong><span id="v_caj_fecha" ></span>
                </div>
                <div class="form-group col mb-0">
                  <strong>Moneda: </strong><span id="v_caj_gt4_id" ></span>
                </div>
              </div>
              <div class="form-group mb-2">
                  <strong>Registrado Por: </strong><span id="v_caj_gus_id" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Agente: </strong><span id="v_caj_age_id" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Tipo de Gasto: </strong><span id="v_caj_tga_id" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Responsable: </strong><span id="v_caj_responsable" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Observaciones: </strong><span id="v_caj_observaciones" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Cuenta: </strong><span id="v_caj_cue_id" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Medio de Pago: </strong><span id="v_caj_t1m_id" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Cuenta Destino: </strong><span id="v_caj_d_cue_id" ></span>
              </div>
              <div class="form-group mb-2">
                  <strong>Monto: </strong><span class="text-danger" id="v_caj_monto" ></span>
              </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="caj_pdf">PDF</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
