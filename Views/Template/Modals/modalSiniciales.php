<div class="modal fade" id="modal_cie" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title"><span id="titleModal_cie">Nuevo Empresa</span> Saldos Iniciales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text-primary">Todos los campos son obligatorios.</p>
        <form id="form_cie" name="form_cie" class="form-horizontal">
          <div class="form-row">
            <input type="hidden" id="cie_id" name="cie_id" value="">
            <div class="col-md-4">
              <div class="form-group">
                <label for="cie_bie_id" class="mb-3">Material<a class="text-success" href="#" id="new_bien">
                    [<i class="fas fa-plus-circle">Seleccionar</i>]</a></label>
                <select class="form-control" id="cie_bie_id" name="cie_bie_id">
                  <option value="">Seleccione</option>
                </select>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-0">
                <label for="cie_qs">CANTIDAD<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="cie_qs" name="cie_qs" required="">
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-0">
                <label for="cie_mts">VALORIZADO<span class="required">*</span></label>
                <input type="text" class="form-control valid" id="cie_mts" name="cie_mts" required="">
              </div>
            </div>
            <input type="hidden" id="cie_periodo" name="cie_periodo" value="2022-08-12">
            <input type="hidden" id="cie_alm_id" name="cie_alm_id" value="01">
            <input type="hidden" id="cie_start" name="cie_start" value="01">
          </div>
        </form>
        <div class="tile-footer">
          <button id="set_cie" class="btn btn-primary"
            onclick="event.preventDefault();set('cie',['cie_alm_id','cie_bie_id','cie_start'])"><i
              class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
          <button class="btn btn-danger" type="button" data-dismiss="modal"><i
              class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>