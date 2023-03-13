var ana_table;
var url_ana = base_url+"/Analiticas/getAnaliticas/"+ data.periodo;
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#ana_table")) {
        ana_table = $('#ana_table').autoTable({
            "url": url_ana,
            "numerate": true,
            "columns":[
                {"data":"ana_nombre",header:{t:"MATERIAL",align:'center',c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"ana_si",header:{t:"SALDO INICIAL",align:'right'},tipo:'float'},
                {"data":"ana_co",header:{t:"COMPRAS",align:'right'},tipo:'float'},
                {"data":"ana_in",header:{t:"COMPRA TOTAL",align:'right'},style:{bg:'info',color:'white'},render:(r)=>{return parseFloat(r.ana_si) + parseFloat(r.ana_co)},tipo:'float'},
                {"data":"ana_min",header:{t:"INVERSION COMPRAS",align:'right'},tipo:'float'},
                {"data":"ana_vn",header:{t:"VENTAS",align:'right'},tipo:'float'},
                {"data":"ana_ve",header:{t:"EXPORTACION",align:'right'},tipo:'float'},
                {"data":"ana_ou",header:{t:"VENTAS TOTALES",align:'right'},style:{bg:'success',color:'white'},render:(r)=>{return parseFloat(r.ana_vn) + parseFloat(r.ana_ve)},tipo:'float'},
                {"data":"ana_mou",header:{t:"SOLES VENTAS",align:'right'},tipo:'float'},
                {"data":"ana_po",header:{t:"% C/V",align:'right'},render:(r)=>{return parseFloat(r.ana_ou) / parseFloat(r.ana_in) *100 },tipo:'float'},

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
    divLoading.style.display = "none";
});




