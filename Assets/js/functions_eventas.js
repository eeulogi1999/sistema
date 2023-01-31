var eve_table;
var url_eve = base_url+"/Movimientos/getEventas";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#eve_table")) {
        eve_table = $('#eve_table').autoTable({
            "url": url_eve,
            "numerate": true,
            "columns":[
                {"data":"mov_doc",header:{t:"DOC.",align:'center'},tipo:'string'},
                {"data":"mov_age_id.age_gem_id.gem_razonsocial",header:"MATERIAL",tipo:'string'},
                {"data":"mov_cue_id.cue_nombre",header:"CUENTAS",tipo:'string'},
                {"data":"mov_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"mov_mde_id.0.mde_q",header:{t:"CANT./KG",align:'right'},tipo:'float'},
                {"data":"mov_tonq",header:{t:"CANT./TON",align:'right'},tipo:'float'},
                {"data":"mov_mde_id.0.mde_vu",header:{t:"PRECIO/KG",align:'right'},tipo:'money',chr:'mov_gt4_id'},
                {"data":"mov_tonvu",header:{t:"PRECIO/TON",align:'right'},tipo:'money',chr:'mov_gt4_id'},
                {"data":"mov_total",header:{t:"MONTO TOTAL",align:'right'},tipo:'money',chr:'mov_gt4_id'},
                {"data":"mov_qe",header:{t:"Q. ENTREGADA",align:'right'},tipo:'float'},
                {"data":"mov_qeref",header:{t:"REFERENCIAS",align:'center'},tipo:'string'},
                {"data":"mov_qs",header:{t:"Q. SALDO",align:'right'},tipo:'float'},
                {"data":"mov_fechaV",header:{t:"PLAZO",align:'center'},tipo:'string'},
                {"data":"mov_mstatus",header:{t:"ESTADO",align:'center'},tipo:'string'}
            ]
        });
    }

});

window.addEventListener('load', async () => {
    if (document.querySelector("#eve_table")) {
        eve_table = await eve_table;
    }
    divLoading.style.display = "none";
});