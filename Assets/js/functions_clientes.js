var gcl_table;
var url_gcl = base_url+"/Main/getAll/gcl";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gcl_table")) {
        gcl_table = $('#gcl_table').autoTable({
            "url": url_gcl,
            "numerate": true,
            "thid": 'gcl_id',
            "columns":[
                {"data":"gcl_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gcl_est_id.est_nombre",header:{t:"ESTABLECIMIENTO"},tipo:'string'},
                {"data":"gcl_direccion",header:{t:"DIRECCION",c:'text'},tipo:'string'},
                {"data":"gcl_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"gcl_imagen",header:{t:"LOGO"},tipo:'string'},
                {"data":"gcl_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gcl_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#gcl_gde_id').loadOptions('departamentos',['gde_departamento']);
    $('#gcl_gde_id').change(function(){
        $('#gcl_gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$(this).val()});
        $('#gcl_gdi_id').html('');
    })
    $('#gcl_gpr_id').change(function(){
        $('#gcl_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$(this).val()});
    })
});

window.addEventListener('load', async () => {
    gcl_table = await gcl_table;
    divLoading.style.display = "none";
});