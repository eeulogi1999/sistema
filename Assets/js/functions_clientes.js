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
                {"data":"gcl_gem_id.gem_razonsocial",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gcl_gem_id.gem_direccion",header:{t:"DIRECCION"},tipo:'string'},
                {"data":"gcl_gem_id.gem_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"gcl_correo",header:{t:"CORREO"},tipo:'string'},
                {"data":"gcl_pweb",header:{t:"PAGINA WEB"},tipo:'string'},
                {"data":"gcl_telefono",header:{t:"TELEFONO"},tipo:'string'},
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

    // empresas 
    $('#gcl_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial']);
    $('#new_gem').click(function() {
        $('#set_gem').attr('onclick',"event.preventDefault();setGem()");
        openModal('gem');
    })
    $('#select_gem').click(function() {
        $('#age_gem_id').val(gem_table.getSelectedItem().gem_id)
    })
    $('#tab_gem').click(function() {
        $('#set_gem').attr('onclick',"event.preventDefault();set('gem',['gem_ruc'])");
        $('#modalTable_gem').modal('show');
        setTimeout(() => {
            gem_table.rezise();
            gem_table.select(true);
        }, 220);
    })

});

window.addEventListener('load', async () => {
    gcl_table = await gcl_table;
    divLoading.style.display = "none";
});

async function setGem() {
    var gem = await set('gem',['gem_ruc'],null,true);
    if (gem.status) {
        resetModal('gem');
        $('#gcl_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial']);
        $('#gcl_gem_id').val(gpe.gpe_id)
    }
}