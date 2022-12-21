var gro_table;
var url_gro = base_url+"/Main/getAll/gro";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gro_table")) {
        gro_table = $('#gro_table').autoTable({
            "url": url_gro,
            "numerate": true,
            "thid": 'gro_id',
            "columns":[
                {"data":"gro_nombrerol",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gro_descripcion",header:{t:"DESCRIPCION"},tipo:'string'},
                {"data":"gro_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gro_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
});

window.addEventListener('load', async () => {
    gro_table = await gro_table;
    divLoading.style.display = "none";
});