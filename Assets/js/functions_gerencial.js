var res_table,cve_table,sfi_table,exp_table,det_table,com_table,tri_table,sum_table,nrc_table;
var url_res = base_url+"/Gerencial/getGerencial";
var url_cve = base_url+"/Reportes/getCventas";
var url_sfi = base_url+"/Gerencial/getResultados";
var url_exp = base_url+"/Liquidez/getExportaciones";
var url_det = base_url+"/Liquidez/getDetracciones";
var url_sum = base_url+"/Liquidez/getDetracciones";
var url_com = base_url+"/Gerencial/getComisiones";
var url_nrc = base_url+"/Main/getAll/nrc";
var url_tri = base_url+"/Gerencial/getComisiones";

var drc_table;
var drc_json = [];
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
    if (document.querySelector("#nrc_table")) {
       nrc_table = $('#nrc_table').autoTable({
            "url": url_nrc,
            "numerate": true,
            "columns":[
                {"data":"nrc_age_id.age_gpe_id.gpe_nombre",header:"AGENTE",tipo:'string',footer:"TOTALES"},
                {"data":"nrc_fechai",header:{t:"FECHA INICIO",align:'right'},tipo:'string'},
                {"data":"nrc_fechaf",header:{t:"FECHA FIN",align:'right'},tipo:'string'},
                {"data":"nrc_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"nrc_gus_id.gus_gpe_id.gpe_nombre",header:{t:"USER",align:'center'},tipo:'string'},
                {"data":"nrc_ver",header:{t:"VER",align:'center'},render:(r)=>{
                    return '<a class="btn btn-sm btn-danger" target="_blank" href="'+base_url+'/Gerencial/getNrcPDF/'+r.nrc_id+'"><i class="far fa-file-pdf"></i></a> '+
                        '<button class="btn btn-sm btn-danger" target="_blank" onClick="del(`nrc`,'+r.nrc_id+')"><i class="fas fa-trash"></i></button> '+
                        '<button class="btn btn-sm btn-warning" onClick="edit(`nrc`,'+r.nrc_id+')"><i class="fa fa-pencil"></i></button>'
                },tipo:'string'}
            ]
        });
        $('#nrc_age_id').loadOptions('agentes',['age_gpe_id.gpe_nombre','age_gpe_id.gpe_apellidos'],{'custom':'age_gpe_id IS NOT NULL'});
    }
    if (document.querySelector("#drc_table")) {
        drc_table = $('#drc_table').autoTable({
            "src": 'drc_json',
            "cell":true,
            'thid':'drc_id',
            "columns":[
                {"data":"mde_bie_id.bie_nombre",header:"MATERIAL",tipo:'string',footer:"TOTALES"},
                {"data":"rco_q",header:{t:"CANTIDAD TOTAL",align:'right'},tipo:'float',footer:{ c:"sum" }},
                {"data":"rco_pp",header:{t:"PRECIO PROMEDIO",align:'right'},render:(r)=>{return (r.rco_st/r.rco_q).toFixed(2)},tipo:'money'},
                {"data":"rco_st",header:{t:"TOTAL SOLES",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"rco_opt",header:{t:"VER",align:'center'},tipo:'string'},
                {"data":"rco_porc",header:{t:"PORCENTAJE %",align:'center'},tipo:'float',style:{bg:'success',color:'white'}},
                {"data":"rco_pt",header:{t:"SOLES %",align:'right'},render:(r)=>{return r.rco_st*(r.rco_porc/100)},tipo:'money',footer:{ c:"sum" }}
            ]
        });
     }
    if (document.querySelector("#sum_table")) {
        sum_table = $('#sum_table').autoTable({
            "url": url_sum,
            "numerate": true,
            "columns":[
                {"data":"mov_cue_id.cue_nombre",header:"SOCIOS",tipo:'string',footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"SUB TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_options",header:{t:"OPCIONES",align:'center'},tipo:'string'},
                {"data":"mov_detraccion",header:{t:"DETRACCION",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_impuesto",header:{t:"IMPUESTO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_det_liq",header:{t:"RETORNO",align:'right'},tipo:'money',footer:{ c:"sum" }}, 
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
    if (document.querySelector("#sum_table")) {
        sum_table = await sum_table;
    }
    if (document.querySelector("#nrc_table")) {
        nrc_table = await nrc_table;
    }
    if (document.querySelector("#drc_table")) {
        drc_table = await drc_table;
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
    if (trim) {
        mov_table.reload(base_url+"/Gerencial/getDetView/"+id+'?trim='+trim);
    }else{
        mov_table.reload(base_url+"/Gerencial/getDetView/"+id);
    }
    
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
function sumDetracciones() {
    sum_table.reload(base_url+"/Liquidez/getDetracciones",{trim:"'"+$('#fecha_i').val()+"' AND '"+$('#fecha_f').val()+"'"});
}
async function openModalNrc() {
    const dt = await search('nrc',{},'MAX(nrc_num) AS max')
    $('#nrc_num').val(parseInt(dt.max??0)+1)
    drc_json = [];
    drc_table.reload()
}
async function filterTriNrc(e) {
    e.preventDefault()
    drc_json = await fetch(base_url+"/Gerencial/getTriView/"+$('#nrc_age_id').val()+'?fecha_i='+$('#nrc_fechai').val()+'&fecha_f='+$('#nrc_fechaf').val()).then(r=>r.json()).then(r=>{return r})
    drc_table.reload()
}

function setPreNrc(where,json,res) {
    let total = 0;
    for (const i in drc_json) {
        delete drc_json[i].rco_opt
        total+=drc_json[i].rco_pt
    }
    json.nrc_json = JSON.stringify(drc_json);
    json.nrc_monto = total;
    json.nrc_gus_id = data.gus_id
    return {json}
}

function getPosNrc() {
    drc_json = JSON.parse(data.nrcId.nrc_json) 
    drc_table.reload()
}