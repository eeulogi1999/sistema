var gro_table,tpe_table;
var url_gro = base_url+"/Roles/getRoles";
var url_tpe = base_url+"/Roles/getTpermisos";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gro_table")) {
        gro_table = $('#gro_table').autoTable({
            "url": url_gro,
            "numerate": true,
            "thid": 'gro_id',
            "columns":[
                {"data":"gro_nombrerol",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gro_descripcion",header:{t:"DESCRIPCION"},tipo:'string'},
                {"data":"gro_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gro_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    tpe_table = $('#tpe_table').autoTable({
        "url": url_tpe,
        "numerate": true,
        "thid": 'tpe_id',
        "columns":[
            {"data":"gtp_gro_id.gro_descripcion",header:{t:"ROL"},tipo:'string'},
            {"data":"gtp_gmo_id.gmo_descripcion",header:{t:"MODULO"},tipo:'string'},
            {"data":"gtp_r",header:{t:"LEER"    ,align:'center'},tipo:'string'},
            {"data":"gtp_w",header:{t:"AGREGAR" ,align:'center'},tipo:'string'},
            {"data":"gtp_u",header:{t:"EDITAR"  ,align:'center'},tipo:'string'},
            {"data":"gtp_d",header:{t:"ELIMINAR",align:'center'},tipo:'string'}
        ]
    });
});

window.addEventListener('load', async () => {
    gro_table = await gro_table;
    tpe_table = await tpe_table;
    divLoading.style.display = "none";
});


function tpe(id) {
    $('#modal_tpe').modal('show');
    setTimeout(() => {
        tpe_table.reload(url_tpe+'/'+id);
    }, 220);
}