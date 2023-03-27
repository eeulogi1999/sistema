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
                {"data":"age_created",header:{t:"INICIO DE OPERACIONES"},render:(r)=>{return r.age_created.split(' ')[0]}},
                {"data":"age_options",header:"ACCION",tipo:'string'}
            ]
        }); //'JSON_OVERLAPS(gem_gcl_id,'+"'"+data.gcl_id+"'"+')'
    }  //JSON_EXTRACT(`gpe_gcl_id`,'$[0]')=3 OR JSON_EXTRACT(`gpe_gcl_id`,'$[1]')=3
    $('#age_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial'],{gem_status:1,custom:'JSON_EXTRACT(gem_gcl_id,"$[0]") = '+data.gcl_id+' OR JSON_EXTRACT(gem_gcl_id,"$[1]") ='+data.gcl_id});
    $('#age_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos'],{gpe_status:1,custom:'JSON_EXTRACT(gpe_gcl_id,"$[0]") = '+data.gcl_id+' OR JSON_EXTRACT(gpe_gcl_id,"$[1]") ='+data.gcl_id});
    $('#age_gt4_id').loadOptions('t4monedas',['gt4_sunat']);
    
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

    $('#select_gem').click(async function() {
        await $('#age_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial'],{gem_status:1,custom:'JSON_EXTRACT(gem_gcl_id,"$[0]") = '+data.gcl_id+' OR JSON_EXTRACT(gem_gcl_id,"$[1]") ='+data.gcl_id});
        $('#age_gem_id').val(gem_table.getSelectedItem().gem_id)
    })
    $('#select_gpe').click(async function() {
        await  $('#age_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos'],{gpe_status:1,custom:'JSON_EXTRACT(gpe_gcl_id,"$[0]") = '+data.gcl_id+' OR JSON_EXTRACT(gpe_gcl_id,"$[1]") ='+data.gcl_id});
        $('#age_gpe_id').val(gpe_table.getSelectedItem().gpe_id)
    })
    
    $('#tab_gem').click(function() {
        $('#set_gem').attr('onclick',"event.preventDefault();event.stopPropagation();set('gem')");
        $('#modalTable_gem').modal('show');
        setTimeout(() => {
            gem_table.rezise();
            gem_table.select(true);
        }, 220);
    })
    $('#tab_gpe').click(function() {
        $('#set_gpe').attr('onclick',"event.preventDefault();event.stopPropagation();set('gpe')");
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
    var form = Object.fromEntries(new FormData(document.getElementById("form_gem")));
    form.gem_gcl_id = JSON.stringify([parseInt(data.gcl_id)]);
    if (form.gem_ruc.substring(0, 2)  != '20' && form.gem_ruc.substring(0, 2)  != '10') {
        var gem = await set('gem',null,form,true);
    } else {
        var gem = await set('gem',['gem_ruc'],form,true);
    }
    if (gem.status) {
        resetModal('gem');
        await $('#age_gem_id').loadOptions('empresas',['gem_ruc','gem_razonsocial'],{gem_status:1,custom:'JSON_OVERLAPS(gem_gcl_id,'+"'"+data.gcl_id+"'"+')'});
        $('#age_gem_id').val(gem.gem_id)
    }
}
async function setGpe() {
    var form = Object.fromEntries(new FormData(document.getElementById("form_gpe")));
    form.gpe_gcl_id = JSON.stringify([parseInt(data.gcl_id)]);
    if (form.gpe_gt2_id == 1) {
        var gpe = await set('gpe',null,form,true);
    }else{
        var gpe = await set('gpe',['gpe_identificacion','gpe_gt2_id'],form,true);
    }
    if (gpe.status) {
        resetModal('gpe');
        await $('#age_gpe_id').loadOptions('personas',['gpe_identificacion','gpe_nombre','gpe_apellidos'],{gpe_status:1,custom:'JSON_OVERLAPS(gpe_gcl_id,'+"'"+data.gcl_id+"'"+')'});
        $('#age_gpe_id').val(gpe.gpe_id)
    }
}
