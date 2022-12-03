var alm_table;
var url_alm = base_url+"/Main/getAll/alm";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#alm_table")) {
        alm_table = $('#alm_table').autoTable({
            "url": url_alm,
            "numerate": true,
            "thid": 'alm_id',
            "columns":[
                {"data":"alm_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"alm_est_id.est_nombre",header:{t:"ESTABLECIMIENTO",c:'text'},tipo:'string'},
                {"data":"alm_direccion",header:{t:"DIRECCION",c:'text'},tipo:'string'},
                {"data":"alm_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"alm_imagen",header:{t:"LOGO"},tipo:'string'},
                {"data":"alm_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"alm_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#alm_gde_id').loadOptions('departamentos',['gde_departamento']);
    $('#alm_gde_id').change(function(){
        $('#alm_gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$(this).val()});
        $('#alm_gdi_id').html('');
    })
    $('#alm_gpr_id').change(function(){
        $('#alm_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$(this).val()});
    })
});

window.addEventListener('load', async () => {
    alm_table = await alm_table;
    divLoading.style.display = "none";
});