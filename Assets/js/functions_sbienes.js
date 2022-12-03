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
                {"data":"sbi_bie_id.bie_t6m_id.t6m_descripcion",header:{t:"U.M.",c:'text'},tipo:'string'},
                {"data":"sbi_bat",header:{t:"DESCRIPCIÓN",c:'text'},tipo:'string'},
                {"data":"sbi_qs",header:{t:"CANTIDAD",align:'right'},tipo:'float',footer:{ c:"sum" }},
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