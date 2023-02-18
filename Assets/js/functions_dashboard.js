var ten_table,tbi_table,gen_table,fre_table,con_table;
var gen_json = {}
var fre_json = {}
var con_json = {}

var url_ten = base_url+"/Utilitarios/getTendencias";
var url_tbi = base_url+"/Utilitarios/getBienesPorc";

// var url_gen = base_url+"/Main/getAll/pri";
// var url_fre = base_url+"/Main/getAll/pri";
// var url_con = base_url+"/Main/getAll/pri";

var url_gen = base_url+"/Dashboard/getAll/pri";
var url_fre = base_url+"/Dashboard/getAll/pri";
var url_con = base_url+"/Dashboard/getAll/pri";
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
            "url": url_gen,
            "where":{pri_tipo:1},
            "cell":true,
            'thid':'pri_id',
            "gen_id":true,
            "export":false,
            "columns":[
                {"data":"pri_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"pri_p",header:{t:"PRECIO",align:'right'},tipo:'float'},
                {"data":"pri_fecha",header:"ULT. ACTUL.",tipo:'string'},
                {"data":"pri_gus_id.gus_gpe_id.gpe_nombre",header:"USER",tipo:'string'},
                {"data":"pri_opt",header:{t:`<button class="btn btn-primary btn-sm" onclick="gen_table.newRow()"><i class="fas fa-plus-circle"></i></button>`,align:'center'},tipo:'string'},
            ]
        });
    }
    if (document.querySelector("#fre_table")) {
        fre_table = $('#fre_table').autoTable({
            "url": url_fre,
            "where":{pri_tipo:2},
            "cell":true,
            'thid':'pri_id',
            "gen_id":true,
            "export":false,
            "columns":[
                {"data":"pri_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"pri_p",header:{t:"PRECIO",align:'right'},tipo:'float'},
                {"data":"pri_fecha",header:"ULT. ACTUL.",tipo:'string'},
                {"data":"pri_gus_id.gus_gpe_id.gpe_nombre",header:"USER",tipo:'string'},
                {"data":"pri_opt",header:{t:`<button class="btn btn-primary btn-sm" onclick="fre_table.newRow()"><i class="fas fa-plus-circle"></i></button>`,align:'center'},tipo:'string'},
            ]
        });
    }
    if (document.querySelector("#con_table")) {
        con_table = $('#con_table').autoTable({
            "url": url_con,
            "cell":true,
            "where":{pri_tipo:3},
            'thid':'pri_id',
            "gen_id":true,
            "export":false,
            "columns":[
                {"data":"pri_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"pri_p",header:{t:"PRECIO",align:'right'},tipo:'float'},
                {"data":"pri_fecha",header:"ULT. ACTUL.",tipo:'string'},
                {"data":"pri_gus_id.gus_gpe_id.gpe_nombre",header:"USER",tipo:'string'},
                {"data":"pri_opt",header:{t:`<button class="btn btn-primary btn-sm" onclick="con_table.newRow()"><i class="fas fa-plus-circle"></i></button>`,align:'center'},tipo:'string'},
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
    if (document.querySelector("#gen_table")) {
        gen_table = await gen_table;
        $('#gen_table').css('background-image','url('+base_url+'/.uploads/recurso1.png)')
    }
    if (document.querySelector("#fre_table")) {
        fre_table = await fre_table;
    }
    if (document.querySelector("#con_table")) {
        con_table = await con_table;
        
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

function share(pre,e) {
    e.preventDefault();
    $("#"+pre+"_table tr>*:nth-child(3)").hide()
    $("#"+pre+"_table tr>*:nth-child(4)").hide()
    $("#"+pre+"_table tr>*:nth-child(5)").hide()
    $("#"+pre+"_table").parent().removeClass('table-responsive');
    setTimeout(() => {
        html2canvas(document.querySelector("#"+pre+"_table")).then(async canvas => {
            // var dataURL = canvas.toDataURL();
            var ctx = canvas.getContext("2d");
            // ctx.font = "12px Arial";
            // // ctx.textBaseline = 'middle'; 
            // // ctx.textAlign = 'center'; 
            // // ctx.rotate(-Math.PI/4);
            // ctx.fillText('2022-06-15', 0, canvas.height/2+20);
            // ctx.save(); 
    
            var background = new Image();
            background.src = base_url+"/.uploads/recurso1.png";
            background.onload = function(){
                ctx.drawImage(background,0,0);   
            }
            canvas.toBlob(function(blob) {
                const formData = new FormData();
                formData.append('file', blob, 'filename.png'); 
                fetch(base_url+'/Dashboard/saveImg',{method: "POST",body: formData})
                .then(r => r.json())
                .then(r => {
                    if (r.status) {
                        data.wp = window.open('https://wa.me/?text='+base_url+'/.uploads/'+r.img, '_blank');
    
                        // data.wp = window.open('https://wa.me/+51916075889');
                        // setTimeout(() => {
                        //     data.wp.document.title = 'COSTOM';
                        // }, 100);
                    }
                })
                .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
              });
    
        });
    }, 100);
    $("#"+pre+"_table tr>*:nth-child(3)").show()
    $("#"+pre+"_table tr>*:nth-child(4)").show()
    $("#"+pre+"_table tr>*:nth-child(5)").show()
    $("#"+pre+"_table").parent().addClass('table-responsive');
}

async function setPrePri(where,json,res) {

    if (json.pri_id) {  
        let bd = await get('pri',json.pri_id);
        if (bd.pri_fecha.split(' ')[0] == new Date().toLocaleString('af-ZA').split(' ')[0] && bd.pri_gus_id.gus_id == data.pri.pri_gus_id) {
            json.pri_fecha = new Date().toLocaleString('af-ZA')
            json.pri_gus_id = data.pri.pri_gus_id
        } else {
            delete json.pri_id;
            json.pri_bie_id = bd.pri_bie_id.bie_id;
            json.pri_tipo = bd.pri_tipo;
            json.pri_fecha = new Date().toLocaleString('af-ZA')
        }
    } else {
        where = ['pri_bie_id','pri_tipo']
        json.pri_bie_id = 52
        json.pri_fecha = new Date().toLocaleString('af-ZA')
    }
    return {where,json}
}

