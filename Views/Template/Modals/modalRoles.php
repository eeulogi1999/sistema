<!-- Modal -->
<div class="modal fade" id="modal_gro" tabindex="-1" groe="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header headerRegister">
        <h5 class="modal-title" id="titleModal_gro">Nuevo Personas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form_gro" name="form_gro" class="form-horizontal">
          <input type="hidden" id="gro_id" name="gro_id" value="">
          <p class="text-primary">Todos los campos son obligatorios.</p>
          <div class="form-group">
            <label for="gro_nombrerol">Nombre</label>
            <input class="form-control" id="gro_nombrerol" name="gro_nombrerol" type="text"
              placeholder="Nombre" required="">
          </div>
          <div class="form-group">
            <label for="gro_descripcion">Descripcion</label>
            <input class="form-control" id="gro_descripcion" name="gro_descripcion" type="text"
              placeholder="Descripcion" required="">
          </div>
          <div class="form-group">
            <label for="gro_status">Status</label>
            <select class="form-control selectpicker" id="gro_status" name="gro_status" required>
              <option value="1">Activo</option>
              <option value="2">Inactivo</option>
            </select>
          </div>
          <div class="tile-footer">
            <button id="set_gro" class="btn btn-primary" onclick="event.preventDefault();set('gro')"><i
                class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modal_tpe" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title h4" >Asignar Permisos</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm" id="tpe_table" width="100%"></table>
          </div>
        </div>
    </div>
  </div>
</div>