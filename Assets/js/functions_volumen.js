var det_table,exp_table;
var url_det = base_url+"/Liquidez/getDetracciones";
var url_exp = base_url+"/Liquidez/getExportaciones";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#det_table")) {
        det_table = $('#det_table').autoTable({
            "url": url_det,
            "numerate": true,
            "columns":[
                {"data":"mov_cue_id.cue_nombre",header:"SOCIOS",tipo:'string',footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"SUB TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"mov_options",header:{t:"OPCIONES",align:'center'},tipo:'string'} 
            ]
        });
    }
    if (document.querySelector("#exp_table")) {
        exp_table = $('#exp_table').autoTable({
            "url": url_exp,
            "numerate": true,
            "columns":[
                {"data":"mov_cue_id.cue_nombre",header:"CUENTAS",tipo:'string',footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"TOTAL VENTAS",align:'right'},tipo:'money',footer:{ c:"sum" }}, //mov_options
                {"data":"mov_options",header:{t:"OPCIONES",align:'center'},tipo:'string'} 
            ]
        });
    }

});

window.addEventListener('load', async () => {
    if (document.querySelector("#det_table")) {
        det_table = await det_table;
    }
    if (document.querySelector("#exp_table")) {
        exp_table = await exp_table;
    }
    divLoading.style.display = "none";
});

function getExpDet(id) {
    $('#modalTable_mov').modal('show');
    mov_table.reload(base_url+"/Gerencial/getExpDet/"+id);
    setTimeout(() => {
        mov_table.rezise();
    }, 400);
}

function getDetView(id,trim=null) {
    $('#modalTable_mov').modal('show');
    mov_table.reload(base_url+"/Gerencial/getDetView/"+id+'?trim='+trim);
    setTimeout(() => {
        mov_table.rezise();
    }, 400);
}

function hisTrim(e) {
    e.preventDefault();
    if (e.target.value != '') {
        det_table.reload(base_url+"/Liquidez/getDetracciones/"+e.target.value);
    } 
}