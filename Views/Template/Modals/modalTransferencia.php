<!-- Modal -->
<div class="modal fade" id="modalFormContent" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header headerRegister">
                <h5 class="modal-title" id="titleModal">Nueva Transferencia</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formContent" name="formContent" class="form-horizontal">
                    <input type="hidden" id="idTransferencia" name="idTransferencia">

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="listAlmacenIni">Almacen Inicial</label>
                            <select class="form-control" id="listAlmacenIni" name="listAlmacenIni">

                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="listAlmacendest">Almacén Final</label>
                            <select class="form-control" id="listAlmacendest" name="listAlmacendest">
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="txtmotivo">Motivo de traslado</label>
                            <input type="text" class="form-control valid validText" id="txtmotivo" name="txtmotivo"
                                required>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="listArticulo">Producto / Articulo</label>
                            <select class="form-control" data-live-search="true" id="listArticulo" name="listArticulo"
                                required=""></select>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="txtcant_act">Cantidad actual</label>
                            <input type="text" class="form-control valid validNumber" id="txtcant_act"
                                name="txtcant_act" disabled>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="txtcant_dest">Cantidad a Trasladar</label>
                            <input type="text" class="form-control valid validNumber" id="txtcant_dest"
                                name="txtcant_dest">
                        </div>
                        <div class="form-group col-md-1 text-center">
                            <label for="txtcant_dest">Agregar</label><br>
                            <button class="btn btn-primary  btn-sm" id="add_product" title="Agregar"><i
                                    class="fas fa-plus"></i></button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="tile">
                                <div class="tile-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-bordered" id="tableInventario"
                                            width="1060">
                                            <thead>
                                                <tr>
                                                    <th>N°</th>
                                                    <th>Cantidad</th>
                                                    <th>Articulo</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="tile-footer">
                        <button id="btnActionForm" class="btn btn-primary" type="submit"><i
                                class="fa fa-fw fa-lg fa-check-circle"></i><span>Transferir</span></button>&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-danger" type="button" data-dismiss="modal"><i
                                class="fa fa-fw fa-lg fa-times-circle"></i>Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



