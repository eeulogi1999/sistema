var caj_table;
var url_caj = base_url+"/Cajas/getGastos";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#caj_table")) {
        caj_table = $('#caj_table').autoTable({
            "url": url_caj,
            "numerate": true,
            "thid": 'caj_id',
            "columns":[
                {"data":"caj_tga_id.tga_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"caj_monto",header:{t:"DESCRIPCION",c:'text'},tipo:'money'}
            ]
        }); 
    }
});

window.addEventListener('load', async () => {
    caj_table = await caj_table;
    divLoading.style.display = "none";
});