var caj_table;
if (data.caj==undefined) {
    data.caj = {caj_tipo:1};
}
var url_caj = base_url+"/Cajas/getCajas/"+data.caj.caj_tipo;
var col_caj = [
    {"data":"caj_numero",header:{t:"CODIGO",c:'text'},tipo:'string',footer:"TOTALES"},
    {"data":"caj_fecha",header:{t:"FECHA",c:'text'},tipo:'string'},
    {"data":"caj_age_ide",header:{t:"AGENTE",c:'text'},tipo:'string'},
    {"data":"caj_responsable",header:{t:"RESPONSABLE",c:'text'},tipo:'string'},
    {"data":"caj_tga_id.tga_nombre",header:{t:"TIPO GASTO",c:'text'},tipo:'string'},
    {"data":"caj_cue_id.cue_nombre",header:{t:"CUENTA",c:'text'},tipo:'string'},
    {"data":"caj_t1m_id.t1m_descripcion",header:{t:"MEDIO DE PAGO",c:'text'},tipo:'string'},
    {"data":"caj_observaciones",header:{t:"OBSERVACIONES"},tipo:'text'},
    {"data":"caj_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{ c:"sum" }},
    {"data":"caj_status",header:{t:"ESTADO"},tipo:'string'},
    {"data":"caj_options",header:"ACCIONES",tipo:'string'}
];
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#caj_table")) {
        switch (data.caj.caj_tipo) {
            case 0:  //saldo de cuentas
                col_caj.splice(2,1);
                col_caj.splice(3,1);
                col_caj.splice(2,1);
                col_caj.splice(3,1);
                col_caj.splice(3,1);
                col_caj.splice(4,1);
                break;
            case 2:  //egresos
                col_caj.splice(3,1);
                col_caj.splice(3,1);
                break;
            case 1:  //ingresos
                col_caj.splice(3,1);
                col_caj.splice(3,1);
                break;
            case 3:    //gastos
                col_caj.splice(2,1);
                break;
            case 4:   //ingresos adicionales
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                break;
            case 5:   //movimeintos internos 
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                break;
            case 6:   //movimeintos internos 
                col_caj.splice(0,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                break;
            case 7:   //movimeintos internos 
                col_caj.splice(0,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                col_caj.splice(2,1);
                break;
            default:
                break;
        }
        caj_table = $('#caj_table').autoTable({
            "url":url_caj ,
            "numerate": true,
            "columns":col_caj
        });
    }
    $('#caj_gt4_id').loadOptions('t4monedas',['gt4_descripcion']);
    $('#caj_cue_id').loadOptions('cuentas',['cue_nombre']);
    $('#caj_t1m_id').loadOptions('t1mediopagos',['t1m_descripcion'],{'t1m_status':1});

    if (document.querySelector("#caj_age_id")) {
        $("#new_age").click(function(e) {
            $("#modalTable_age").modal('show');
            setTimeout(() => {
                age_table.rezise();
                age_table.select(true);
            }, 220);
        })
        $("#select_age").click(function(e) {
            $('#caj_age_id').children().attr('value',age_table.getSelectedItem().age_id);
            $('#caj_age_id').children().text(age_table.getSelectedItem().age_ide+' - '+age_table.getSelectedItem().age_nombre);
        })
    }

    //document.querySelector("#periodo").valueAsDate = new Date();
    if (data.caj.caj_tipo==3) {
        $('#caj_tga_id').loadOptions('tgastos',['tga_nombre']);
    }
    if (data.caj.caj_tipo==5) {
        $('#caj_d_cue_id').loadOptions('cuentas',['cue_nombre']);
    }
    $('#caj_pdf').click(function(e) {
        var formData = new FormData()
        let html = new Blob([$('#content_pdf').html()], {type: "text/html"});
        formData.append('html',new File([html],'html.html')); 
        fetch(base_url + '/Main/htmlPdf', {method: "POST",body: formData})
        .then(response => response.json())
        .then(r => {
            window.open(base_url+'/Assets/pdf/'+r.name, '_blank');
        })
        .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    })
});
window.addEventListener('load', async () => {
    caj_table = await caj_table;
    divLoading.style.display = "none";
});
async function setCaj() {
    var formData = Object.fromEntries(new FormData(document.getElementById("form_caj")));
    var json = formData;
    if (data.caj.caj_tipo != 6 && data.caj.caj_tipo != 7 ) {
        if(formData.caj_cue_id == undefined ){
            swal('Atencion','Seleccione una Cuenta','warning');
            return false;
        }
    }
    if(data.caj.caj_tipo == 1 || data.caj.caj_tipo == 2 ){
        if(parseInt(formData.caj_age_id) == 0 ){
            swal('Atencion','Seleccione un Agente','warning');
            return false;
        }  
    }
    if(data.caj.caj_tipo == 3 ){
        if(formData.caj_tga_id == undefined ){
            swal('Atencion','Seleccione un tipo de Gasto','warning');
            return false;
        } 
    }
    if(data.caj.caj_tipo == 5 ){
        if(formData.caj_d_cue_id == undefined ){
            swal('Atencion','Seleccione una Cuenta Destino','warning');
            return false;
        }
    }
    if (data.caj.caj_tipo == 2 || data.caj.caj_tipo == 3 || data.caj.caj_tipo == 5 || data.caj.caj_tipo == 6) {   //add  
        formData.caj_monto = - parseFloat($('#caj_monto').val());
    }
    if (data.caj.caj_tipo == 5) {
        var caj1 = await set('caj',null,formData,true);
        json.caj_cue_id = json.caj_d_cue_id;
        json.caj_monto = -1*formData.caj_monto;
        json.caj_caj_id = caj1.caj_id;
        set('caj',null,json);
    }else{
        set('caj',null,formData); 
    }
    
}
async function editCaj(id){
    var res = await edit('caj',id,true); 
    switch (data.caj.caj_tipo) {
        case 0:      //saldo de cuentas
            $('#v_gasto').hide();
            $('#caj_age_id').parent().hide();
            $('#caj_t1m_id').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            break;
        case 2:  //egresos
            $('#caj_monto').val(-res.caj_monto)
            $('#caj_age_id').children().attr('value',res.caj_age_id.age_id);
            var tex = (res.caj_age_id.age_gem_id == null)?res.caj_age_id.age_gpe_id.gpe_nombre+' '+res.caj_age_id.age_gpe_id.gpe_apellidos:res.caj_age_id.age_gem_id.gem_razonsocial;
            $('#caj_age_id').children().text(tex);
            setTimeout(() => {
                $('#caj_age_id').val(res.caj_age_id.age_id); 
            }, 250); 
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            break;
        case 1:  //ingresos
            $('#caj_age_id').children().attr('value',res.caj_age_id.age_id);
            var tex = (res.caj_age_id.age_gem_id == null)?res.caj_age_id.age_gpe_id.gpe_nombre+' '+res.caj_age_id.age_gpe_id.gpe_apellidos:res.caj_age_id.age_gem_id.gem_razonsocial;
            $('#caj_age_id').children().text(tex);
            setTimeout(() => {
                $('#caj_age_id').val(res.caj_age_id.age_id); 
            }, 250); 
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            break;
        case 3:    //gastos
            $('#caj_monto').val(-res.caj_monto)
            $('#caj_d_cue_id').parent().hide();
            $('#caj_age_id').parent().hide();
            break;
        case 4:   //ingresos adicionales
            $('#caj_age_id').parent().hide();
            $('#caj_tga_id').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            break;
        case 5:   //movimeintos internos 
            $('#caj_age_id').parent().hide();
            $('#caj_tga_id').parent().hide();
            break;
        case 6:   //ingresos adicionales
            var tex = (res.caj_age_id.age_gem_id == null)?res.caj_age_id.age_gpe_id.gpe_nombre+' '+res.caj_age_id.age_gpe_id.gpe_apellidos:res.caj_age_id.age_gem_id.gem_razonsocial;
            $('#caj_age_id').children().text(tex);
            setTimeout(() => {
                $('#caj_age_id').val(res.caj_age_id.age_id); 
            }, 250); 
            $('#caj_monto').val(-res.caj_monto)
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();

            $('#caj_cue_id').parent().hide();
            $('#caj_t1m_id').parent().hide();
            break;
        case 7:   //movimeintos internos 
            var tex = (res.caj_age_id.age_gem_id == null)?res.caj_age_id.age_gpe_id.gpe_nombre+' '+res.caj_age_id.age_gpe_id.gpe_apellidos:res.caj_age_id.age_gem_id.gem_razonsocial;
            $('#caj_age_id').children().text(tex);
            setTimeout(() => {
                $('#caj_age_id').val(res.caj_age_id.age_id); 
            }, 250); 
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();

            $('#caj_cue_id').parent().hide();
            $('#caj_t1m_id').parent().hide();
            break;
        default:
            break;
    }    
}

async function viewCaj(id,tipo=null){
    if (tipo!=null) {
        data.caj = {caj_tipo:tipo};
    }
    var res = await view('caj',id,true);
    $('#v_caj_t1m_id').text(res.caj_t1m_id.t1m_descripcion);  
    $('#v_caj_gt4_id').text(res.caj_gt4_id.gt4_descripcion);  
    $('#v_caj_cue_id').text(res.caj_cue_id.cue_nombre);
    $('#v_caj_gus_id').text((res.caj_gus_id)?res.caj_gus_id.gus_gpe_id.gpe_nombre:''); 
    $('#v_caj_monto').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.abs(res.caj_monto)));  
    switch (data.caj.caj_tipo) {
        case 0:      //saldo de cuentas
            $('#v_v_gasto').hide();
            $('#v_caj_age_id').parent().hide();
            $('#v_caj_t1m_id').parent().hide();
            $('#v_caj_d_cue_id').parent().hide();
            break;
        case 2:  //egresos
            var tex = (res.caj_age_id.age_gem_id == null)?res.caj_age_id.age_gpe_id.gpe_nombre:res.caj_age_id.age_gem_id.gem_razonsocial;
            $('#v_caj_age_id').text(tex);  
            $('#v_caj_tga_id').parent().hide();
            $('#v_caj_responsable').parent().hide();
            $('#v_caj_d_cue_id').parent().hide();
            $('#v_caj_tipo').text('EGRESO');
            break;
        case 1:  //ingresos
            var tex = (res.caj_age_id.age_gem_id == null)?res.caj_age_id.age_gpe_id.gpe_nombre:res.caj_age_id.age_gem_id.gem_razonsocial;
            $('#v_caj_age_id').text(tex);  
            $('#v_caj_tga_id').parent().hide();
            $('#v_caj_responsable').parent().hide();
            $('#v_caj_d_cue_id').parent().hide();
            $('#v_caj_tipo').text('INGRESO');
            break;
        case 3:    //gastos
            $('#v_caj_d_cue_id').parent().hide();
            $('#v_caj_age_id').parent().hide();
            $('#v_caj_tga_id').text(res.caj_tga_id.tga_nombre);
            $('#v_caj_tipo').text('GASTO');
            break;
        case 4:   //ingresos adicionales
            $('#v_caj_age_id').parent().hide();
            $('#v_caj_tga_id').parent().hide();
            $('#v_caj_d_cue_id').parent().hide();
            $('#v_caj_tipo').text('INGRESOS OTROS');
            break;
        case 5:   //movimeintos internos 
            $('#v_caj_age_id').parent().hide();
            $('#v_caj_tga_id').parent().hide();
            break;
        case 6:   //ingresos adicionales
            $('#v_caj_tga_id').parent().hide();
            $('#v_caj_d_cue_id').parent().hide();
            $('#v_caj_responsable').parent().hide();
            $('#v_caj_tipo').text('CASTIGO');
            break;
        case 7:   //movimeintos internos 
            $('#v_caj_tga_id').parent().hide();
            $('#v_caj_d_cue_id').parent().hide();
            $('#v_caj_responsable').parent().hide();
            $('#v_caj_tipo').text('PREMIO');
            break;
        default:
            break;
    }   
}

function openModalCaj(pre) {
    var formData = new FormData()
    formData.append('caj_tipo',data.caj.caj_tipo)
    fetch(base_url + '/Cajas/getNumCajas', {method: "POST",body: formData})
    .then(response => response.json())
    .then(response => {
        data.caj.caj_numero = response.caj_numero
    })
    openModal(pre);
    document.querySelector("#caj_fecha").valueAsDate = new Date();
    $("#caj_gt4_id").val(1);
    $("#caj_t1m_id").val(8);
    switch (data.caj.caj_tipo) {
        case 0:      //saldo de cuentas
            $('#v_gasto').hide();
            $('#caj_age_id').parent().hide();
            $('#caj_t1m_id').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            break;
        case 2:  //egresos
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            $('#caj_age_id').children().attr('value',0);
            $('#caj_age_id').children().text('Seleccione');
            break;
        case 1:  //ingresos
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            $('#caj_age_id').children().attr('value',0);
            $('#caj_age_id').children().text('Seleccione');
            break;
        case 3:    //gastos
            $('#caj_d_cue_id').parent().hide();
            $('#caj_age_id').parent().hide();
            break;
        case 4:   //ingresos adicionales
            $('#caj_age_id').parent().hide();
            $('#caj_tga_id').parent().hide();
            $('#caj_d_cue_id').parent().hide();
            break;
        case 5:   //movimeintos internos 
            $('#caj_age_id').parent().hide();
            $('#caj_tga_id').parent().hide();
            break;
        case 6:   //ingresos adicionales
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();

            $('#caj_cue_id').parent().hide();
            $('#caj_t1m_id').parent().hide();
            break;
        case 7:   //movimeintos internos 
            $('#caj_tga_id').parent().hide();
            $('#caj_responsable').parent().hide();
            $('#caj_d_cue_id').parent().hide();

            $('#caj_cue_id').parent().hide();
            $('#caj_t1m_id').parent().hide();
            break;
        default:
            break;
    }

}


