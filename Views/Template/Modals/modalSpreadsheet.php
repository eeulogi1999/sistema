<div class="modal fade" id="modal_sim" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_sim">Nueva <?= $data['page_tag'] ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_sim" name="form_sim" class="form-horizontal">
          <input type="hidden" id="sim_id" name="sim_id" value="">
          <div class="row">
            <div class="form-group col-md-4">
              <label for="sim_bie_id">MATERIAL<span class="required">*</span></label>
              <select class="form-control" id="sim_bie_id" name="sim_bie_id"></select>
            </div>
            <div class="form-group col">
              <label for="sim_obs">OBSERVACIONES<span class="required">*</span></label>
              <input type="text" class="form-control valid" id="sim_obs" name="sim_obs">
            </div>
          </div>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="val_table" width="100%">
                <thead class="bg-dark-lite sticky-top" style="padding-right: 17px; margin-right: -17px;">
                  <tr style="display: table-row;">
                    <th class="text-center" colspan="4">PRECIOS DEL MERCADO</th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                  <tr>
                    <th>
                      <div class="text-center"> L. NORTE</div>
                    </th>
                    <th>
                      <div class="text-center"> L. CENTRO</div>
                    </th>
                    <th>
                      <div class="text-center"> L. SUR</div>
                    </th>
                    <th>
                      <div class="text-center"> L. OTROS</div>
                    </th>
                    <th>
                      <div class="text-center"> PRECIO PROMEDIO</div>
                    </th>
                    <th>
                      <div class="text-center"> PRECIO CACEL</div>
                    </th>
                    <th>
                      <div class="text-center"> PRECIO MAXIMO</div>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td id="sim_p_1" class="text-right">29.00</td>
                    <td id="sim_p_2" class="text-right">29.00</td>
                    <td id="sim_p_3" class="text-right">29.00</td>
                    <td id="sim_p_4" class="text-right">29.00</td>
                    <td id="sim_pp" class="text-right bg-info">29.00</td>
                    <td id="sim_pc" class="text-right bg-warning">29.00</td>
                    <td id="sim_pm" class="text-right bg-danger">31.05</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div><br>
          <div class="row">
            <div class="col-md-8"></div>
            <div class="col-md-4">
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-sm " id="res_table" width="100%">
                  <thead class="bg-dark-lite sticky-top" style="padding-right: 17px; margin-right: -17px;">
                    <tr style="display: table-row;">
                      <th class="text-center">UNIDAD</th>
                      <th class="text-center">MARGEN</th>
                      <th class="text-center">INVERSION</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-center">TN</td>
                      <td id="sim_mtn" class="text-right">40913.21</td>
                      <td id="sim_itn" class="text-right">0.00</td>
                    </tr>
                    <tr>
                      <td  class="text-center">KG</td>
                      <td id="sim_mkg" class="text-right">2.05</td>
                      <td id="sim_ikg" class="text-right">0.00</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="inp_table" width="100%">
                <thead class="bg-dark-lite sticky-top" style="padding-right: 17px; margin-right: -17px;">
                  <tr>
                    <th class="text-center">UNIDAD</th>
                    <th class="text-center">CANTIDAD</th>
                    <th class="text-center">PRECIO</th>
                    <th class="text-center">TIPO CAMBIO</th>
                    <th class="text-center">MONTO SOLES</th>
                    <th class="text-center">% GASTO</th>
                    <th class="text-center">PRECIO</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center" >TN</td>
                    <td id="sim_qtn" class="text-right" >20.00</td>
                    <td id="sim_ptn" class="text-right" >8205.00</td>
                    <td class="sim_gtc text-right" >3.86</td>
                    <td class="sim_mbtn text-right" >632113.20</td>
                    <td class="sim_g text-right bg-danger" >0.56</td>
                    <td id="sim_mntn" class="text-right" >620913.20</td>
                  </tr>
                  <tr>
                    <td class="text-center" >KG</td>
                    <td id="sim_qkg" class="text-right" >1.00</td>
                    <td id="sim_pkg" class="text-right" >8.21</td>
                    <td class="sim_gtc text-right" >3.86</td>
                    <td class="sim_mbkg text-right" >31.61</td>
                    <td class="sim_g text-right bg-danger" >0.56</td>
                    <td id="sim_mnkg" class="text-right" >31.05</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm" id="por_table" width="100%">
                <thead class="bg-dark-lite sticky-top" style="padding-right: 17px; margin-right: -17px;">
                  <tr>
                    <th class="text-center"> % COM.</th>
                    <th class="text-center">% IGV</th>
                    <th class="text-center"> % IMP.</th>
                    <th class="text-center"> % C. ADM</th>
                    <th class="text-center"> % PLUS</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td id="sim_exp" class="text-center bg-success" >93.00</td>
                    <td id="sim_igv" class="text-center bg-info" >18.00</td>
                    <td id="sim_imp" class="text-center bg-primary" >3.50</td>
                    <td id="sim_cadm" class="text-center bg-warning" >55.00</td>
                    <td id="sim_plus" class="text-center bg-danger" >0.00</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div><br>
          <div>
            <div class="table-responsive">
              <table class="table table-hover table-bordered table-sm " id="out_table" width="100%">
                <thead class="bg-dark-lite sticky-top" style="padding-right: 17px; margin-right: -17px;">
                  <tr>
                    <th class="text-center" >UNIDAD</th>
                    <th class="text-center" >MONTO BRUTO</th>
                    <th class="text-center" >COMPRA</th>
                    <th class="text-center" >IGV</th>
                    <th class="text-center" >IMPUESTO</th>
                    <th class="text-center" >RETORNO</th>
                    <th class="text-center" >GASTO ADM.</th>
                    <th class="text-center" >MONTO NETO</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">TN</td>
                    <td class="sim_mbtn text-right" >632113.20</td>
                    <td id="sim_mxtn" class="text-right bg-success" >587865.28</td>
                    <td id="sim_migtn" class="text-right bg-info" >105815.75</td>
                    <td id="sim_miptn" class="text-right bg-primary" >22123.97</td>
                    <td id="sim_mrtn" class="text-right" >83691.79</td>
                    <td id="sim_matn" class="text-right bg-warning" >37661.31</td>
                    <td id="sim_mptn" class="text-right bg-danger" >37661.31</td>
                  </tr>
                  <tr>
                    <td  class="text-center">KG</td>
                    <td class="sim_mbkg text-right" >31.61</td>
                    <td id="sim_mxkg" class="text-right bg-success" >29.40</td>
                    <td id="sim_migkg" class="text-right bg-info" >5.30</td>
                    <td id="sim_mipkg" class="text-right bg-primary" >1.11</td>
                    <td id="sim_mrkg" class="text-right" >4.19</td>
                    <td id="sim_makg" class="text-right bg-warning" >1.89</td>
                    <td id="sim_mpkg" class="text-right bg-danger" >1.89</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="tile-footer">
            <button id="set_sim" onclick="event.preventDefault();set('sim')" class="btn btn-primary"><i
                class="fa fa-fw fa-lg fa-check-circle" aria-hidden="true"></i><span
                id="set_sim">Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-times-circle"
                aria-hidden="true"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
