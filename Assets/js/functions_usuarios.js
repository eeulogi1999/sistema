var gus_table;
var url_gus = base_url+"/Main/getAll/gus";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gus_table")) {
        gus_table = $('#gus_table').autoTable({
            "url": url_gus,
            "numerate": true,
            "thid": 'gus_id',
            "columns":[
                {"data":"gus_gpe_id.gpe_gt2_id.gt2_descripcion",header:{t:"DOC"},tipo:'string'},
                {"data":"gus_gpe_id.gpe_identificacion",header:{t:"IDENTIFICACION"},tipo:'string'},
                {"data":"gus_gpe_id.gpe_nombre",header:{t:"NOMBRE",c:'text'},tipo:'string'},
                {"data":"gus_user",header:{t:"USUARIO"},tipo:'string'},
                {"data":"gus_gar_id.gar_nombre",header:{t:"AREA"},tipo:'string'},
                {"data":"gus_gro_id.gro_nombrerol",header:{t:"ROL",c:'text'},tipo:'string'},
                {"data":"gus_gpe_id.gpe_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"gus_imagen",header:{t:"FOTO"},tipo:'string'},
                {"data":"gus_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gus_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#gus_gde_id').loadOptions('departamentos',['gde_departamento']);
    $('#gus_gde_id').change(function(){
        $('#gus_gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$(this).val()});
        $('#gus_gdi_id').html('');
    })
    $('#gus_gpr_id').change(function(){
        $('#gus_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$(this).val()});
    })
});

window.addEventListener('load', async () => {
    gus_table = await gus_table;
    divLoading.style.display = "none";
});