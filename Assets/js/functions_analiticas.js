var ana_table,tre_table;
var com_table,lis_table;
var url_com = base_url+"/Analiticas/getComVentas"
var url_lis = base_url+"/Analiticas/getLisComVentas"

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
    if (document.querySelector("#com_table")) {
        com_table = $('#com_table').autoTable({
            "url": url_com,
            "numerate": true,
            "columns":[
                {"data":"mov_age_id",header:{t:"AGENTE",align:'center',c:'text'},
                render:(r)=>r.mov_age_id.age_gpe_id?.gpe_nombre??r.mov_age_id.age_gem_id?.gem_razonsocial,
                tipo:'string',footer:"TOTALES"},
                {"data":"mov_total",header:{t:"TOTAL",align:'center'},tipo:'money',footer:{c:'sum'}}
            ]
        });
    }
    if (document.querySelector("#lis_table")) {
        lis_table = $('#lis_table').autoTable({
            "url": url_lis,
            "numerate": true,
            "columns":[
                {"data":"mde_bie_id.bie_nombre",header:{t:"MATERIAL",align:'center',c:'text'}, tipo:'string',footer:"TOTALES"},
                {"data":"mde_total",header:{t:"TOTAL",align:'center'},tipo:'money',footer:{c:'sum'}}
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
    if (document.querySelector("#com_table")) {
        com_table = await com_table;
        com_table.rezise();
    }
    if (document.querySelector("#lis_table")) {
        lis_table = await lis_table;
        lis_table.rezise();
    }
    divLoading.style.display = "none";
});

function filterTriCom() {
    tre_table.reload(base_url+"/Analiticas/getAnaliticas/?mes_i="+$('#mes_i').val()+'&mes_f='+$('#mes_f').val());
}



