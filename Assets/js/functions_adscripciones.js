let ade;
var ade_json = {};

var ads_table;
var url_ads = base_url+"/Adscripciones/getAdscripciones"; 
document.addEventListener('DOMContentLoaded', async function () {
    if (document.querySelector("#ads_table")) {
        ads_table = $('#ads_table').autoTable({
            "url": url_ads,
            "numerate": true,
            "columns":[
                {"data":"ads_cunico",header:{t:"CODIGO"},tipo:'string'},
                {"data":"ads_fecha",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"ads_col_id.col_gpe_id.gpe_identificacion",header:{t:"COD. PERSONAl"},tipo:'string'},
                {"data":"ads_col_id.col_gpe_id.gpe_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"ads_ubi_id.ubi_gar_id.gar_nombre",header:{t:"AREA"},tipo:'string'},
                {"data":"ads_ubi_id.ubi_gdi_id.gdi_distrito",header:{t:"CIUDAD"},tipo:'string'},
                {"data":"ads_motivo",header:{t:"MOTIVO"},tipo:'string'},
                {"data":"ads_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"ads_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }

    ade = $('#ade').autoTable({
        "src": "ade_json",
        "numerate": true,
        "export": false,
        "columns":[
            {"data":"ade_q",header:"CANTIDAD"},
            {"data":"ade_act_id.act_nombre",header:"NOMBRE"},
            {"data":"ade_serie",header:"SERIE"},
            {"data":"ade_fechaA",header:"FECHA"},
            {"data":"ade_vutil",header:"VIDA UTIL"},
            {"data":"ade_vu",header:"V.U."},
            {"data":"ade_mt",header:"SUBTOTAL"},
            {"data":"ade_options",header:"OPCIONES"}
        ]
    });
    $('#ubi_est_id').loadOptions('establecimientos',['est_nombre']);
    $('#ubi_gar_id').loadOptions('areas',['gar_nombre']);
    $('#ads_col_id').loadOptions('colaboradores',['col_gpe_id.gpe_nombre']);
    $('#gde_id').loadOptions('departamentos',['gde_departamento']);
    setTimeout(function(){
        $('#gde_id').val(15);
        $('#gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:15});
        setTimeout(function(){
            $('#gpr_id').val(1501);
            $('#ubi_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:1501});
        }, 500);
    }, 500);
    $('#nuevo_col').click(function() {
        $('#set_col').attr('onclick',"event.preventDefault();setCol();");
        openModal('col');
    });
    $('#nuevo_gar').click(function() {
        $('#modalGar').modal('show');
    });   
    
    $('#nuevo_act').click(function() {
        $('#modalTable_act').modal('show');
    });
    $('#select_act').click(function (e) {
        e.preventDefault();
        $('#ade_act_id').children().attr('value',$$("act_table").getSelectedItem().bie_id);
        $('#ade_act_id').children().text($$("act_table").getSelectedItem().act_codigo+' - '+$$("act_table").getSelectedItem().act_nombre);
    });
    $('#gde_id').change(function(){
        $('#gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$(this).val()});
        $('#ubi_gdi_id').html('');
    })
    $('#gpr_id').change(function(){
        $('#ubi_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$(this).val()});
    })

    $('#ade_q').keyup(function (e) {
		e.preventDefault();
        adeProducto()
	});
	$('#ade_vu').keyup(function (e) {
		e.preventDefault();
        adeProducto()
	});
	$('#ade_mt').keyup(function (e) {
		e.preventDefault();
		var ade_p = $('#ade_mt').val() / $('#ade_q').val();
		$('#ade_vu').val(ade_p.toFixed(2));
		if ($('#ade_mt').val() < 0.00000000001 || isNaN($('#ade_vu').val())) {
			$('#set_ade').slideUp();
		} else {
			$('#set_ade').slideDown();
		}
	});


    $('#mov_t12_id').change(function (e) {
        e.preventDefault();
        if ($(this).val()=='16') {
            $('#formAge').parent().prop( "disabled", true )
        }
    });

    $('#set_ads').click(function(e) {
        e.preventDefault();
        divLoading.style.display = "flex";
        var formAsi = new FormData(document.getElementById("formAsi"));                
        var formUbi = Object.fromEntries(new FormData(document.getElementById("formUbi")));
        var json = ade_json;
        for (const i in json) {
            delete json[i].ade_options;
        }
        formAsi.append('ads_ade_id', JSON.stringify(json)); 
        formAsi.append('ads_ubi_id', JSON.stringify(formUbi)); 
        fetch(base_url + '/Adscripciones/setAdscripciones', {method: "POST",body: formAsi})
            .then(response => response.json())
            .then(response => {
                var objData = response;
                if (objData.status) {
                    $('#modal_ads').modal("hide");
                    document.getElementById("formAsi").reset();
                    document.getElementById("formUbi").reset();      
                    swal("Adscripciones", 'N° OPERACION: ', "success");
                    ade_json= {};
                    ade.reload();
                    ads_table.api().ajax.reload();

                } else if (objData.exist) {
                    swal("Adscripciones",objData.msg, "warning");
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
    })
});

window.addEventListener('load', async () => {
    ads_table = await ads_table;
    ade = await ade;
    divLoading.style.display = "none";
    ads_table.select(true);
});

async function setCol(){
    var res = await set('col',null,null,true);
    if (res.status) {
        $('#modal_col').modal('hide');
        $('#ads_col_id').loadOptions('colaboradores',['col_gpe_id.gpe_nombre']);
    }
}
function adeProducto() {
    var ade_mt = $('#ade_vu').val() * $('#ade_q').val();
    $('#ade_mt').val(ade_mt.toFixed(2));
    if ($('#ade_q').val() < 0.000000000001 || isNaN($('#ade_mt').val()) || $('#ade_vu').val() < 0.000000000001 ) {
        $('#set_ade').slideUp();
    } else {
        $('#set_ade').slideDown();
    }
}

function setAde(id=-1) {
    if (id>=0) {
        var pin = id;
    } else {
        var pin = 0;
        for (const i in ade_json) {
            if (Object.hasOwnProperty.call(ade_json, i)) {
                if (pin<=parseInt(i)) {
                    pin = parseInt(i)+1;
                }
            }
        }
    }
    ade_json[pin] = {
        ade_act_id: {
            act_id: $('#ade_act_id').val(),
            act_nombre: $('#ade_act_id').find('option:selected').text()
        },
        ade_q: parseFloat($('#ade_q').val()).toFixed(2),
        ade_serie: $('#ade_serie').val(),
        ade_fechaA: $('#ade_fechaa').val(),
        ade_vutil: parseInt($('#ade_vutil').val()), 
        ade_vu: parseFloat($('#ade_vu').val()).toFixed(2), 
        ade_mt: parseFloat($('#ade_mt').val()).toFixed(2), 
        ade_options: '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editAde(' + pin + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>'+
        '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteAde(' + pin + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>'
    };
    ade.reload();
    $('#set_ade').removeClass('btn-info').addClass('btn-primary');
    $('#set_ade').children('i').removeClass('fa-refresh').addClass('fa-plus');
    $('#set_ade').attr('onclick','event.preventDefault();setAde();')                 
}
function deleteAde(id) {
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
            delete ade_json[id];
            ade.reload();
        }
    });
}
function editAde(id) {
    $('#ade_q').val(ade_json[id].ade_q);
    $('#ade_act_id').val(ade_json[id].ade_act_id.act_id);
    $('#ade_serie').val(ade_json[id].ade_serie);
    $('#ade_fechaa').val(ade_json[id].ade_fechaa);
    $('#ade_vutil').val(ade_json[id].ade_vutil);
    $('#ade_vu').val(ade_json[id].ade_vu);
    $('#ade_mt').val(ade_json[id].ade_mt);

    $('#set_ade').removeClass('btn-primary').addClass('btn-info');
    $('#set_ade').children('i').removeClass('fa-plus').addClass('fa-refresh');
    $('#set_ade').attr('onclick','event.preventDefault();setAde('+id+');')
    $('#set_ade').slideDown();
    $("#ade_mt").removeAttr("disabled");
    $("#ade_q").removeAttr("disabled");
    $("#ade_vu").removeAttr("disabled");
}
function editAds(params) {
    fntEditAsi
}

function openAde() {
    $("#ade_mt").removeAttr("disabled");
    $("#ade_q").removeAttr("disabled");
    $("#ade_vu").removeAttr("disabled");
}

function getViewAsi(mov_id){
    fetch(base_url+'/Adscripciones/getAsignacion/'+mov_id)
        .then(response => response.json())
        .then(response => {
            console.log(response);
         })
         .catch(error => console.error('Error:', error));
}

function openmodal_ads() {
    document.querySelector('#ads_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#set_ads').classList.replace("btn-info","btn-primary");
    $('#set_ads span').html("Guardar");
    document.querySelector("#formAsi").reset();
    document.querySelector("#formUbi").reset();
    ade.clear();
    document.querySelector("#ads_fecha").valueAsDate = new Date();
    $('#modal_ads').modal('show');
}