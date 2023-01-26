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
                {"data":"mov_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"mov_mde_id.0.mde_q",header:{t:"CANTIDAD",align:'right'},tipo:'float'},
                {"data":"mov_mde_id.0.mde_vu",header:{t:"PRECIO",align:'right'},tipo:'money'},
                {"data":"mov_qe",header:{t:"Q. ENTREGADA",align:'right'},tipo:'float'},
                {"data":"mov_qeref",header:{t:"REFERENCIAS",align:'center'},tipo:'string'},
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