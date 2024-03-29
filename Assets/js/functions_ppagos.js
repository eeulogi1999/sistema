var ppa_table;
var url_ppa = base_url+"/Ppagos/getPpagos";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#ppa_table")) {
        ppa_table = $('#ppa_table').autoTable({
            "url": url_ppa,
            "numerate": true,
            "thid": 'ppa_id',
            "columns":[
                {"data":"ppa_tipo",header:{t:"TIPO",c:'text'},tipo:'list'},
                {"data":"ppa_col_id.col_gpe_id.gpe_nombre",header:{t:"NOMBRES",c:'text'},tipo:'string'},
                {"data":"ppa_col_id.col_gpe_id.gpe_apellidos",header:{t:"APELLIDOS",c:'text'},tipo:'string'},
                {"data":"ppa_caj_id.caj_monto",header:{t:"MONTO"},tipo:'money'},
                {"data":"ppa_fecha",header:{t:"FECHA"},tipo:'string'},
                {"data":"ppa_gus_id.gus_gpe_id.gpe_nombre",header:{t:"USUARIO"},tipo:'string'},
                {"data":"ppa_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#ppa_col_id').loadOptions('colaboradores',['col_gpe_id.gpe_nombre']);    
    $('#caj_cue_id').loadOptions('cuentas',['cue_nombre'],{'cue_status':1});
    $('#caj_t1m_id').loadOptions('t1mediopagos',['t1m_descripcion'],{'t1m_status':1});
});

window.addEventListener('load', async () => {
    ppa_table = await ppa_table;
    divLoading.style.display = "none";
});


async function setPpa() {
    var formData = Object.fromEntries(new FormData(document.getElementById("form_ppa")));
    var formCaj = Object.fromEntries(new FormData(document.getElementById("form_caj")));
    formCaj.caj_fecha = formData.ppa_fecha;
    formCaj.caj_monto = -formCaj.caj_monto;
    formCaj.caj_responsable = $('#ppa_col_id').find('option:selected').text();
    formCaj.caj_gus_id = data.ppa.ppa_gus_id;
    if (data.ppaId) {
        formCaj.caj_id = data.ppaId.ppa_caj_id.caj_id
    }
    var caj = await set('caj',null,formCaj,true);
    formData.ppa_caj_id = caj.caj_id;
    if (data.ppaId) {
        formData.ppa_caj_id = data.ppaId.ppa_caj_id.caj_id;
    }
    set('ppa',null,formData);
    data.ppaId = null

}

function getPosPpa() {
    $('#caj_cue_id').val(data.ppaId.ppa_caj_id.caj_cue_id.cue_id)
    $('#caj_t1m_id').val(data.ppaId.ppa_caj_id.caj_t1m_id.t1m_id)
    $('#caj_monto').val(Math.abs(data.ppaId.ppa_caj_id.caj_monto))
}

function delPpa(id) {
    fetch(base_url + '/Ppagos/delPpa/'+id)
    .then(response => response.json())
    .then(response => {
        if(response.status){
            swal("Exito", response.msg , "success");
        }else{
            swal("Error", response.msg , "error");
        }
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}

function openModalPpa() {
    data.ppaId = null
}