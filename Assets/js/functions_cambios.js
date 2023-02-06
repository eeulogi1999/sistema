var caj_table;
var url_caj = base_url+"/Cajas/getCajas/"+data.caj.caj_tipo;
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#caj_table")) {
        caj_table = $('#caj_table').autoTable({
            "url":url_caj ,
            "numerate": true,
            "columns":[
                {"data":"caj_numero",header:{t:"CODIGO",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"caj_fecha",header:{t:"FECHA",c:'text'},tipo:'string'},
                {"data":"caj_responsable",header:{t:"RESPONSABLE",c:'text'},tipo:'string'},
                {"data":"caj_cue_id.cue_nombre",header:{t:"CUENTA",c:'text'},tipo:'string'},
                {"data":"caj_t1m_id.t1m_descripcion",header:{t:"MEDIO DE PAGO",c:'text'},tipo:'string'},
                {"data":"caj_tce_id.tce_compra",header:{t:"T. C. SUNAT"},tipo:'float'},
                {"data":"caj_observaciones",header:{t:"OBSERVACIONES"},tipo:'text'},
                {"data":"caj_monto",header:{t:"MONTO",align:'right'},tipo:'money',chr:'caj_gt4_id',footer:{ c:"sum" }},
                {"data":"caj_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"caj_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#caj_gt4_id').loadOptions('t4monedas',['gt4_descripcion']);
    $('#caj_cue_id').loadOptions('cuentas',['cue_nombre'],{'cue_status':1});
    $('#caj_t1m_id').loadOptions('t1mediopagos',['t1m_descripcion'],{'t1m_status':1});
    $('#caj_d_cue_id').loadOptions('cuentas',['cue_nombre'],{'cue_status':1});
    $('#caj_d_gt4_id').loadOptions('t4monedas',['gt4_descripcion']);

    $('#set_gtc').change(function (e) {
        var gtc = $('#set_gtc').prop('checked');
        if (gtc) {
            $('#gtc_compra').attr('readonly', true);
            $('#gtc_venta').attr('readonly', true);
            $('#gtc_compra').val("");
            $('#gtc_venta').val("");
        } else {
            $('#gtc_compra').attr('readonly', false);
            $('#gtc_venta').attr('readonly', false);
        }
    });
    $('#caj_fecha').change(function (e) {ftnTcambio(this);});
    $('#caj_monto').change(function (e) {
        $('#caj_montod').val($('#caj_monto').val()*$('#gtc_compra').val());
    });

    
});
window.addEventListener('load', async () => {
    caj_table = await caj_table;
    divLoading.style.display = "none";
});
async function setCaj() {
    var formData = Object.fromEntries(new FormData(document.getElementById("form_caj")));
    if (!$('#set_gtc').prop('checked')) {
        await set('tce',null,{'tce_id':parseInt($('#gtc_compra').attr('data')),'tce_compra':$('#gtc_compra').val(),'tce_venta':$('#gtc_venta').val()},true);
    }
    formData.caj_tce_id = $('#gtc_compra').attr('data');
    var json = formData;
    if (data.caj.caj_tipo != 6 && data.caj.caj_tipo != 7 ) {
        if(formData.caj_cue_id == undefined ){
            swal('Atencion','Seleccione una Cuenta','warning');
            return false;
        }
    }
    if(data.caj.caj_tipo == 5 ){
        if(formData.caj_d_cue_id == undefined ){
            swal('Atencion','Seleccione una Cuenta Destino','warning');
            return false;
        }
    }
    formData.caj_monto = -formData.caj_monto;
    var caj1 = await set('caj',null,formData,true);
    json.caj_cue_id = json.caj_d_cue_id;
    json.caj_gt4_id = json.caj_d_gt4_id;
    json.caj_monto = formData.caj_montod;
    json.caj_caj_id = caj1.caj_id;
    set('caj',null,json);

    
}
async function editCaj(id){
    ftnTcambio(document.querySelector("#caj_fecha"));
}
async function viewCaj(id){
    var res = await view('caj',id,true);
    $('#v_caj_t1m_id').text(res.caj_t1m_id.t1m_descripcion);  
    $('#v_caj_gt4_id').text(res.caj_gt4_id.gt4_descripcion);  
    $('#v_caj_cue_id').text(res.caj_cue_id.cue_nombre);
    $('#v_caj_monto').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.abs(res.caj_monto)));  
 
}

function openModalCajP (pre) {
    var formData = new FormData()
    formData.append('caj_tipo',data.caj.caj_tipo)
    fetch(base_url + '/Cajas/getNumCajas', {method: "POST",body: formData})
    .then(response => response.json())
    .then(response => {
        data.caj.caj_numero = response.caj_numero
    })
    openModal(pre);
    document.querySelector("#caj_fecha").valueAsDate = new Date();
    $("#caj_t1m_id").val(1);
    $("#caj_gt4_id").val(2);
    $("#caj_d_gt4_id").val(1);
    ftnTcambio(document.querySelector("#caj_fecha"));

}

function ftnTcambio(nodefecha) {
    var fecha = $(nodefecha).val();
    tipoCambio = "";
    let gtc = $('#set_gtc').prop('checked');
    if (gtc) {
        fetch(base_url + '/Main/getTcambio/' + fecha)
            .then(response => response.json())
            .then(response => {
                $('#gtc_compra').attr('readonly', true);
                $('#gtc_venta').attr('readonly', true);
                $('#gtc_compra').val(response.tce_gtc_id.gtc_tcompra);
                $('#gtc_compra').attr('data',response.tce_id);
                $('#gtc_venta').val(response.tce_gtc_id.gtc_tventa);
            })
            .catch(error => console.error('Error:', error))
    }
}


