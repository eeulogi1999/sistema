var gmo_table;
var url_gmo = base_url+"/Modulos/getModulos";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gmo_table")) {
        gmo_table = $('#gmo_table').autoTable({
            "url": url_gmo,
            "numerate": true,
            "thid": 'gmo_id',
            "tree":true,
            "columns":[
                {"data":"gmo_titulo",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gmo_descripcion",header:{t:"DESCRIPCION"},tipo:'string'},
                {"data":"gmo_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gmo_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
});

window.addEventListener('load', async () => {
    gmo_table = await gmo_table;
    divLoading.style.display = "none";
    gmo_table.select(true);
});

async function setGmo() {
    var formData = new FormData(document.getElementById("form_gmo"));
    if (!isUndefined(gmo_table.getSelectedId())) {
        formData.append('gmo_gmo_id', gmo_table.getSelectedItem().gmo_id);
    }
    let json = Object.fromEntries(formData);
    var gmo = await set('gmo',['gmo_titulo'],json,true);
    if (gmo.status) {
        resetModal('gmo');
    }
}
