var ana_table;
var tre_table;
var url_ana = base_url+"/Analiticas/getAnaliticas/?mes_i="+ data.periodo.replaceAll('"','');
var url_tre = base_url+"/Analiticas/getAnaliticas/?mes_i=2023-01&mes_f=2023-03";

document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#ana_table")) {
        ana_table = $('#ana_table').autoTable({
            "url": url_ana,
            "numerate": true,
            "columns":[
                {"data":"ana_nombre",header:{t:"MATERIAL",align:'center',c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"ana_si",header:{t:"SALDO INICIAL",align:'right'},tipo:'float'},
                {"data":"ana_co",header:{t:"COMPRAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_in",header:{t:"COMPRA TOTAL",align:'right'},style:{bg:'info',color:'white'},render:(r)=>{return parseFloat(r.ana_si) + parseFloat(r.ana_co)},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_min",header:{t:"INVERSION COMPRAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_vn",header:{t:"VENTAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_ve",header:{t:"EXPORTACION",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_ou",header:{t:"VENTAS TOTALES",align:'right'},style:{bg:'success',color:'white'},render:(r)=>{return parseFloat(r.ana_vn) + parseFloat(r.ana_ve)},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_mou",header:{t:"SOLES VENTAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_po",header:{t:"% C/V",align:'right'},style:{bg:'warning'},render:(r)=>{return parseFloat(r.ana_ou) / parseFloat(r.ana_in) *100 },tipo:'float'},
                {"data":"ana_sa",header:{t:"SALDO",align:'right'},style:{bg:'danger',color:'white'},render:(r)=>{return parseFloat(r.ana_in) - parseFloat(r.ana_ou)},tipo:'float'},
            ]
        });
    }
    if (document.querySelector("#tre_table")) {
        tre_table = $('#tre_table').autoTable({
            "url": url_tre,
            "numerate": true,
            "columns":[
                {"data":"ana_nombre",header:{t:"MATERIAL",align:'center',c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"ana_si",header:{t:"SALDO INICIAL",align:'right'},tipo:'float'},
                {"data":"ana_co",header:{t:"COMPRAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_in",header:{t:"COMPRA TOTAL",align:'right'},style:{bg:'info',color:'white'},render:(r)=>{return parseFloat(r.ana_si) + parseFloat(r.ana_co)},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_min",header:{t:"INVERSION COMPRAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_vn",header:{t:"VENTAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_ve",header:{t:"EXPORTACION",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_ou",header:{t:"VENTAS TOTALES",align:'right'},style:{bg:'success',color:'white'},render:(r)=>{return parseFloat(r.ana_vn) + parseFloat(r.ana_ve)},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_mou",header:{t:"SOLES VENTAS",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"ana_po",header:{t:"% C/V",align:'right'},style:{bg:'warning'},render:(r)=>{return parseFloat(r.ana_ou) / parseFloat(r.ana_in) *100 },tipo:'float'},
                {"data":"ana_sa",header:{t:"SALDO",align:'right'},style:{bg:'danger',color:'white'},render:(r)=>{return parseFloat(r.ana_in) - parseFloat(r.ana_ou)},tipo:'float'},
            ]
        });
    }

});

window.addEventListener('load', async () => {
    if (document.querySelector("#ana_table")) {
        ana_table = await ana_table;
        setTimeout(() => {
            ana_table.rezise();
        }, 200);
    }
    if (document.querySelector("#tre_table")) {
        tre_table = await tre_table;
        tre_table.rezise();
    }
    divLoading.style.display = "none";
});

function filterTriCom() {
    tre_table.reload(base_url+"/Analiticas/getAnaliticas/?mes_i="+$('#mes_i').val()+'&mes_f='+$('#mes_f').val());
}



