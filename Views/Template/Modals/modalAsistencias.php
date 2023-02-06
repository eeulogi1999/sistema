<div class="modal fade" id="modal_asi" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header header-primary">
                <h5 class="modal-title">Asistencias</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="calendar"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal_asi2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header header-primary">
                <h5 class="modal-title">Asistencias</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form onsubmit="setAsi(event)">
                <div class="modal-body">
                    <div class="row pb-3">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <div class="form-group col mb-0">
                                <label for="asi_col_id">Colaborador<span class="required">*</span></label>
                                <select class="form-control" id="asi_col_id" name="asi_col_id"></select>
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                    <?php 
                    $d = date("Y-m-d",strtotime($_SESSION['asi']['asi_week']));
                    $te = "18:00";
                    for ($i=1; $i < 7; $i++) {  
                        if (strftime("%A",strtotime($d))=="Saturday") {
                            $te = "15:00";
                        }
                        ?>
                    <div class="row pb-2">
                        <div class="col-md-1 pr-0">
                            <?= strftime("%A",strtotime($d)) ?>
                        </div>
                        <div class="col-md-3 pr-0">
                            <input type="date" name="d_<?= $i ?>" value="<?= $d ?>">
                        </div>
                        <div class="col-md-1 pr-0">
                            Manaña
                        </div>
                        <div class="col-md-1 p-0">
                            <input type="time" name="ms_<?= $i ?>" value="08:00">
                        </div>
                        <div class="col-md-2 p-0">
                            <input type="time" name="me_<?= $i ?>" value="12:30">
                        </div>
                        <div class="col-md-1 pr-0">
                            Tarde
                        </div>
                        <div class="col-md-1 p-0">
                            <input type="time" name="ts_<?= $i ?>" value="13:30">
                        </div>
                        <div class="col-md-1 p-0">
                            <input type="time" name="te_<?= $i ?>" value="<?= $te ?>">
                        </div>
                    </div>
                    <?php 
                $d = date("Y-m-d",strtotime("+1 day",strtotime($d)));
                } ?>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><i
                            class="fa fa-fw fa-lg fa-check-circle"></i><span>Guardar</span></button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                            class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                </div>
            </form>
        </div>
    </div>
</div>