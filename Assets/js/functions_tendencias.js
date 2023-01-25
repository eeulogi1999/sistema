var ten_table,tbi_table;
var url_ten = base_url+"/Utilitarios/getTendencias";
var url_tbi = base_url+"/Utilitarios/getBienesPorc";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#ten_table")) {
        ten_table = $('#ten_table').autoTable({
            "url": url_ten,
            "numerate": true,
            "columns":[
                {"data":"ten_bie",header:"MATERIAL",tipo:'string'},
                {"data":"ten_inv",header:{t:"INVESTING",align:'right'},tipo:'float'},
                {"data":"ten_lme",header:{t:"LME",align:'right'},tipo:'float'},
                {"data":"ten_exp",header:{t:"EXPANCION",align:'right'},tipo:'float'},
                {"data":"ten_opt",header:{t:"OPCIONES",align:'center'},tipo:'string'} 
            ]
        });
    }
    if (document.querySelector("#tbi_table")) {
        tbi_table = $('#tbi_table').autoTable({
            "url": url_tbi,
            "numerate": true,
            "columns":[
                {"data":"bie_codigo",header:"CODIGO",tipo:'string'},
                {"data":"bie_nombre",header:{t:"MATERIAL",align:'right'},tipo:'string'},
                {"data":"bie_ten",header:{t:"BASE PROMEDIO",align:'right'},tipo:'float'},
                {"data":"bie_porc",header:{t:"PORCENTAJE",align:'center'},tipo:'string'},
                {"data":"bie_base",header:{t:"PRECIO",align:'right'},tipo:'float'} 
            ]
        });
    }
});

window.addEventListener('load', async () => {
    if (document.querySelector("#ten_table")) {
        ten_table = await ten_table;
    }
    if (document.querySelector("#tbi_table")) {
        tbi_table = await tbi_table;
    }
    divLoading.style.display = "none";
});


async function setPor(id,e) {
    await set(`bie`,null,{bie_id:id,bie_porc:e.target.value},true); 
    tbi_table.reload()
}