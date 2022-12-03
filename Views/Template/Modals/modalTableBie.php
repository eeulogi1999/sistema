<div class="modal fade" id="modalTableBie" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">
          BIENES &nbsp;&nbsp;&nbsp;<button type="button" id="new_bie" onclick="openModalBienes();"
            class="btn btn-danger btn-sm">Nuevo Registro</button>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="table-responsive" style="height: 400px;">
            <table class="table table-hover table-bordered table-sm " id="sbi_table" width="100%"></table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="select_bie" class="btn btn-sm btn-warning" data-dismiss="modal">Seleccionar</button>
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>