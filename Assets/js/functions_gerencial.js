var res_table,cve_table,sfi_table,exp_table,det_table,com_table,tri_table;
var url_res = base_url+"/Gerencial/getGerencial";
var url_cve = base_url+"/Reportes/getCventas";
var url_sfi = base_url+"/Gerencial/getResultados";
var url_exp = base_url+"/Liquidez/getExportaciones";
var url_det = base_url+"/Liquidez/getDetracciones";
var url_com = base_url+"/Gerencial/getComisiones";
var url_tri = base_url+"/Gerencial/getComisiones";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#res_table")) {
        res_table = $('#res_table').autoTable({
            "url": url_res,
            "numerate": true,
            "columns":[
                {"data":"res_descripcion",header:"DESCRIPCION",tipo:'string',footer:"TOTALES"},
                {"data":"res_total",header:{t:"TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"res_options",header:{t:"OPCIONES",align:'center'},tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#cve_table")) {
        cve_table = $('#cve_table').autoTable({
            "url": url_cve,
            "numerate": true,
            "columns":[
                {"data":"cve_bie_id.bie_nombre",header:"MATERIAL",tipo:'string',footer:"TOTALES"},
                {"data":"cve_qcv",header:'CANTIDAD',tipo:'float',footer:{ c:"sum" }},
                {"data":"cve_mtv",header:'VENTA',tipo:'money',footer:{ c:"sum" }},
                {"data":"cve_mtcv",header:'COSTO DE VENTA',tipo:'money',footer:{ c:"sum" }},
                {"data":"cve_margen",header:'MARGEN',tipo:'money',footer:{ c:"sum" },style:{condition:{minzero:'text-danger'}}},
                {"data":"cve_options",header:{t:"OPCIONES",align:'center'},tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#sfi_table")) {
        sfi_table = $('#sfi_table').autoTable({
            "url": url_sfi,
            "numerate": true,
            "columns":[
                {"data":"sfi_des",header:"DESCRIPCION",tipo:'string',footer:"TOTALES"},
                {"data":"sfi_sum",header:{t:"TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        });
    }
    if (document.querySelector("#exp_table")) {
        exp_table = $('#exp_table').autoTable({
            "url": url_exp,
            "numerate": true,
            "columns":[
                {"data":"mov_cue_id.cue_nombre",header:"CUENTAS",tipo:'string',style:{color:'info'},footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"TOTAL VENTAS",align:'right'},tipo:'money',style:{color:'info'},footer:{ c:"sum" }}, 
                {"data":"mov_options",header:{t:"OPCIONES",align:'center'},tipo:'string'},
                {"data":"mov_porc",header:{t:"% PROM. COMPRAS",align:'center'},tipo:'string'},
                {"data":"mov_base",header:{t:"COMPRAS",align:'center'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_cigv",header:{t:"IGV",align:'center'},tipo:'money'},
                {"data":"mov_impuesto",header:{t:"IMPUESTO",align:'center'},style:{color:'info'},tipo:'money'},
                {"data":"mov_retorno",header:{t:"RETORNO",align:'center'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_porc_ret",header:{t:"PORCENTAJE",align:'center'},tipo:'string'},
                {"data":"mov_dscg",header:{t:"DSCG",align:'center'},tipo:'money',footer:{ c:"sum" }}, 
                {"data":"mov_sald",header:{t:"SALDO",align:'center'},tipo:'money',footer:{ c:"sum" }}
            ]
        });
    }
    if (document.querySelector("#det_table")) {
        det_table = $('#det_table').autoTable({
            "url": url_det,
            "numerate": true,
            "columns":[
                {"data":"mov_cue_id.cue_nombre",header:"SOCIOS",tipo:'string',footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"SUB TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_options",header:{t:"OPCIONES",align:'center'},tipo:'string'},
                {"data":"mov_detraccion",header:{t:"DETRACCION",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_impuesto",header:{t:"IMPUESTO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_det_liq",header:{t:"RETORNO",align:'right'},tipo:'money',footer:{ c:"sum" }}, 
                {"data":"mov_porc",header:{t:"PORCENTAJE",align:'center'},tipo:'string'},
                {"data":"mov_dscg",header:{t:"DSCG",align:'center'},tipo:'money',footer:{ c:"sum" }}, 
                {"data":"mov_sald",header:{t:"SALDO",align:'center'},tipo:'money',footer:{ c:"sum" }}
                

            ]
        });
    }
    if (document.querySelector("#com_table")) {
        com_table = $('#com_table').autoTable({
            "url": url_com,
            "numerate": true,
            "columns":[
                {"data":"rco_bie_id.bie_nombre",header:"MATERIAL",tipo:'string',footer:"TOTALES"},
                {"data":"rco_q",header:{t:"CANTIDAD TOTAL",align:'right'},tipo:'float',footer:{ c:"sum" }},
                {"data":"rco_pp",header:{t:"PRECIO PROMEDIO",align:'right'},tipo:'money'},
                {"data":"rco_st",header:{t:"TOTAL SOLES",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"rco_opt",header:{t:"VER",align:'center'},tipo:'string'},
                {"data":"rco_porc",header:{t:"PORCENTAJE %",align:'center'},tipo:'string'},
                {"data":"rco_pt",header:{t:"SOLES %",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        });
    }
    if (document.querySelector("#tri_table")) {
        tri_table = $('#tri_table').autoTable({
            "url": url_tri,
            "numerate": true,
            "columns":[
                {"data":"mde_bie_id.bie_nombre",header:"MATERIAL",tipo:'string',footer:"TOTALES"},
                {"data":"rco_q",header:{t:"CANTIDAD TOTAL",align:'right'},tipo:'float',footer:{ c:"sum" }},
                {"data":"rco_pp",header:{t:"PRECIO PROMEDIO",align:'right'},render:(r)=>{return (r.rco_st/r.rco_q).toFixed(2)},tipo:'money'},
                {"data":"rco_st",header:{t:"TOTAL SOLES",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"rco_opt",header:{t:"VER",align:'center'},tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#cms_age_id")) {
        $('#cms_age_id').loadOptions('agentes',['age_gpe_id.gpe_nombre','age_gpe_id.gpe_apellidos'],{'custom':'age_gpe_id IS NOT NULL'});
        $('#cms_age_id').change(function(e) {
            e.preventDefault()
            $('#pdf_com').attr('href',base_url+'/Gerencial/getRcoPDF/'+e.target.value)
            com_table.reload(base_url+"/Gerencial/getComisiones/"+e.target.value);
            
        })
    }
    if (document.querySelector("#his_age_id")) {
        $('#his_age_id').loadOptions('agentes',['age_gpe_id.gpe_nombre','age_gpe_id.gpe_apellidos'],{'custom':'age_gpe_id IS NOT NULL'});
    }
});

window.addEventListener('load', async () => {
    if (document.querySelector("#res_table")) {
        res_table = await res_table;
    }
    if (document.querySelector("#cve_table")) {
        cve_table = await cve_table;
    }
    if (document.querySelector("#sfi_table")) {
        sfi_table = await sfi_table;
    }
    if (document.querySelector("#exp_table")) {
        exp_table = await exp_table;
    }
    if (document.querySelector("#det_table")) {
        det_table = await det_table;
    }
    if (document.querySelector("#com_table")) {
        com_table = await com_table;
    }
    if (document.querySelector("#tri_table")) {
        tri_table = await tri_table;
    }
    divLoading.style.display = "none";
    if (data.per==='0') {
        new bootstrap.Tab(document.querySelector('#historico-tab')).show()
        document.querySelector('#resumen-tab').classList.add('disabled')
    }
});
function resEfectivo() {
    $("#modalTableCue").modal('show');
    cue_table.reload(base_url+"/Cuentas/getCuentas/1");
    setTimeout(() => {
        cue_table.rezise();
    }, 220);
}
function resCuentas() {
    $("#modalTableCue").modal('show');
    cue_table.reload(base_url+"/Cuentas/getCuentas/2");
    setTimeout(() => {
        cue_table.rezise();
    }, 220);
}
function resInventario() {
    $("#modalTableBie").modal('show');
    setTimeout(() => {
        sbi_table.rezise();
    }, 220);
}
function resCobrar() {
    $("#modalTableLiq").modal('show');
    liq_table.reload(base_url+"/Liquidez/getLiquidez/cobrar");
    setTimeout(() => {
        liq_table.rezise();
    }, 220);
}
function resPagar() {
    $("#modalTableLiq").modal('show');
    liq_table.reload(base_url+"/Liquidez/getLiquidez/pagar");
    setTimeout(() => {
        liq_table.rezise();
    }, 220);
}
function openModalHis(id) {
    $('#modalTable_his').modal('show');
    his_table.reload(base_url+"/Reportes/getHistorico/"+id)
    setTimeout(() => {
        his_table.rezise();
    }, 220);
}
async function cierre() {
    divLoading.style.display = "flex";
    fetch(base_url + '/Reportes/cierre')
    .then(response => response.json())
    .then(r => {
        swal('Mercaderia',r.msg,'success')
    })
    .catch(error => console.log(error))
    fetch(base_url + '/Liquidez/cierre')
    .then(response => response.json())
    .then(r => {
        swal('Liquidez',r.msg,'success')
    })
    .catch(error => console.log(error))
    fetch(base_url + '/Cuentas/cierre')
    .then(response => response.json())
    .then(r => {
        swal('Cuentas',r.msg,'success')
    })
    .catch(error => console.log(error))
    divLoading.style.display = "none";
}

async function setPorcentaje(id,e) {
    await set(`cue`,null,{cue_id:id,cue_porcentaje:e.target.value},true); 
    window[e.target.name+'_table'].reload()
} 
async function setPorExp(id,e) {
    await set(`cue`,null,{cue_id:id,cue_por_exp:e.target.value},true); 
    exp_table.reload()
}

function getExpDet(id) {
    $('#modalTable_mov').modal('show');
    mov_table.reload(base_url+"/Gerencial/getExpDet/"+id);
    setTimeout(() => {
        mov_table.rezise();
    }, 400);
}

function getDetView(id,trim=null) {
    $('#modalTable_mov').modal('show');
    mov_table.reload(base_url+"/Gerencial/getDetView/"+id);
    setTimeout(() => {
        mov_table.rezise();
    }, 400);
}

function getComView(id,trim=null) {
    $('#modalTable_mov').modal('show');
    mov_table.reload(base_url+"/Gerencial/getComView/"+id+'?trim='+trim);
    setTimeout(() => {
        mov_table.rezise();
    }, 400);
}
async function setPocRco(id,e) {
    e.preventDefault();
    await set(`rco`,null,{rco_id:id,rco_porc:e.target.value},true); 
    com_table.reload()
}

function filterTriCom() {
    tri_table.reload(base_url+"/Gerencial/getTriView/"+$('#his_age_id').val()+'?fecha_i='+$('#fecha_i').val()+'&fecha_f='+$('#fecha_f').val());
}