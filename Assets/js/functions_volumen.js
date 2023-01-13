var det_table;
var url_det = base_url+"/Gerencial/getDetracciones";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#det_table")) {
        det_table = $('#det_table').autoTable({
            "url": url_det,
            "numerate": true,
            "columns":[
                {"data":"mov_cue_id.cue_nombre",header:"SOCIOS",tipo:'string',footer:"TOTALES"},
                {"data":"mov_sum",header:{t:"SUB TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        });
    }

});

window.addEventListener('load', async () => {
    if (document.querySelector("#det_table")) {
        det_table = await det_table;
    }
    divLoading.style.display = "none";
});
