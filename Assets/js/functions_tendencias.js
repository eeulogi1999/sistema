var ten_table;
var url_ten = base_url+"/Utilitarios/getTendencias";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#ten_table")) {
        ten_table = $('#ten_table').autoTable({
            "url": url_ten,
            "numerate": true,
            "columns":[
                {"data":"ten_bie",header:"MATERIAL",tipo:'string'},
                {"data":"ten_inv",header:{t:"INVESTING",align:'right'},tipo:'money'},
                {"data":"ten_lme",header:{t:"LME",align:'right'},tipo:'money'},
                {"data":"ten_exp",header:{t:"EXPANCION",align:'right'},tipo:'money'},
                {"data":"ten_options",header:{t:"OPCIONES",align:'center'},tipo:'string'} 
            ]
        });
    }
});

window.addEventListener('load', async () => {
    if (document.querySelector("#ten_table")) {
        ten_table = await ten_table;
    }
    divLoading.style.display = "none";
});