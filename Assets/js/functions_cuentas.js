var cue_table,cue_i,cue_e,cue_g;
var url_cue = base_url+"/Cuentas/getCuentas";
var url_i = base_url+"/Cajas/getI/1";
var url_e = base_url+"/Cajas/getE/1";
var url_g = base_url+"/Cajas/getG/1";
document.addEventListener('DOMContentLoaded',function () {
    if (document.querySelector("#cue_table")) {
        divLoading.style.display = "flex";
        cue_table = $('#cue_table').autoTable({
            "url":url_cue ,
            "numerate": true,
            "th1d": 'cue_id',
            "columns":[
                {"data":"cue_nombre",header:{t:"NOMBRE",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"cue_saldo",header:{t:"SALDO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"cue_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"cue_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#cue_i")) {
        cue_i = $('#cue_i').autoTable({
            "url":url_i ,
            "numerate": true,
            "columns":[
                {"data":"caj_fecha",header:{t:"FECHA",c:'text'},tipo:'string'},
                {"data":"caj_age_id.age_nombre",header:{t:"AGENTE",c:'text'},tipo:'string'},
                {"data":"caj_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        }); 
    }
    if (document.querySelector("#cue_e")) {
        cue_e = $('#cue_e').autoTable({
            "url":url_e ,
            "numerate": true,
            "columns":[
                {"data":"caj_fecha",header:{t:"FECHA",c:'text'},tipo:'string'},
                {"data":"caj_age_id.age_nombre",header:{t:"AGENTE",c:'text'},tipo:'string'},
                {"data":"caj_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        }); 
    }
    if (document.querySelector("#cue_g")) {
        cue_g = $('#cue_g').autoTable({
            "url":url_g ,
            "numerate": true,
            "columns":[
                {"data":"caj_fecha",header:{t:"FECHA",c:'text',style:{miw:80}},tipo:'string'},
                {"data":"caj_tga_id.tga_nombre",header:{t:"T. GASTO",c:'text'},tipo:'string'},
                {"data":"caj_responsable",header:{t:"RESPONSABLE",c:'text'},tipo:'string'},
                {"data":"caj_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{ c:"sum" }}
            ]
        }); 
    }
    if (document.querySelector("#cue_gt4_id")) {
        $('#cue_gt4_id').loadOptions('t4monedas',['gt4_descripcion']);
    }
    

});

window.addEventListener('load', async () => {
    cue_table = await cue_table;
    cue_i = await cue_i;
    cue_e = await cue_e;
    cue_g = await cue_g;
    divLoading.style.display = "none";
});

function viewCue(id) {
    $('#modalViewCue').modal('show');
    // mvb_cue.reload(base_url+"/Cajas/getDetalles/"+id)
    // setTimeout(() => {
    //     mvb_cue.rezise();
    //     mvb_cue.select(true);
    // }, 220);

    cue_i.reload(base_url+"/Cajas/getI/"+id)
    setTimeout(() => {
        cue_i.rezise();
    }, 220);
    cue_e.reload(base_url+"/Cajas/getE/"+id)
    setTimeout(() => {
        cue_e.rezise();
    }, 220);
    cue_g.reload(base_url+"/Cajas/getG/"+id)
    setTimeout(() => {
        cue_g.rezise();
    }, 220);
}