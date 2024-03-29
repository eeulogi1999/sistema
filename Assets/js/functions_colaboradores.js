var col_table;
var url_col = base_url+"/Main/getAll/col";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#col_table")) {
        col_table = $('#col_table').autoTable({
            "url": url_col,
            "numerate": true,
            "thid": 'col_id',
            "columns":[
                {"data":"col_gpe_id.gpe_nombre",header:{t:"NOMBRE",c:'text'},tipo:'string'},
                {"data":"col_gpe_id.gpe_apellidos",header:{t:"APELLIDOS",c:'text'},tipo:'string'},
                {"data":"col_gar_id.gar_nombre",header:{t:"AREA"},tipo:'string'},
                {"data":"col_puesto",header:{t:"PUESTO"},tipo:'string'},
                {"data":"col_sbase",header:{t:"SUELDO BASE"},tipo:'money'},
                {"data":"col_est_id.est_nombre",header:{t:"ESTABLECIMIENTO"},tipo:'string'},
                {"data":"col_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"col_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#col_gpe_id').loadOptions('personas', ['gpe_nombre','gpe_apellidos']);
    $('#col_gar_id').loadOptions('areas', ['gar_nombre']);
    $('#col_est_id').loadOptions('establecimientos', ['est_nombre']);
    $("#tab_gpe").click(function(e) {
        $("#modalTable_gpe").modal('show');
        setTimeout(() => {
            gpe_table.rezise();
            gpe_table.select(true);
        }, 220);
    })
    $('#new_gpe').click(function() {
        $('#set_gpe').attr('onclick',"event.preventDefault();setGpe()");
        openModal('gpe');
    })
    $("#tab_gar").click(function(e) {
        $("#modalTable_gar").modal('show');
        setTimeout(() => {
            gar_table.rezise();
            gar_table.select(true);
        }, 220);
    })
    $('#new_gar').click(function() {
        $('#set_gar').attr('onclick',"event.preventDefault();setGar()");
        openModal('gar');
    })
});

window.addEventListener('load', async () => {
    col_table = await col_table;
    divLoading.style.display = "none";
});

async function setGpe() {
    gpe = await set('gpe',null,null,true);
    resetModal('gpe');
    if (gpe.status) {
        await $('#col_gpe_id').loadOptions('personas',['gpe_nombre','gpe_apellidos']);
        $('#col_gpe_id').val(gpe.gpe_id); 
    }
}
async function setGar() {
    gar = await set('gar',null,null,true);
    resetModal('gar');
    if (gar.status) {
        await $('#col_gar_id').loadOptions('areas', ['gar_nombre']);;
        $('#col_gar_id').val(gar.gar_id); 
    }
}

function openModalColC() {
    openModal('col');
    $("#col_est_id").val(1);
    //col_gar_id
    $("#col_puesto").val(''); 
}

async function setPreCol(where,json,res) {
    if (data.colId) {
        let hsbase = JSON.parse(data.colId.col_hsbase)??[];
        hsbase.push({col_sbase:data.colId.col_sbase,col_fecha:new Date().toISOString().slice(0, 10)})
        json.col_hsbase = JSON.stringify(hsbase)
    }
    return {json}; 
}