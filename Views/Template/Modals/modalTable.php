<div class="modal fade" id="modalTable_<?= $data['pre'] ?>" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header header-primary">
        <h5 class="modal-title text-center text-uppercase">
          REGISTRO &nbsp;&nbsp;&nbsp;<button type="button" onclick="openModal('<?= $data['pre'] ?>');" class="btn btn-sm btn-danger">Nuevo</button>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm " id="<?= $data['pre'] ?>_table" width="100%"></table>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="select_<?= $data['pre'] ?>" class="btn btn-sm btn-warning" data-dismiss="modal">Seleccionar</button>
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>