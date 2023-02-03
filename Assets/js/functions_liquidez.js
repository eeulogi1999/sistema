
var liq_table,mvb_mov,mvb_caj;
var url_liq = base_url+"/Liquidez/getLiquidez/"+data.t;
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#liq_table")) {
        liq_table = $('#liq_table').autoTable({
            "url": url_liq,
            "numerate": true,
            "columns":[
                {"data":"liq_age_id.age_nombre",header:{t:"RAZON SOCIAL",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"liq_si",header:{t:"INICIO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_mtc",header:{t:"COMPRA",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_mtv",header:{t:"VENTA",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_mti",header:{t:"INGRESO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_mte",header:{t:"EGRESO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_castigo",header:{t:"CASTIGO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_premio",header:{t:"PREMIO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_actual",header:{t:"ACTUAL",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"liq_estado",header:{t:"ESTADO",c:'text'},tipo:'string'},
                {"data":"liq_options",header:"ACCION",tipo:'string'}
            ]
        });
        $("#new_age").click(function(e) {
            $("#modalTable_age").modal('show');
            setTimeout(() => {
                age_table.rezise();
                age_table.select(true);
            }, 220);
        })
        $("#select_age").click(function(e) {
            $('#liq_age_id').children().attr('value',age_table.getSelectedItem().age_id);
            $('#liq_age_id').children().text(age_table.getSelectedItem().age_ide+' - '+age_table.getSelectedItem().age_nombre);
        })
    }
    if (document.querySelector("#mvb_mov")) {
        mvb_mov = $('#mvb_mov').autoTable({
            "url":base_url+"/Liquidez/getIng/4",
            "numerate": true,
            "export": false,
            "columns":[
                {"data":"ing_fecha",header:{t:"FECHA",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"ing_tipo",header:{t:"TIPO",c:'text'},tipo:'string'},
                {"data":"ing_cuenta",header:{t:"CUENTA",c:'text'},tipo:'string'},
                {"data":"ing_descripcion",header:{t:"DESCRIPCION",c:'text'},tipo:'string'},
                {"data":"ing_monto",header:{t:"TOTAL",align:'right'},chr:'ing_gt4_id',tipo:'money',footer:{ c:"sum" }},
            ]
        });
    }
    if (document.querySelector("#mvb_caj")) {
        mvb_caj = $('#mvb_caj').autoTable({
            "url":base_url+"/Liquidez/getEgr/4" ,
            "numerate": true,
            "export": false,
            "columns":[
                {"data":"egr_fecha",header:{t:"FECHA",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"egr_tipo",header:{t:"TIPO",c:'text'},tipo:'string'},
                {"data":"egr_cuenta",header:{t:"CUENTA",c:'text'},tipo:'string'},
                {"data":"egr_descripcion",header:{t:"DESCRIPCION",c:'text'},tipo:'string'},
                {"data":"egr_monto",header:{t:"TOTAL",align:'right'},tipo:'money',chr:'egr_gt4_id',style:{condition:{minzero:'text-danger'}},footer:{ c:"sum" }},
            ]
        });
    }
});
window.addEventListener('load', async () => {
    liq_table = await liq_table;
    mvb_mov = await mvb_mov;
    mvb_caj = await mvb_caj;
    divLoading.style.display = "none";
});
async function editLiq(id) {
    var data = await edit('liq',id,true);
    $('#liq_age_id').children().attr('value',data.liq_age_id.age_id);
    if (data.liq_age_id.age_gem_id == null) {
        $('#liq_age_id').children().text(data.liq_age_id.age_gpe_id.gpe_nombre);
    } else {
        $('#liq_age_id').children().text(data.liq_age_id.age_gem_id.gem_razonsocial);
    }
     
}

function viewLiq(id,a,b,tga) {
    $('#liq_actual').text()
    $('#modalViewLiq').modal('show');
    $("#liq_pdf").attr("href",base_url+"/Liquidez/getPdf/"+id);
    $("#liq_xlsx").attr("href",base_url+"/Liquidez/getXlsx/"+id);
    $('#fil_his').attr('onclick','buscarHistorico('+id+')')
    fetch(base_url + '/Main/get/age,'+id)
    .then(r => r.json())
    .then(r => {
        if (r.data.age_gt4_id.gt4_id == 2) {
            $('#liq_actualn').parent().show();
            $('#liq_tga').parent().show();
        }else{
            $('#liq_actualn').parent().hide();
            $('#liq_tga').parent().hide();
        }
        var text = (r.data.age_gem_id==null)?r.data.age_gpe_id.gpe_nombre+' ,'+r.data.age_gpe_id.gpe_apellidos:r.data.age_gem_id.gem_razonsocial;
        $("#h_age_id").text(text);
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    mvb_mov.reload(base_url+"/Liquidez/getIng/"+id);
    setTimeout(() => {
        mvb_mov.rezise();
    }, 400);
    mvb_caj.reload(base_url+"/Liquidez/getEgr/"+id);
    setTimeout(() => {
        mvb_caj.rezise();
    }, 400);

    setTimeout(() => {
        let mt = Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.abs(a));
        $('#liq_actualn').text(Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(Math.abs(b)));
        $('#liq_tga').text(tga);
        if (a<0) {
            $('#liq_actual').text('POR PAGAR  '+mt);
        }else if (a>0){
            $('#liq_actual').text('POR COBRAR  '+mt);
        }else {
            $('#liq_actual').text(mt);
        }
    }, 600);
    
}

function buscarHistorico(id) {
    $('#modal_filter').modal('hide')
    let f_start =$('#f_start').val();
    let f_end =  $('#f_end').val();
    $("#liq_pdf").attr("href",base_url+"/Liquidez/getPdf/"+id+"&?f_start="+f_start+"&f_end="+f_end);
    $("#liq_xlsx").attr("href",base_url+"/Liquidez/getXlsx/"+id+"&?f_start="+f_start+"&f_end="+f_end);
    mvb_mov.reload(base_url+"/Liquidez/getIng/"+id+"&?f_start="+f_start+"&f_end="+f_end);
    setTimeout(() => {
        mvb_mov.rezise();
    }, 400);
    mvb_caj.reload(base_url+"/Liquidez/getEgr/"+id+"&?f_start="+f_start+"&f_end="+f_end);
    setTimeout(() => {
        mvb_caj.rezise();
    }, 400);
}