var ubi_table;
var url_ubi = base_url+"/Main/getAll/ubi";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#ubi_table")) {
        ubi_table = $('#ubi_table').autoTable({
            "url": url_ubi,
            "numerate": true,
            "thid": 'ubi_id',
            "columns":[
                {"data":"ubi_clave",header:{t:"PROP."},tipo:'string'},
                {"data":"ubi_valor",header:{t:"DESCR."},tipo:'string'},
                {"data":"ubi_est_id.est_nombre",header:{t:"ESTABLECIMIENTO"},tipo:'string'},
                {"data":"ubi_alm_id.alm_nombre",header:{t:"ALMACEN"},tipo:'string'},
                {"data":"ubi_gar_id.gar_nombre",header:{t:"AREA"},tipo:'string'},
                {"data":"ubi_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"ubi_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
});

window.addEventListener('load', async () => {
    ubi_table = await ubi_table;
    divLoading.style.display = "none";
});

async function setPreUbi(where,json,res) {
    if (!isUndefined(ubi_table.getSelectedId())) {
        json.ubi_ubi_id = ubi_table.getSelectedItem().ubi_id
    }
    return {json}; 
}
