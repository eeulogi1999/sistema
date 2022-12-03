var his_table;
document.addEventListener('DOMContentLoaded',async function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#cie_table")) {
    }
    if (document.querySelector("#his_table")) {
        his_table = await $('#his_table').autoTable({
            "url": base_url+"/Reportes/getHistorico/5,2022-08-01,2022-08-29",
            "numerate": true,
            "columns":[
                {"data":"mov_fechaE",header:{t:"FECHA",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"mov_t10_id.t10_descripcion",header:{t:"DOC",align:'right'},tipo:'string'},
                {"data":"mov_serie",header:{t:"Serie y Num",c:'text'},tipo:'string'},
                {"data":"mov_t12_id.t12_descripcion",header:{t:"OPERAC.",c:'text'},tipo:'string'},
                {"data":"c_q",header:{t:"CANT",align:'right'},tipo:'float',footer:{ c:"sum" }},
                {"data":"c_vu",header:{t:"P.U.",align:'right'},tipo:'float'},
                {"data":"c_importe",header:{t:"M. COMPRA",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"v_q",header:{t:"CANT",align:'right'},tipo:'float',footer:{ c:"sum" }},
                {"data":"v_vu",header:{t:"P.U.",align:'right'},tipo:'float'},
                {"data":"v_importe",header:{t:"C.VENTA",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"s_q",header:{t:"CANT.",align:'right'},tipo:'float'},
                {"data":"s_vu",header:{t:"P.P.",align:'right'},tipo:'float'},
                {"data":"s_importe",header:{t:"M. SALDO",align:'right'},tipo:'money'}
            ]
        });
    }
    
    
});
window.addEventListener('load', async () => {
    his_table = await his_table;
    divLoading.style.display = "none";
});
