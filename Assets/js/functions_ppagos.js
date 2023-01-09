var ppa_table;
var url_ppa = base_url+"/Main/getAll/ppa";
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
    $('#caj_cue_id').loadOptions('cuentas',['cue_nombre']);
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
    var caj = await set('caj',null,formCaj,true);
    formData.ppa_caj_id = caj.caj_id;
    set('ppa',null,formData);
}