<div class="modal fade" id="modal_mov" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_mov">Nueva <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="formMov" name="formMov" class="form-horizontal">
          <div class="row">
            <div class="form-group col-md-6">
              <input type="hidden" id="mov_id" name="mov_id" value="">
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_t12_id">Tipo Operacion <span class="required">*</span></label>
                  </div>
                  <div class="col-md-8 px-0">
                    <select class="form-control" data-live-search="true" id="mov_t12_id" name="mov_t12_id" required>
                    </select>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_t10_id">Tipo Comprobante<span class="required">*</span></label>
                  </div>
                  <div class="col-md-8 px-0">
                    <select class="form-control" data-live-search="true" id="mov_t10_id" name="mov_t10_id" required>
                    </select>
                    <div id="mov_ncr" style="display:none">
                      <input type="text" data="0" class="form-control mr-1" id="mov_ncr_id" name="mov_ncr_id"
                        placeholder="Serie y numero">
                      <button class="btn btn-primary" id="serchMov">Buscar</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1" style="display: none;">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_d_alm_id">Almacen Destino<span class="required">*</span></label>
                  </div>
                  <div class="col-md-8 px-0">
                    <select class="form-control" data-live-search="true" id="mov_d_alm_id" name="mov_d_alm_id" required>
                    </select>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_age_id">Agente<a class="text-success" href="#" id="new_age">
                        [<i class="fas fa-plus-circle">Seleccionar</i>]</a><span class="required">*</span></label>
                  </div>
                  <div class="col-md-8 px-0">
                    <select class="form-control" data-live-search="true" id="mov_age_id" name="mov_age_id" required
                      readonly>
                      <option value="0">Seleccione</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group col-md-1">
            </div>
            <div class="form-group col-md-5">
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4 text-right">
                    <label for="txtCodFactura"></label>
                  </div>
                  <div class="col-md-4">
                    <input type="text" class="form-control valid" id="mov_serie" maxlength="4" name="mov_serie"
                      placeholder="Serie" required>
                  </div>
                  <div class="col-md-4">
                    <input type="text" class="form-control valid" id="mov_numero" maxlength="8" name="mov_numero"
                      placeholder="Número" required>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4 text-right">
                    <label for="mov_gt4_id">Moneda <span class="required">*</span></label>
                  </div>
                  <div class="col-md-8">
                    <select class="form-control" data-live-search="true" id="mov_gt4_id" name="mov_gt4_id" required>
                    </select>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4 text-right">
                    <label for="mov_fechaE">Fecha de Emisión<span class="required">*</span></label>
                  </div>
                  <div class="col-md-8">
                    <input type="date" class="form-control valid" id="mov_fechaE" name="mov_fechaE" required=""
                      onkeypress="return controlTag(event);">
                  </div>
                </div>
              </div>
              <div class="datosform pb-1" id="tcambio">
                <div class="row">
                  <div class="col-md-4 text-right">
                    <label for="txtTcambio">Tipo de Cambio</label>
                  </div>
                  <div class="col-md-2 pr-0 pt-1 text-center">
                    <label class="switch">
                      <input type="checkbox" id="set_gtc" checked >
                      <span class="slider round"></span>
                    </label>
                  </div>
                  <div class="col-md-3 px-0">
                    <input type="text" class="form-control valid " data="0" id="gtc_compra" name="gtc_compra"
                      placeholder="Compra" readonly>
                  </div>
                  <div class="col-md-3 pl-0">
                    <input type="text" class="form-control valid " id="gtc_venta" name="gtc_venta" placeholder="Venta"
                      readonly>
                  </div>
                </div>
              </div>
              <div class="datosform pb-1">
                <div class="row">
                  <div class="col-md-4 text-right">
                    <label for="mov_cue_id">Cuentas <span class="required">*</span></label>
                  </div>
                  <div class="col-md-8">
                    <select class="form-control" data-live-search="true" id="mov_cue_id" name="mov_cue_id" required>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
        <div class="row">
          <div class="col-md-12">
            <div class="tile">
              <div class="tile-body">
                <div class="table-responsive-sm">
                  <table class="table table-hover table-bordered">
                    <thead>
                      <tr>
                        <th class="w-auto" id="tipoDetalle">Bien <a class="text-success" href="#" id="new_bien">
                            [<i class="fas fa-plus-circle">Seleccionar</i>]</a></th>
                        <th class="w-auto" id="new_f_bien" style="display:none" >Bien Destino</th>
                        <th>Cantidad</th>
                        <th>U. M.</th>
                        <th width="100">
                          <div class="form-row h-100 justify-content-center ">
                            <div class="col">P.U.
                            </div>
                            <div class="col" style="display:none">
                              <label class="checkbox">
                                <input type="checkbox" id="mde_igv" name="mde_igv">&nbsp;Con Igv
                              </label>
                            </div>
                          </div>
                        </th>
                        <th style="display:none"  >Tipo de IGV</th>
                        <th>Importe</th>
                        <th  width="100">                          
                          <span>Detraccion</span>
                          <input type="checkbox" id="mde_det" name="mde_det">&nbsp;%
                        </th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><select class="form-control" id="mde_bie_id" name="mde_bie_id" disabled>
                            <option value="">Seleccione</option>
                          </select></td>
                        <td style="display:none" ><select class="form-control" id="mde_f_bie_id" name="mde_f_bie_id">
                          </select></td>
                        <td><input type="text" class="form-control valid" id="mde_q" name="mde_q" disabled value="0.00">
                        </td>
                        <td><select class="form-control" data-live-search="true" id="mde_t6m_id" name="mde_t6m_id"
                            required></select></td>
                        <td><input type="text" class="form-control valid " id="mde_vu" name="mde_vu" value="0.00"
                            disabled></td>
                        <td style="display:none" ><select type="text" class="form-control" id="mde_gta_id" name="mde_gta_id"></select></td>
                        <td><input type="text" class="form-control valid" id="mde_importe" name="mde_importe"
                            value="0.00" disabled>
                        </td>
                        <td>
                          <input type="text" class="form-control valid" id="mde_detraccion" name="mde_detraccion" disabled value="15">
                        </td>
                        <td>
                          <div class="text-center">
                            <button class="btn btn-primary  btn-sm" onclick="event.preventDefault();setMde();"
                              id="set_mde" style="display:none" title="Agredar">
                              <i class="fa fa-plus mr-0"></i></button>
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
                  <table class="table table-hover table-bordered table-sm" id="mde" width="100%"></table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-md-9 ">
            <label class="pt-4 " for="mov_observaciones ">Notas y/o Observaciones:</label>
            <textarea id="mov_observaciones" name="mov_observaciones" rows="7" class="form-control"></textarea>
          </div>
          <div class="form-group col-md-3">
            <form id="formMtx" name="formMtx">
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_exonerada">Exonerada:</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_exonerada"
                      name="mov_exonerada" value="0.00" readonly>
                  </div>
                </div>
              </div>
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_inafecta">Inafecta:</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_inafecta"
                      name="mov_inafecta" value="0.00" readonly>
                  </div>
                </div>
              </div>
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="mov_gravada">Gravada:</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_gravada"
                      name="mov_gravada" value="0.00" readonly>
                  </div>
                </div>
              </div>
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="cde_subtotal">Sub Total</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_subtotal"
                      name="mov_subtotal" value="0.00" readonly>
                  </div>
                </div>
              </div>
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="cde_igv">IGV(18%)</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_igv" name="mov_igv"
                      value="0.00" readonly>
                  </div>
                </div>
              </div>
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="cde_total">Total</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_total" name="mov_total"
                      value="0.00" readonly>
                  </div>
                </div>
              </div>
              <div class="datosform">
                <div class="row">
                  <div class="col-md-4">
                    <label for="cde_neto">Neto a Pagar</label>
                  </div>
                  <div class="col-md-8">
                    <input type="text" class="form-control valid validText text-right" id="mov_neto" name="mov_neto"
                      value="0.00" readonly>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="tile-footer">
          <button id="set_mov" class="btn btn-primary" type="submit"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalViewMov" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase" id="titleModalMov"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="bodyModal">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

