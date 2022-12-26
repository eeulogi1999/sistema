var res_table,cve_table,sfi_table,exp_table,det_table;
var url_res = base_url+"/Gerencial/getGerencial";
var url_cve = base_url+"/Reportes/getCventas";
var url_sfi = base_url+"/Gerencial/getResultados";
var url_exp = base_url+"/Gerencial/getExportaciones";
var url_det = base_url+"/Gerencial/getDetracciones";
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
                {"data":"mov_cue_id.cue_nombre",header:"CUENTAS",tipo:'string',footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }}
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
                {"data":"mov_detraccion",header:{t:"DETRACCION",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_impuesto",header:{t:"IMPUESTO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_det_liq",header:{t:"RETORNO",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        });
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
    divLoading.style.display = "none";
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

async function resumenPdf(){
    var formData = new FormData()
    let res_table = new Blob([$('#res_table').parent().html()], {type: "text/html"});
    formData.append('res_table',new File([res_table],'res_table.html')); 
    let cue_table = new Blob([$('#cue_table').parent().html()], {type: "text/html"});
    formData.append('cue_table',new File([cue_table],'cue_table.html')); 
    let sbi_table = new Blob([$('#sbi_table').parent().html()], {type: "text/html"});
    formData.append('sbi_table',new File([sbi_table],'sbi_table.html')); 
    liq_table.reload(base_url+"/Liquidez/getLiquidez/cobrar");
    let liq_pagar = new Blob([$('#liq_table').parent().html()], {type: "text/html"});
    formData.append('liq_pagar',new File([liq_pagar],'liq_pagar.html'));
    liq_table.reload(base_url+"/Liquidez/getLiquidez/pagar");
    let liq_cobrar = new Blob([$('#liq_table').parent().html()], {type: "text/html"});
    formData.append('liq_cobrar',new File([liq_cobrar],'liq_cobrar.html')); 
    fetch(base_url + '/Reportes/resumenPDF', {method: "POST",body: formData})
    .then(response => response.json())
    .then(r => {
        window.open(base_url+'/Assets/pdf/'+r.name, '_blank');
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}