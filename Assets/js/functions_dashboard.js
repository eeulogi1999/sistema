var ten_table,tbi_table,gen_table;
var gen_json = {0:{gen_bie_id:{bie_nombre:'COBRE BRILLANTE'},gen_p:30.31,gen_opt:`<button class="btn btn-danger btn-sm" ><i class="fas fa-trash"></i></button>`}}
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
                {"data":"ten_fecha",header:{t:"ULTIMA ACTUALIZACION",align:'center'},tipo:'string'},
                {"data":"ten_inv",header:{t:"INVESTING",align:'right'},tipo:'float'},
                {"data":"ten_lme",header:{t:"LME",align:'right'},tipo:'float'},
                {"data":"ten_exp",header:{t:"EXPANCION",align:'right'},tipo:'float'},
                {"data":"ten_avg",header:{t:"PROMEDIO",align:'center'},tipo:'float', style:{color:'danger'}},
                {"data":"ten_bas",header:{t:"PRECIO BASE/TN",align:'center'},tipo:'string', style:{color:'danger'}},
                {"data":"ten_tga",header:{t:"USD-SUNAT",align:'center'},tipo:'string', style:{color:'danger'}},
                {"data":"ten_por",header:{t:"%",align:'center'},tipo:'string'},
                {"data":"ten_sal",header:{t:"USD/TN",align:'center'},tipo:'float', style:{color:'danger'}},
                {"data":"ten_sol",header:{t:"SOL/TN",align:'center'},tipo:'money', style:{color:'danger'}}
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
                {"data":"bie_tga",header:{t:"TIPO DE CAMBIO",align:'right'},tipo:'float'},
                {"data":"bie_porc",header:{t:"PORCENTAJE",align:'center'},tipo:'string'},
                {"data":"bie_base",header:{t:"PRECIO",align:'right'},tipo:'float',bg:'success'} 
            ]
        });
    }
    document.querySelector("body").style.overflowY = 'auto';
    $('#gtc_sol').change(function (e){
        e.preventDefault();
        $('#gtc_sol').val(parseFloat(this.value))
        $('#gtc_dol').val((parseFloat(this.value)/data.gtc).toFixed(2))
    })
    $('#gtc_dol').change(function (e){
        e.preventDefault();
        $('#gtc_dol').val(parseFloat(this.value))
        $('#gtc_sol').val((parseFloat(this.value)*data.gtc).toFixed(2))
    })
    if (document.querySelector("#gen_table")) {
        gen_table = $('#gen_table').autoTable({
            "src": 'gen_json',
            "cell":true,
            "gen_id":true,
            "export":false,
            "columns":[
                {"data":"gen_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"gen_p",header:{t:"PRECIO",align:'right'},tipo:'float'},
                {"data":"gen_opt",header:`<button class="btn btn-primary btn-sm" onclick="gen_table.newRow()"><i class="fas fa-plus-circle"></i></button>`,tipo:'string'},
            ],
            copyCellEditOrigin:()=>{}
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
    if (document.querySelector("#gen_table")) {
        gen_table = await gen_table;
        $('#gen_table').parent().height('auto');
    }
    divLoading.style.display = "none";
});
async function setPor(id,e) {
    await set(`bie`,null,{bie_id:id,bie_porc:e.target.value},true); 
    tbi_table.reload()
}
if (document.querySelector("#ten_copper")) {
    Highcharts.getJSON(
        base_url+'/Utilitarios/getChart',
        function (data) {
            Highcharts.chart('ten_copper', {
                chart: {zoomType: 'x'},
                title: {text: 'COBRE',align: 'center'},
                subtitle: {text: document.ontouchstart === undefined ?'Seleccione el area para hacer Zoom' : 'Seleccione para hacer Zoom',align: 'left'},
                xAxis: {type: 'datetime'},
                yAxis: {title: {text: 'KG/USD'}},
                legend: {enabled: false},
                series: [{name: 'KG/USD',data: data.co}]
            });
        }
    );
}
if (document.querySelector("#ten_usd")) {
    Highcharts.getJSON(
        base_url+'/Utilitarios/getChartUSD',
        function (data) {
            Highcharts.chart('ten_usd', {
                chart: {zoomType: 'x'},
                title: {text: 'SOLES / DOLARES',align: 'center'},
                subtitle: {text: document.ontouchstart === undefined ?'Seleccione el area para hacer Zoom' : 'Seleccione para hacer Zoom',align: 'left'},
                xAxis: {type: 'datetime'},
                yAxis: {title: {text: 'KG/USD'}},
                legend: {enabled: false},
                series: [{name: 'SOL/USD',data: data.mer},{name: 'SOL/USD',data: data.sun}]
            });
        }
    );
}
if (document.querySelector("#ten_plomo")) {
    Highcharts.getJSON(
        base_url+'/Utilitarios/getChart',
        function (data) {
            Highcharts.chart('ten_plomo', {
                chart: {zoomType: 'x'},
                title: {text: 'PLOMO',align: 'center'},
                subtitle: {text: document.ontouchstart === undefined ?'Seleccione el area para hacer Zoom' : 'Seleccione para hacer Zoom',align: 'left'},
                xAxis: {type: 'datetime'},
                yAxis: {title: {text: 'KG/USD'}},
                legend: {enabled: false},
                series: [{name: 'KG/USD',data: data.pr}]
            });
        }
    );
}

function setTenTgaBas(a,b,e) {
    e.preventDefault();
    var formData = new FormData();  
    formData.append('a',a);
    formData.append('b',b);
    formData.append('e',e.target.value);
    fetch(base_url + '/Dashboard/setTenTgaBas',{method: "POST",body: formData})
    .then(response => response.json())
    .then(response => {
        if (response.status) {
            ten_table.reload();
        }
    })
    .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))
}

function share(e) {
    e.preventDefault();
    html2canvas(document.querySelector("#gen_table")).then(canvas => {
        const img    = canvas.toDataURL('image/png');   
        document.getElementById('outImg').src = img
    });
}


