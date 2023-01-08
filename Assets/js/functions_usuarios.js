var gus_table,gac_table;
var url_gus = base_url+"/Usuarios/getUsuarios";
var url_gac = base_url+"/Usuarios/getGaccesos";
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
                {"data":"gus_gpe_id.gpe_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gus_user",header:{t:"USUARIO"},tipo:'string'},
                {"data":"gus_gar_id.gar_nombre",header:{t:"AREA"},tipo:'string'},
                {"data":"gus_gro_id.gro_nombrerol",header:{t:"ROL"},tipo:'string'},
                {"data":"gus_gpe_id.gpe_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"gus_imagen",header:{t:"FOTO"},tipo:'string'},
                {"data":"gus_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gus_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#gac_table")) {
        gac_table = $('#gac_table').autoTable({
            "url": url_gac,
            "numerate": true,
            "thid": 'gac_id',
            "columns":[
                {"data":"gac_gus_id.gus_gpe_id.gpe_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gac_gus_id.gus_gpe_id.gpe_apellidos",header:{t:"APELLIDOS"},tipo:'string'},
                {"data":"gac_gcl_id.gcl_gem_id.gem_razonsocial",header:{t:"EMPRESA"},tipo:'string'},
                {"data":"gac_use",header:{t:"ACCESO" ,align:'center'},tipo:'string'}
            ]
        });
    }
    $('#gus_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos']);
    $('#new_gpe').click(function() {
        $('#set_gpe').attr('onclick',"event.preventDefault();setGpe()");
        openModal('gpe');
    })
    $('#select_gpe').click(function() {
        $('#age_gpe_id').val(gpe_table.getSelectedItem().gpe_id)
    })
    $('#tab_gpe').click(function() {
        $('#set_gpe').attr('onclick',"event.preventDefault();set('gpe',['gpe_identificacion'])");
        $('#modalTable_gpe').modal('show');
        setTimeout(() => {
            gpe_table.rezise();
            gpe_table.select(true);
        }, 220);
    })

    $('#gus_gar_id').loadOptions('areas',['gar_nombre']);
    $('#new_gar').click(function() {
        $('#set_gar').attr('onclick',"event.preventDefault();setGar()");
        openModal('gar');
    })
    $('#select_gar').click(function() {
        $('#gus_gar_id').val(gar_table.getSelectedItem().gar_id)
    })
    $('#tab_gar').click(function() {
        $('#set_gar').attr('onclick',"event.preventDefault();set('gar',['gar_nombre'])");
        $('#modalTable_gar').modal('show');
        setTimeout(() => {
            gar_table.rezise();
            gar_table.select(true);
        }, 220);
    })

    $('#gus_gro_id').loadOptions('roles',['gro_nombrerol']);
    $('#new_gro').click(function() {
        $('#set_gro').attr('onclick',"event.preventDefault();setGro()");
        openModal('gro');
    })
    $('#select_gro').click(function() {
        $('#age_gro_id').val(gro_table.getSelectedItem().gro_id)
    })
    $('#tab_gro').click(function() {
        $('#set_gro').attr('onclick',"event.preventDefault();set('gro',['gro_nombrerol'])");
        $('#modalTable_gro').modal('show');
        setTimeout(() => {
            gro_table.rezise();
            gro_table.select(true);
        }, 220);
    })

    $('#gus_gcl_id').loadOptions('clientes',['gcl_gem_id.gem_razonsocial']);
    $('#new_gcl').click(function() {
        $('#set_gcl').attr('onclick',"event.preventDefault();setGcl()");
        openModal('gcl');
    })
    $('#select_gcl').click(function() {
        $('#age_gcl_id').val(gcl_table.getSelectedItem().gcl_id)
    })
    $('#tab_gcl').click(function() {
        $('#set_gcl').attr('onclick',"event.preventDefault();set('gcl',['gcl_gem_id'])");
        $('#modalTable_gcl').modal('show');
        setTimeout(() => {
            gcl_table.rezise();
            gcl_table.select(true);
        }, 220);
    })


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
    gac_table = await gac_table;
    divLoading.style.display = "none";
});

async function setGpe() {
    var gpe = await set('gpe',['gpe_identificacion'],null,true);
    if (gpe.status) {
        resetModal('gpe');
        $('#age_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos']);
        $('#age_gpe_id').val(gpe.gpe_id)
    }
}

async function setGar() {
    var gar = await set('gar',['gar_nombre'],null,true);
    if (gar.status) {
        resetModal('gar');
        $('#gus_gar_id').loadOptions('areas',['gar_nombre']);
        $('#gus_gar_id').val(gar.gar_id)
    }
}

async function setGro() {
    var gro = await set('gro',['gro_nombrerol'],null,true);
    if (gro.status) {
        resetModal('gro');
        $('#gus_gro_id').loadOptions('roles',['gro_nombrerol']);
        $('#gus_gro_id').val(gro.gro_id)
    }
}

async function setGcl() {
    var gcl = await set('gcl',['gcl_gem_id'],null,true);
    if (gcl.status) {
        resetModal('gcl');
        $('#gus_gcl_id').loadOptions('clientes',['gcl_gem_id.gem_razonsocial']);
        $('#gus_gcl_id').val(gcl.gcl_id)
    }
}

function gac(id) {
    $('#modal_gac').modal('show');
    setTimeout(() => {
        gac_table.reload(url_gac+'/'+id);
    }, 220);
}