let tableContent;
let tabledetalle;
var tipoCambio = "";
let atributos;
var contentDetalles = {};
var ces_bie = {};
var ces_ser = {};
var arrStock;
let rowTable = "";
let varPosi = 0;
let incluyeVeinte;
document.addEventListener('DOMContentLoaded', async function () {
    tableContent = $('#tableFacturas').dataTable({
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Comprobantes/getComprobantes",
            "dataSrc":""
        },
        "columns":[
            {"data":"com_num"},
            {"data":"com_serie"},
            {"data":"com_age_ide"},
            {"data":"com_gt4_id.gt4_descripcion"},
            {"data":"com_fechaE"},
            {"data":"com_subtotal"},
            {"data":"com_igv"},
            {"data":"com_total"},
            {"data":"com_cstatus"},
            {"data":"com_options"}
        ],
        'dom': 'lBfrtip',
        'buttons': [
            {
                "extend": "copyHtml5",
                "text": "<i class='far fa-copy'></i> Copiar",
                "titleAttr":"Copiar",
                "className": "btn btn-secondary"
            },{
                "extend": "excelHtml5",
                "text": "<i class='fas fa-file-excel'></i> Excel",
                "titleAttr":"Esportar a Excel",
                "className": "btn btn-success"
            },{
                "extend": "pdfHtml5",
                "text": "<i class='fas fa-file-pdf'></i> PDF",
                "titleAttr":"Esportar a PDF",
                "className": "btn btn-danger"
            },{
                "extend": "csvHtml5",
                "text": "<i class='fas fa-file-csv'></i> CSV",
                "titleAttr":"Esportar a CSV",
                "className": "btn btn-info"
            }
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order":[[0,"asc"]]  
    });

    tabledetalle = $('#tableRegistrocompra').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        "paging": false,
        "searching": false,
        "info": false,
        "data": contentDetalles
        
    });
    var arrdata = await fetch(base_url + '/Main/getBienes')
    .then(response => response.json())
    .then(arrdata => {return arrdata})
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))

    var html_li = ''; 
    for (const j in arrdata) {
        html_li += '<li data="'+arrdata[j]['bie_id']+'" class="dropdown-item">'+arrdata[j]['bie_bbi_id']['bbi_codigo']+'-'+arrdata[j]['bie_bbi_id']['bbi_nombre']+'</li >';
    }
    $('#ces_bie_id_list').append(html_li);

    var arrdataSer = await fetch(base_url + '/Main/getServicios')
    .then(response => response.json())
    .then(arrdata => {return arrdata})
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))

    var html_li = ''; 
    for (const j in arrdataSer) {
        html_li += '<li data="'+arrdataSer[j]['ser_id']+'" class="dropdown-item">'+arrdataSer[j]['ser_bse_id']['bse_codigo']+'-'+arrdataSer[j]['ser_bse_id']['bse_nombre']+'</li >';
    }
    $('#ces_ser_id_list').append(html_li);

    var arrgde = await fetch(base_url + '/Main/getDepartamentos')
    .then(response => response.json())
    .then(arrdata => {return arrdata})
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))

    var html_li = ''; 
    for (const j in arrgde) {
        html_li += '<li data="'+arrgde[j]['gde_id']+'" class="dropdown-item">'+arrgde[j]['gde_departamento']+'</li >';
    }
    $('#gde_id_list').append(html_li);

    ftnt2identidades();
    ftnt4monedas();
    ftnt6medidas();
    ftntafeccion();
    ftntoperacion();
    main();

    $('#com_t1m_id').change(function(e){
        e.preventDefault();
        if ($(this).val() =='credito') {
            $('#view_fechav').show();
        } else {
            $('#view_fechav').hide();
        }
    })
    $('#cde_afectacion').change(function(e){
        e.preventDefault();
        var arrGravadas = ['10','11','12','13','14','15','16','17'];
        if (arrGravadas.includes(''+$(this).val())) {
            $('#view_conigv').show();
        } else {
            $('#view_conigv').hide();
            $('#cde_conigv').prop("checked",false);
        }
    })

    $('#buscarComprobante').click(async function(e){
        e.preventDefault();
            var ajaxUrl = base_url + '/Comprobantes/searchComprobante';
            var formDataNota = new FormData();
            formDataNota.append('com_serienum',$('#com_serienum').val())
            if ($('#com_serienum').val()=='') {
                swal("Atención","Campo numero y serie Requerido", "warning");
                return false;
            }
            divLoading.style.display = "flex";
            var objData = await fetch(ajaxUrl, {method: "POST",body: formDataNota})
                .then(response => response.json())
                .then(response => { return response})
                .catch(error => swal("Atención","Error en el proceso: "+error, "error"))           
            if (objData.status) {
                var data=objData.data;
                $('#com_serienum').attr('data',data.com_id);
                document.querySelector('#com_serie').innerHTML = data.com_serie;
                document.querySelector("#gpe_identificacion").value = data.com_age_id.age_ide; 
                document.querySelector("#gpe_nombre").value = data.com_age_id.age_nombre;
                if (data.com_age_id.age_gt2_id.gt2_id == 4) {
                    $('#age_apellidos').hide();
                } else {
                    document.querySelector("#gpe_apellidos").value = data.com_age_id.age_apellidos; 
                }
                
                document.querySelector("#gpe_gt2_id").value = data.com_age_id.age_gt2_id.gt2_id;
                $('#gpe_gt2_id').selectpicker('render');
                document.querySelector("#gpe_direccion").value = data.com_age_id.age_direccion;                
                $('#gde_id').valrender(data.com_age_id.age_gdi_id.gdi_gpr_id.gpr_gde_id.gde_id);
                ftnprovincias($('#gde_id').attr('data'));
                main();
                setTimeout(() => {
                    $('#gpr_id').valrender(data.com_age_id.age_gdi_id.gdi_gpr_id.gpr_id);
                    ftndistritos($('#gpr_id').attr('data'));
                    main();
                    setTimeout(() => {
                        $('#gdi_id').valrender(data.com_age_id.age_gdi_id.gdi_id);
                    }, 200);
                }, 200);
                document.querySelector("#gcl_correo").value = data.com_age_id.age_email;
                document.querySelector("#com_gt4_id").value = data.com_gt4_id.gt4_id;
                $('#com_gt4_id').selectpicker('render'); 
                document.querySelector("#com_fechaE").valueAsDate = new Date(data['com_fechaE']);
                contentDetalles = {};
                for (const i in data.com_cde) {
                    if (Object.hasOwnProperty.call(data.com_cde, i)) {
                        var pin = Object.keys(contentDetalles).length;
                        const cde = data.com_cde[i];
                        var cde_obj = {};
                        if (cde.cde_ces_id[0].ces_bie_id != null) {
                            cde_obj[Object.keys(cde_obj).length] = {
                                tob_id: 1,
                                bie_id: bie_id,
                                bie_nombre: bie_nombre
                            };
                        } else if(cde.cde_ces_id[0].ces_ser_id != null){
                            cde_obj[Object.keys(cde_obj).length] = {
                                tob_id: 2,
                                ser_id: ser_id,
                                ser_nombre: ser_nombre
                            };
                        }else{
                            cde_obj[Object.keys(cde_obj).length] = {
                                tob_id: 0,
                                ser_id: null,
                                ser_nombre: cde.cde_ces_id[0].ces_descripcion
                            };
                        }
                        contentDetalles[pin] = {
                            cde_obj:cde_obj,
                            cde_t6m_id: {
                                t6m_id: cde.cde_t6m_id.t6m_id,
                                t6m_descripcion: cde.cde_t6m_id.t6m_descripcion
                            },
                            cde_afectacion: {
                                mde_afectacion_id: cde.cde_afectacion.tip_codigo,
                                mde_afectacion: cde.cde_afectacion.tip_descripcion
                            },  
                            cde_q: parseFloat(cde.cde_q),
                            cde_vu: parseFloat(cde.cde_vu),
                            cde_conigv: cde.cde_conigv,
                            cde_importe: parseFloat(cde.cde_importe)
                        };
                        
                    }
                }
                actualizarDetalles();
                 swal("Nota de credito", objData.msg, "success");
                 } else {
                     swal("Error", objData.msg+objData.data,"error");
                 }
             divLoading.style.display = "none";
             return false;


    })

    $('#btnSendCom').click(function(e) {
        e.preventDefault();
        divLoading.style.display = "flex";
        var ajaxUrl = base_url + '/Comprobantes/setComprobante';
        var formData = new FormData(document.getElementById("formCom"));                
        var formAge = Object.fromEntries(new FormData(document.getElementById("formAge")));
        var formCte = Object.fromEntries(new FormData(document.getElementById("formCte")));
        var formAcr = Object.fromEntries(new FormData(document.getElementById("formAcr")));
        var formNcr = Object.fromEntries(new FormData(document.getElementById("formNcr")));  
        formNcr.ncr_id = $('#com_serienum').attr('data');
        if (parseInt($('#gpe_gt2_id').val())===4) {
            var gem = {};
            gem.gem_ruc = formAge.gpe_identificacion;
            gem.gem_razonsocial = formAge.gpe_nombre;
            gem.gem_direccion = formAge.gpe_direccion;
            gem.gem_gdi_id = $('#gdi_id').attr('data');
            gem.gem_email = $('#gcl_correo').val();
            formAge = gem;
        } else {
            formAge.gpe_gdi_id = $('#gdi_id').attr('data');
            formAge.gpe_email = $('#gcl_correo').val();
        }
        formData.append('com_subtotal', formCte.com_subtotal);  delete formCte.com_subtotal;
        formData.append('com_total', formCte.com_total);  delete formCte.com_total;
        formData.append('com_ncr_id', JSON.stringify(formNcr));
        formData.append('com_cde_id', JSON.stringify(contentDetalles)); 
        formData.append('com_age_id', JSON.stringify(formAge)); 
        formData.append('com_acr_id', JSON.stringify(formAcr));
        formData.append('com_igv_id', JSON.stringify(formCte));
        formData.append('com_serie', $('#com_serie').text());
        formData.append('com_numero', $('#com_numero').text());
        formData.append('com_observaciones', $('#com_observaciones').val());  
        

        fetch(ajaxUrl, {method: "POST",body: formData})
            .then(response => response.json())
            .then(response => {
                var objData = response;
                if (objData.status) {
                    $('#modalFormCom').modal("hide");
                    document.getElementById("formAge").reset();
                    document.getElementById("formCte").reset();
                    document.getElementById("formAcr").reset();         
                    if (document.querySelector('#formNcr')) {
                        document.getElementById("formNcr").reset();
                    }
                    swal("Comprobante", objData.msg, "success");
                    contentDetalles= {};
                    actualizarDetalles();
                    tableContent.api().ajax.reload();

                } else {
                    swal({
                        title: "Error", 
                        text: objData.msg+"</br><pre class='text-left'>"+ JSON.stringify(objData.data, null, 2) + "</pre>",
                        type: "error",
                        html: true
                    });
                }
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
        divLoading.style.display = "none";
        return false;
    });
});
$('#add_cuotas').click(function (e) {
    e.preventDefault();
    document.querySelector("#formCuotas").reset();    
    $("#conten_cuotas").children("div").remove();
    var div_cuotas = ''; 
    let num_cuotas=document.querySelector('#num_cuotas').value; 
    $('#modalFormCuotas').modal('show');  
    for (let i = 1; i <= num_cuotas; i++) {
        div_cuotas +=' <div class="row"> <div class="col-md-3"><label for="cuotas_id">Id</label><input type="text" class="form-control valid " id="cuotas_id" name="cuotas_id" readonly value="' + i + '"> </div><div class="col-md-3"> <label for="cuotas_monto">Monto</label> <input type="text" class="form-control valid " id="cuotas_monto" name="cuotas_monto" required=""> </div> <div class="col-md-6"> <label for="cuotas_fecha">Fechas de Pago</label><input type="date" class="form-control valid " id="cuotas_fecha" name="cuotas_fecha" required=""> </div></div>';
    }
    $('#conten_cuotas').append(div_cuotas);
})
$('#com_t1m_id').change(function (e) {
    e.preventDefault();
    var com_t1m_id = $(this).val();
    let num_cuotas =document.querySelector("#num_cuotas").value;
    if (com_t1m_id=="credito") {
        document.querySelector("#num_cuotas").removeAttribute('readonly',true);
        if (num_cuotas==1) {
            document.querySelector("#add_cuotas").setAttribute('disabled', true);
        }else{
            document.querySelector("#add_cuotas").removeAttribute('disabled', false);
        } 
    }else{
        document.querySelector("#num_cuotas").setAttribute('readonly', true);
        document.querySelector("#add_cuotas").setAttribute('disabled', true);
    }
})
$('#num_cuotas').keyup(function (e) {
    e.preventDefault();
    if ( $(this).val()!=1 && $(this).val()!="" && $(this).val()!=0) {
        document.querySelector("#add_cuotas").removeAttribute('disabled', false);
    }else{
        document.querySelector("#add_cuotas").setAttribute('disabled', true);
    }
})
function ftnt2identidades() {
    if (document.querySelector('#gpe_gt2_id')) {
        fetch(base_url + '/Main/T2identidades')
            .then(response => response.text())
            .then(response => {
                document.querySelector('#gpe_gt2_id').innerHTML = response;
                $('#gpe_gt2_id').selectpicker('render');
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }
}
function ftnt4monedas() {
    if (document.querySelector('#com_gt4_id')) {
        fetch(base_url + '/Main/T4monedas')
            .then(response => response.text())
            .then(response => {
                document.querySelector('#com_gt4_id').innerHTML = response;
                $('#com_gt4_id').selectpicker('render');
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }
}
function ftnt6medidas() {
    if (document.querySelector('#cde_t6m_id')) {
        fetch(base_url + '/Main/t6medidas')
            .then(response => response.text())
            .then(response => {
                document.querySelector('#cde_t6m_id').innerHTML = response;
                $('#cde_t6m_id').selectpicker('render');
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }
}
function ftntoperacion() {
    if (document.querySelector('#ncr_mot')) {
        fetch(base_url + '/Main/Ncrmotivo')
            .then(response => response.text())
            .then(response => {
                document.querySelector('#ncr_mot').innerHTML = response;
                $('#ncr_mot').selectpicker('render');
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }
}
function ftntafeccion() {
    if (document.querySelector('#cde_afectacion')) {
        fetch(base_url + '/Main/tafeccion')
            .then(response => response.text())
            .then(response => {
                document.querySelector('#cde_afectacion').innerHTML = response;
                $('#cde_afectacion').selectpicker('render');
            })
            .catch(error => console.error('Error:', error))
    }
}
function ftnprovincias(id) {
    if (document.querySelector('#gpr_id_list')) {
        fetch(base_url + '/Main/provincias/'+id)
            .then(response => response.text())
            .then(response => {
                document.querySelector('#gpr_id_list').innerHTML = response;
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }
}
function ftndistritos(id) {
    if (document.querySelector('#gdi_id_list')) {
        fetch(base_url + '/Main/distritos/'+id)
            .then(response => response.text())
            .then(response => {
                document.querySelector('#gdi_id_list').innerHTML = response;
            })
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }
}
function fntDelDetalle(id_detalle) {
    swal({
        title: "Eliminar detalle",
        text: "¿Realmente quiere eliminar el detalle?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: true,
        closeOnCancel: true
    }, function (isConfirm) {
        if (isConfirm) {
            delete contentDetalles[id_detalle];
            actualizarDetalles();
        }
    });
}
async function fntSendInfo(com_id) {
    divLoading.style.display = "flex";
    var data = await fetch(base_url+'/Comprobantes/setEmitir/'+com_id)
        .then(response => response.json()) 
        .then(response => {return response;})
        .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
        
    if (data.status) {
        alert(data);
        swal("Comprobante","Enviado correctamente: "+data.com_comprobante, "success")

    } else {
        swal("Atención","Error en el proceso: "+data.description, "error")
    }
    tableContent.api().ajax.reload();
    divLoading.style.display = "none";
    return false;
}
async function openModalCom() {
    switch (t10_id) {
        case 2: 
            $('#formNcr').hide();
            $('#labRuc').html('Identificacion<span class="required">*</span>');
            $('#labRazonSocial').html('Nombre <span class="required">*</span>');
            $('#age_apellidos').hide();
            break;
        case 4:
            $('#formNcr').hide();
            $('#gpe_gt2_id').val(2); 
            break;
        case 8 || 9: 
            $('#formNcr').show()
            break;
        default:
            break;
    }
    document.querySelector('#com_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnSendCom').classList.replace("btn-info", "btn-primary");
    $('#btnSendCom span').html('Guardar');
    document.querySelector("#formCom").reset();
    contentDetalles = {};
    actualizarDetalles();
    document.querySelector("#com_fechaE").valueAsDate = new Date();
    $('#modalFormCom').modal('show');
    $('#com_serienum').attr('data','');
    let com_t1m_id =document.querySelector("#com_t1m_id").value;
    if (com_t1m_id=="contado") {
      document.querySelector("#num_cuotas").setAttribute('readonly', true);
      document.querySelector("#add_cuotas").setAttribute('disabled', true);
    }
    $('#gpe_gt2_id').selectpicker('refresh');
    $('#gpe_gt2_id').selectpicker('render');
    fetch(base_url + '/Comprobantes/getNumComprobante')
    .then(response => response.json())
    .then(response => {
        document.querySelector('#com_serie').innerHTML = response.com_serie;
        document.querySelector('#com_numero').innerHTML = response.com_numero;
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}
function openModalMes() {
    document.querySelector('#mes_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnSendMes').classList.replace("btn-info", "btn-primary");
    $('#btnSendMes span').html('Guardar');
    document.querySelector("#formMes").reset();
    $('#modalFormMes').modal('show');
}
