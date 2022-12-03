var age_table;
var url_age = base_url+"/Agentes/getAgentes/"+ data.age_tipo;
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#age_table")) {
        age_table = $('#age_table').autoTable({
            "url": url_age,
            "numerate": true,
            "thid": 'age_id',
            "columns":[
                {"data":"age_tipo",header:{t:"TIPO"},tipo:'string',footer:"TOTALES"},
                {"data":"age_ide",header:{t:"RUC/DNI"},tipo:'string'},
                {"data":"age_nombre",header:{t:"NOMBRE/RAZON SOCIAL",c:'text'},tipo:'string'},
                {"data":"age_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"age_direccion",header:{t:"DIRECCION"},tipo:'string'},
                {"data":"age_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"age_options",header:"ACCION",tipo:'string'}
            ]
        });
    }
    $('#age_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial']);
    $('#age_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos']);
    
    $('input:radio[name=age_t]').change(function() {
        if ($(this).val()=='gem_v') {
            $('#gem_v').show();
            $('#gpe_v').hide();
        } else {
            $('#gem_v').hide();
            $('#gpe_v').show();
        }
    });
    $('#new_gem').click(function() {
        $('#set_gem').attr('onclick',"event.preventDefault();setGem()");
        openModal('gem');
    })
    $('#new_gpe').click(function() {
        $('#set_gpe').attr('onclick',"event.preventDefault();setGpe()");
        openModal('gpe');
    })

    $('#select_gem').click(function() {
        $('#age_gem_id').val(gem_table.getSelectedItem().gem_id)
    })
    $('#select_gpe').click(function() {
        $('#age_gpe_id').val(gpe_table.getSelectedItem().gpe_id)
    })
    
    $('#tab_gem').click(function() {
        $('#set_gem').attr('onclick',"event.preventDefault();set('gem',['gem_ruc'])");
        $('#modalTable_gem').modal('show');
        setTimeout(() => {
            gem_table.rezise();
            gem_table.select(true);
        }, 220);
    })
    $('#tab_gpe').click(function() {
        $('#set_gpe').attr('onclick',"event.preventDefault();set('gpe',['gpe_identificacion'])");
        $('#modalTable_gpe').modal('show');
        setTimeout(() => {
            gpe_table.rezise();
            gpe_table.select(true);
        }, 220);
    })
});
window.addEventListener('load', async () => {
    age_table = await age_table;
    divLoading.style.display = "none";
});

async function setGem() {
    var gem = await set('gem',['gem_ruc'],null,true);
    if (gem.status) {
        resetModal('gem');
        $('#age_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial']);
        $('#age_gem_id').val(gem.gem_id)
    }
}
async function setGpe() {
    var gpe = await set('gpe',['gpe_identificacion'],null,true);
    console.log(gpe);
    if (gpe.status) {
        resetModal('gpe');
        $('#age_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos']);
        $('#age_gpe_id').val(gpe.gpe_id)
    }
}
