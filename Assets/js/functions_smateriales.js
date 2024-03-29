var sbi_table;
var url_sbi = base_url+"/Reportes/getHistorico";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#sbi_table")) {
        sbi_table = $('#sbi_table').autoTable({
            "url":url_sbi ,
            "numerate": true,
            "thid": 'sbi_id',
            "columns":[
                {"data":"sbi_bie_id.bie_codigo",header:{t:"CODIGO",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"sbi_bie_id.bie_nombre",header:{t:"MATERIAL",c:'text'},tipo:'string'},
                {"data":"sbi_qc",header:{t:"PESO COMPRA",align:'right'},tipo:'float',style:{bg:'success'},footer:{ c:"sum" }},
                {"data":"sbi_pc",header:{t:"P.U.",align:'right'},tipo:'float'},
                {"data":"sbi_mtc",header:{t:"MONTO COMPRA",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"sbi_qv",header:{t:"PESO VENTA",align:'right'},tipo:'float',style:{bg:'success'},footer:{ c:"sum" }},
                {"data":"sbi_pv",header:{t:"P.U",align:'right'},tipo:'float'},
                {"data":"sbi_mtv",header:{t:"MONTO VENTA",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"sbi_qs",header:{t:"PESO SALDO",align:'right'},tipo:'float',style:{bg:'success'},footer:{ c:"sum" }},
                {"data":"sbi_p",header:{t:"VALOR PROMEDIO",align:'right'},tipo:'float'},
                {"data":"sbi_mts",header:{t:"VALORIZADO TOTAL",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"sbi_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
});

window.addEventListener('load', async () => {
    sbi_table = await sbi_table;
    divLoading.style.display = "none";
});

function openModalHis(id) {
    $('#modalTable_his').modal('show');
    his_table.reload(base_url+"/Reportes/getHistorico/"+id)
    setTimeout(() => {
        his_table.rezise();
    }, 220);
}

function getHistorico(mov_id){
    fetch(base_url+'/Movimientos/getView/'+mov_id)
        .then(response => response.json())
        .then(response => {
            document.querySelector('#bodyModal').innerHTML = response.data;
            $('#titleModalMov').text(response.title);
            $('#modalViewMov').modal('show');
         })
         .catch(error => console.error('Error:', error));
}