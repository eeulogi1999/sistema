var mov_table;
var mde;
var gtc;
var mde_json = {};
var url_mov= base_url+"/Movimientos/getMovimientos/"+data.mov_t12_id;
document.addEventListener('DOMContentLoaded', function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#mov_table")) {
        mov_table = $('#mov_table').autoTable({
            "url":url_mov ,
            "numerate": true,
            "columns":[
                {"data":"mov_t12_id.t12_descripcion",header:{t:"OPERACION",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"mov_serie",header:{t:"SERIE Y NUMERO",c:'text'},tipo:'string'},
                {"data":"mov_age_ide",header:{t:"AGENTE",c:'text'},tipo:'string'},
                {"data":"mov_gt4_id.gt4_descripcion",header:{t:"MONEDA"},tipo:'string'},
                {"data":"mov_fechaE",header:{t:"FECHA"},tipo:'string'},
                {"data":"mov_total",header:{t:"TOTAL"},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_mstatus",header:{t:"ESTADO"},tipo:'string'},
                {"data":"mov_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    mde = $('#mde').jsonTables({
        "src": "mde_json",
        "numerate": true,
        "columns":[
            {"data":"mde_q",tipo:'float'},
            {"data":"mde_bie_id.bie_nombre",tipo:'string'},
            {"data":"mde_t6m_id.t6m_descripcion",tipo:'string'},
            {"data":"mde_vu",tipo:'float'},
            {"data":"mde_gta_id.gta_descripcion",tipo:'string'},
            {"data":"mde_importe",tipo:'float'},
            {"data":"mde_options",tipo:'string'}
        ]
    });
    
    $('#mov_t12_id').loadOptions('t12operaciones',['t12_descripcion'],{'t12_status':1});
    $('#mov_t10_id').loadOptions('t10comprobantes',['t10_descripcion'],{'t10_status':1});
    $('#mov_gt4_id').loadOptions('t4monedas',['gt4_descripcion']);
    $('#mde_t6m_id').loadOptions('t6medidas',['t6m_descripcion']);
    if (parseInt(data.mov_t12_id)==2) {
        $('#mde_gta_id').loadOptions('tafectaciones',['gta_descripcion'],{'gta_id':9});
    } else {
        $('#mde_gta_id').loadOptions('tafectaciones',['gta_descripcion'],{'gta_status':1});
    }
    $('#mde_f_bie_id').loadOptions('bienes',['bie_nombre'],{'bie_status':1});
    $('#mov_d_alm_id').loadOptions('almacenes',['alm_nombre']);
    $('#mde_bie_id').change(function(){
        openMde();
    })
    $('#mde_q').keyup(function (e) {
		e.preventDefault();
        mdeProducto()
	});
	$('#mde_vu').keyup(function (e) {
		e.preventDefault();
        mdeProducto()
	});
    $('#mde_det').change(function (e) {
        var gtc = $(this).prop('checked');
        if (gtc) {
            $('#mde_detraccion').removeAttr("disabled");
        } else {
            $('#mde_detraccion').attr('disabled', 'disabled');
        }
    });
    $('#set_gtc').change(function (e) {
        var gtc = $('#set_gtc').prop('checked');
        if (gtc) {
            $('#gtc_compra').attr('readonly', true);
            $('#gtc_venta').attr('readonly', true);
            $('#gtc_compra').val("");
            $('#gtc_venta').val("");
        } else {
            $('#gtc_compra').attr('readonly', false);
            $('#gtc_venta').attr('readonly', false);
        }
    });
	$('#mde_importe').keyup(function (e) {
		e.preventDefault();
		var mde_p = $('#mde_importe').val() / $('#mde_q').val();
		$('#mde_vu').attr('disabled', 'disabled');
		$('#mde_vu').val(mde_p.toFixed(2));
		if ($('#mde_importe').val() < 0.00000000001 || isNaN($('#mde_vu').val())) {
			$('#set_mde').slideUp();
		} else {
			$('#set_mde').slideDown();
		}
	});
    $('#mov_gt2_id').change(function(e) {
        e.preventDefault();
        switch (parseInt($(this).val())){
            case 4:
                $('#mov_age_id').loadOptions('agentes',['age_gem_id.gem_ruc','age_gem_id.gem_razonsocial'],{custom:'age_gem_id is not null'});
                break;
            default:
                $('#mov_age_id').loadOptions('agentes',['age_gpe_id.gpe_identificacion','age_gpe_id.gpe_nombre'],{custom:'age_gpe_id is not null'});
                break;
        }
    })
    $('#mov_t10_id').change(function (e) {
        e.preventDefault();
        changet10t12();
    });
    $('#mov_t12_id').change(function (e) {
        e.preventDefault();
        changet10t12();
    });
    $('#select_bie').click(function (e) {
        e.preventDefault();
        openMde();
        $('#mde_bie_id').children().attr('value',sbi_table.getSelectedItem().sbi_bie_id.bie_id);
        $('#mde_bie_id').children().text(sbi_table.getSelectedItem().sbi_bie_id.bie_codigo+' - '+sbi_table.getSelectedItem().sbi_bie_id.bie_nombre);
        if (sbi_table.getSelectedItem().sbi_bie_id.bie_t6m_id != null) {
            $('#mde_t6m_id').val(sbi_table.getSelectedItem().sbi_bie_id.bie_t6m_id.t6m_id);
        }
        $('#mde_vu').val(parseFloat(sbi_table.getSelectedItem().sbi_p).toFixed(2));
        $('#mde_q').val(1.00);
        $('#mde_igv').prop('checked',parseInt(sbi_table.getSelectedItem().sbi_bie_id.bie_igv))
        mdeProducto()
    });
    $("#new_bien").click(function(e) {
        $("#modalTableBie").modal('show');
        setTimeout(() => {
            sbi_table.rezise();
            sbi_table.select(true);
        }, 220);
    })
    $("#new_age").click(function(e) {
        $("#modalTable_age").modal('show');
        setTimeout(() => {
            age_table.rezise();
            age_table.select(true);
        }, 220);
    })
    $("#select_age").click(function(e) {
        $('#mov_age_id').children().attr('value',age_table.getSelectedItem().age_id);
        $('#mov_age_id').children().text(age_table.getSelectedItem().age_ide+' - '+age_table.getSelectedItem().age_nombre);
    })
    $('#mov_fechaE').change(function (e) {ftnTcambio(this);});
    $('#set_mov').click(function(e) {
        e.preventDefault();
        divLoading.style.display = "flex";
        var formData = new FormData(document.getElementById("formMov"));                
        var formMtx = Object.fromEntries(new FormData(document.getElementById("formMtx")));
        for (const i in mde_json) {
            if (Object.hasOwnProperty.call(mde_json, i)) {
                delete mde_json[i].mde_options;
            }
        }
        formData.set('mov_gtc_id',$('#gtc_compra').attr('data'));
        formData.set('mov_ncr_id',$('#mov_ncr_id').attr('data'));
        formData.append('mov_subtotal', formMtx.mov_subtotal);  delete formMtx.mov_subtotal;
        formData.append('mov_total', formMtx.mov_total);  delete formMtx.mov_total;
        formData.append('mov_mde_id', JSON.stringify(mde_json)); 
        formData.append('mov_igv_id', JSON.stringify(formMtx));
        formData.append('mov_observaciones', $('#mov_observaciones').val());  
        if(data.mov_t12_id == 1 || data.mov_t12_id == 2 ){
            if( parseInt(formData.get('mov_age_id')) == 0 ){
                swal('Atencion','Seleccione un Agente','warning');
                divLoading.style.display = "none";
                return false;
            } 
        }
        var url_set_com =base_url + '/Movimientos/setMovimiento'
        switch ( parseInt($('#mov_t12_id').val())) {
            case 11:
                url_set_com =base_url + '/Movimientos/setMovimientoTA'
                break;
            case 18:
                url_set_com =base_url + '/Movimientos/setMovimientoTI'
                break;
            default:
                url_set_com =base_url + '/Movimientos/setMovimiento'
                break;
        }
        fetch(url_set_com, {method: "POST",body: formData})
            .then(response => response.json())
            .then(response => {
                var objData = response;
                if (objData.status) {
                    $('#modal_mov').modal("hide");
                    document.getElementById("formMtx").reset();      
                    mde_json= {};
                    mde.reload();
                    mov_table.reload();
                    swal("Movimiento", 'N° OPERACION: '+objData.data.mov_t12num, "success");
                } else if (objData.exist) {
                    swal("Movimiento",objData.msg, "warning");
                } else {;
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
        
    })
    
});
window.addEventListener('load', async () => {
    mov_table = await mov_table;
    divLoading.style.display = "none";
});

function changet10t12(){
    var t10_id = parseInt($('#mov_t10_id').val());
    if (parseInt($('#mov_t12_id').val())==18) {
        $('#mde_f_bie_id').parent().show()
        $('#new_f_bien').show();
        $('#mde_gta_id').val(9);
    }else{
        $('#mde_f_bie_id').parent().hide()
        $('#new_f_bien').hide();
    }
    if (t10_id == 46 ||t10_id == 47) {
        $('#mov_ncr').show()
    } else {
        $('#mov_ncr').hide()
    }
    if (parseInt($('#mov_t12_id').val())==11) {
        $('#mov_d_alm_id').parent().parent().parent().show();
    } else {
        $('#mov_d_alm_id').parent().parent().parent().hide();
    }
    var serie = '';
    switch (t10_id) {
        case 1:
            if (parseInt($('#mov_t12_id').val())==18) {

                serie = 'TI01'; 
            }
            if (parseInt($('#mov_t12_id').val())==16) {
                //$('#mov_age_id').parent().parent().hide()
                serie = 'SI01';  
            }
            if (parseInt($('#mov_t12_id').val())==13) {
                //$('#mov_age_id').parent().parent().hide()
                serie = 'ME01';  
            }
            break;
        case 49:
            serie = 'NE01';
            break;
        case 50:
            serie = 'NS01';
            break;
        default:
            serie = '';
            $('#mov_serie').val('');
            $('#mov_numero').val('');
            break;
    }
    if (t10_id==1 || t10_id==49 || t10_id==50) {
        ftnSetMov_numero(serie,$('#mov_t12_id').val(),$('#mov_t10_id').val());
    }
}
function mdeProducto() {
    var mde_importe = $('#mde_vu').val() * $('#mde_q').val();
    $('#mde_importe').val(mde_importe.toFixed(2));
    if ($('#mde_q').val() < 0.000000000001 || isNaN($('#mde_importe').val()) || $('#mde_vu').val() < 0.000000000001 ) {
        $('#set_mde').slideUp();
    } else {
        if (data.mov_tipo == '01' && $('#mde_q').val() > sbi_table.getSelectedItem().sbi_qs) {
            swal("Atención","No cuenta con stock, Saldo: "+sbi_table.getSelectedItem().sbi_qs, "warning");
        } else {
            $('#set_mde').slideDown();
        }
        
    }
}
function ftnSetMov_numero(serie,t12_id,t10_id) {
    var formData = new FormData()
    formData.append('mov_t10_id',t10_id);
    formData.append('mov_t12_id',t12_id);
    fetch(base_url + '/Movimientos/getNumMovimiento', {method: "POST",body: formData})
    .then(response => response.json())
    .then(response => {
        $('#mov_serie').val(serie);
        $('#mov_numero').val(response.mov_numero);
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}
function ftnTcambio(nodefecha) {
    var fecha = $(nodefecha).val();
    tipoCambio = "";
    let gtc = $('#set_gtc').prop('checked');
    if (gtc) {
        fetch(base_url + '/Main/getTcambio/' + fecha)
            .then(response => response.json())
            .then(response => {
                $('#gtc_compra').val(response.tce_gtc_id.gtc_tcompra);
                $('#gtc_compra').attr('data',response.tce_id);
                $('#gtc_venta').val(response.tce_gtc_id.gtc_tventa);
            })
            .catch(error => console.error('Error:', error))
    }
}
function setMde(id=-1) {
    var mde_igv = $('#mde_igv').prop('checked')
    var mde_det = $('#mde_det').prop('checked')
    if (id>=0) {
        var pin = id;
    } else {
        var pin = 0;
        for (const i in mde_json) {
            if (Object.hasOwnProperty.call(mde_json, i)) {
                if (pin<=parseInt(i)) {
                    pin = parseInt(i)+1;
                }
            }
        }
    }
    mde_json[pin] = {
        mde_bie_id: {
            bie_id: $('#mde_bie_id').val(),
            bie_nombre: $('#mde_bie_id').find('option:selected').text()
        },
        mde_t6m_id: {
            t6m_id: parseInt($('#mde_t6m_id').val()),
            t6m_descripcion: $('#mde_t6m_id').find('option:selected').text()
        },
        mde_gta_id: {
            gta_id: parseInt($('#mde_gta_id').val()),
            gta_descripcion: $('#mde_gta_id').find('option:selected').text()
        },
        mde_q: parseFloat($('#mde_q').val()), 
        mde_vu: mde_igv ? parseFloat($('#mde_vu').val())/1.18 : parseFloat($('#mde_vu').val()),
        mde_igv: +mde_igv,
        mde_f_bie_id: parseInt($('#mde_f_bie_id').val()),
        mde_detraccion: mde_det ? parseInt($('#mde_detraccion').val()):0,
        mde_importe: mde_igv ? parseFloat($('#mde_importe').val())/1.18 : parseFloat($('#mde_importe').val()),
        mde_options: '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editMde(' + pin + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>'+
        '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteMde(' + pin + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>'
    };
    mde.reload();
    subtotalMde();
    cleanMde();
    $('#set_mde').removeClass('btn-info').addClass('btn-primary');
    $('#set_mde').children('i').removeClass('fa-refresh').addClass('fa-plus');
    $('#set_mde').attr('onclick','event.preventDefault();setMde();')                 
}
function deleteMde(id) {
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
            delete mde_json[id];
            mde.reload();
            subtotalMde();
        }
    });
}
function editMde(id) {
    $('#mde_bie_id').children().attr('value',mde_json[id].mde_bie_id.bie_id);
    if (mde_json[id].hasOwnProperty('mde_id')) {
        $('#mde_bie_id').children().text(mde_json[id].mde_bie_id.bie_codigo+'-'+mde_json[id].mde_bie_id.bie_nombre);
    } else {
        $('#mde_bie_id').children().text(mde_json[id].mde_bie_id.bie_nombre);
    }
    $('#mde_t6m_id').val(mde_json[id].mde_t6m_id.t6m_id);
    $('#mde_gta_id').val(mde_json[id].mde_gta_id.gta_id);
    $('#mde_q').val(mde_json[id].mde_q);
    $('#mde_igv').prop('checked',mde_json[id].mde_igv>0?1:0);
    $('#mde_det').prop('checked',mde_json[id].mde_detraccion>0?1:0);
    $('#mde_detraccion').val(mde_json[id].mde_detraccion>0?mde_json[id].mde_detraccion:15);

    $('#mde_vu').val(mde_json[id].mde_vu);
    $('#mde_importe').val(mde_json[id].mde_importe);
    $('#set_mde').removeClass('btn-primary').addClass('btn-info');
    $('#set_mde').children('i').removeClass('fa-plus').addClass('fa-refresh');
    $('#set_mde').attr('onclick','event.preventDefault();setMde('+id+');')
    $('#set_mde').slideDown();
    $("#mde_importe").removeAttr("disabled");
    $("#mde_q").removeAttr("disabled");
    $("#mde_vu").removeAttr("disabled");
}
function cleanMde() {
    $('#mde_q').val('');
    $('#mde_vu').val('');
    $('#mde_importe').val('');
    $('#mde_q').attr('disabled', 'disabled');
    $('#mde_vu').attr('disabled', 'disabled');
    $('#mde_importe').attr('disabled', 'disabled');
    $('#set_mde').slideUp(); 
    $('#mde_igv').prop('checked',0);
    $('#mde_det').prop('checked',0);
    $('#mde_detraccion').attr('disabled', 'disabled');
    if (parseInt(data.mov_t12_id)!=18) {
        $('#mde_f_bie_id').parent().hide() 
    }
    $('#new_f_bien').hide();
}
function openMde() {
    $("#mde_importe").removeAttr("disabled");
    $("#mde_q").removeAttr("disabled");
    $("#mde_vu").removeAttr("disabled");
}
function subtotalMde() {
    var subExonerada = 0;
    var subInafecta = 0;
    var subGravada = 0;
    var subNeta = 0;
    var arrGravadas = [1,2,3,4,5,6,7,8];
    var arrExonerado = [9,10,18];
    var arrInafecto = [11,12,13,14,15,16,17,18];
    for (const i in mde_json) {
        if (Object.hasOwnProperty.call(mde_json, i)) {
			switch (true) {
				case arrExonerado.includes(parseInt(mde_json[i].mde_gta_id.gta_id)):
					subExonerada += parseFloat(mde_json[i].mde_importe);
					break;
				case arrInafecto.includes(parseInt(mde_json[i].mde_gta_id.gta_id)):
					subInafecta += parseFloat(mde_json[i].mde_importe);
					break;
				case arrGravadas.includes(parseInt(mde_json[i].mde_gta_id.gta_id)):
					subGravada += parseFloat(mde_json[i].mde_importe);
                    if (parseInt(mde_json[i].mde_detraccion)>0) {
                        subNeta += parseFloat(mde_json[i].mde_importe)*1.18*(1-(parseInt(mde_json[i].mde_detraccion)/100));
                    } else {
                        subNeta += parseFloat(mde_json[i].mde_importe)*1.18;
                    }
					break;
				default:
					break;
			}
        }
    }
    $('#mov_exonerada').val(Math.ceil10(subExonerada,-2).toFixed(2));
    $('#mov_inafecta').val(Math.ceil10(subInafecta,-2).toFixed(2));
    $('#mov_gravada').val(Math.ceil10(subGravada,-2).toFixed(2));
    var subtotal = Math.ceil10(subExonerada + subInafecta + subGravada,-2);
    $('#mov_subtotal').val(subtotal.toFixed(2));
    $('#mov_igv').val(Math.round10((subGravada * 0.18),-2).toFixed(2));
    $('#mov_total').val(Math.round10((subtotal + (subGravada * 0.18)),-2).toFixed(2));
    $('#mov_neto').val(Math.round10((subNeta+subExonerada+subInafecta),-2).toFixed(2));
}
function fntDelMov(mov_id) {
    swal({
        title: "Eliminar detalle",
        text: "¿Realmente quiere eliminar el Movimiento?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: true,
        closeOnCancel: true
    }, function (isConfirm) {
        if (isConfirm) {
            var formData = new FormData();
            formData.append('mov_id',mov_id)
            fetch(base_url + '/Movimientos/delMovimiento', {method: "POST",body: formData})
            .then(response => response.json())
            .then(response => { 
                if(response.status){
                    mov_table.reload();
                }else{
                    swal("Atención!", response.msg , "error");
                }})
            .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
        }
    });
}
function getViewMov(mov_id){
    fetch(base_url+'/Movimientos/getView/'+mov_id)
        .then(response => response.json())
        .then(response => {
            document.querySelector('#bodyModal').innerHTML = response.data;
            $('#titleModalMov').text(response.title);
            $('#modalViewMov').modal('show');
         })
         .catch(error => console.error('Error:', error));
}
function openModalMov() {
    document.querySelector('#mov_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#set_mov').classList.replace("btn-info","btn-primary");
    $('#set_mov span').html("Guardar");
    document.querySelector("#formMov").reset();
    $('#mov_ncr_id').attr('data','0');
    switch (data.mov_t12_id) {
        case 16:
            $('#mov_t12_id').val(16);
            $('#mov_t10_id').val(1);
            $('#mde_gta_id').val(9);
            ftnSetMov_numero('SI01',16,1);
            break;
        case 2:
            $('#mov_t12_id').val(2);
            $('#mov_t10_id').val(49);
            $('#mde_gta_id').val(9);
            ftnSetMov_numero('NE01',2,49);
            break;
        case 1:
            $('#mov_t12_id').val(1);
            $('#mov_t10_id').val(50);
            $('#mde_gta_id').val(9);
            ftnSetMov_numero('NS01',1,50);
            break;
        case 13:
            $('#mov_t12_id').val(13);
            $('#mov_t10_id').val(1);
            $('#mde_gta_id').val(9);
            ftnSetMov_numero('ME01',13,1);
            break;
        case 18:
            $('#mov_t12_id').val(18);
            $('#mov_t10_id').val(1);
            $('#mde_gta_id').val(9);
            ftnSetMov_numero('NS01',18,1);
            break;
        default:
            break;
    }

    $('#mov_gt4_id').val(1);
    $('#mde_t6m_id').val(58);
    $('#mov_age_id').children().attr('value','0');
    $('#mov_age_id').children().text('Seleccione');  
    changet10t12()
    mde.clear();
    document.querySelector("#mov_fechaE").valueAsDate = new Date();
    ftnTcambio(document.querySelector("#mov_fechaE"));
    $('#modal_mov').modal('show');
}

function editMov(id) {
    var prefijo = 'mov';
    document.querySelector('#titleModal_'+prefijo).innerHTML ="Actualizar "+capitalize(getTable(prefijo));
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#set_'+prefijo).classList.replace("btn-primary", "btn-info");
    $('#set_'+prefijo+' span').html("Actualizar");
    fetch(base_url + '/Movimientos/getMovimiento/'+id)
    .then(response => response.json())
    .then(response => {
        if(response.status){
            var mov = response.data;
            $('#mov_id').val(mov.mov_id);
            if (mov.mov_age_id != null) {
                $('#mov_age_id').children().attr('value',mov.mov_age_id.age_id);
                $('#mov_age_id').children().text(mov.mov_age_id.age_ide+' - '+mov.mov_age_id.age_nombre);        
            }
            $('#mov_t12_id').val(mov.mov_t12_id.t12_id);
            $('#mov_t10_id').val(mov.mov_t10_id.t10_id); 
            $('#mov_serie').val(mov.mov_serie); 
            $('#mov_numero').val(mov.mov_numero); 
            $('#mov_gt4_id').val(mov.mov_gt4_id.gt4_id);
            $('#mde_t6m_id').val(58);
            $('#mde_gta_id').val(1);
            document.querySelector("#mov_fechaE").valueAsDate = new Date(mov.mov_fechaE);
            ftnTcambio(document.querySelector("#mov_fechaE"));
            mde_json = mov.mov_mde;
            for (const i in mde_json) {
                mde_json[i]['mde_q'] = parseFloat(mde_json[i]['mde_q']).toFixed(2);
                mde_json[i]['mde_vu'] = parseFloat(mde_json[i]['mde_vu']).toFixed(2);
                mde_json[i]['mde_importe'] =  parseFloat(mde_json[i]['mde_importe']).toFixed(2);
                mde_json[i]['mde_options'] = '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editMde(' + i + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>'+
                '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteMde(' + i + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>';
            }
            mde.reload();
            setTimeout(() => {
                subtotalMde();
            }, 1000);
            
            $('#mov_observaciones').val(mov.mov_observaciones); 
            $('#modal_'+prefijo).modal('show');
            return response;
        }else{
            swal("Error", response.msg , "error");
        }
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}

function changelabelinput(){
    $('#extradocdata').css('display','none');
    $('#extradoc').css('display','block');
}