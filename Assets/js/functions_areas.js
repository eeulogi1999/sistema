var gar_table;
var url_gar = base_url+"/Main/getAll/gar";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gar_table")) {
        gar_table = $('#gar_table').autoTable({
            "url": url_gar,
            "numerate": true,
            "thid": 'gar_id',
            "columns":[
                {"data":"gar_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gar_descripcion",header:{t:"DESCRIPCION",c:'text'},tipo:'string'},
                {"data":"gar_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
});

window.addEventListener('load', async () => {
    gar_table = await gar_table;
    divLoading.style.display = "none";
});