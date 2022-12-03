var bat;
var bat_json = {};
var i = 1;
var bie_table;
var url_bie = base_url+"/Bienes/getBienes";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#bie_table")) {
        bie_table = $('#bie_table').autoTable({
            "url":url_bie ,
            "tree": true,
            "thid": 'bie_id',
            "columns":[
                {"data":"bie_nro",header:{t:"#"},tipo:'string'},
                //{"data":"bie_id",header:{t:"CLAVE",c:'text'},tipo:'string'},
                {"data":"bie_codigo",header:{t:"CODIGO",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"bie_nombre",header:{t:"BIEN",c:'text'},tipo:'string'},
                {"data":"bie_t6m_id.t6m_descripcion",header:{t:"U.M.",c:'text'},tipo:'string'},
                {"data":"bie_bat_id",header:{t:"DESCRIPCION",c:'text'},tipo:'string'},
                {"data":"bie_p",header:{t:"PRECIO",align:'right'},tipo:'money'},
                {"data":"bie_status",header:{t:"ESTADO"},tipo:'string'},
               // {"data":"bie_bie_id",header:{t:"CAT",c:'text'},tipo:'string'},
                {"data":"bie_options",header:"ACCIONES",tipo:'string'}
                
            ]
        });
    }
    bat = $('#bat').jsonTables({
        "src": "bat_json",
        "numerate": true,
        "columns": [{"data": "bat_val_id.val_pro_id.pro_nombre"},
                    {"data": "bat_val_id.val_valor"},
                    {"data": "bat_options"}]
        });
    webix.ui({
        container: "bbi_c70_id",
        view: "tree",
        id: "bbi_c70_id",
        select: true,
        autowidth: true,
        height: 300,
        width: 350,
        url: base_url + '/Main/getT9pSelect/70'
    });
    webix.ui({
        container: "bbi_c60_id",
        view: "tree",
        id: "bbi_c60_id",
        select: true,
        height: 300,
        width: 350,
        autowidth: true,
        url: base_url + '/Main/getT9pSelect/60'
    });
    webix.ui({
        container: "bbi_c61_id",
        view: "tree",
        id: "bbi_c61_id",
        select: true,
        height: 300,
        width: 350,
        autowidth: true,
        url: base_url + '/Main/getT9pSelect/61'
    });
    $('#bbi_t5e_id').loadOptions('t5existencias', ['t5e_descripcion']);
    $('#pro_id').loadOptions('propiedades', ['pro_nombre']);
    $('#bie_t6m_id').loadOptions('t6medidas', ['t6m_descripcion']);
    //$('#bie_alm_id').loadOptions('almacenes', ['alm_nombre'],{alm_est_id:['$_SESSION','est','est_id']});
    $('#nuevo_pro').click(function (e) {
        e.preventDefault();
        $('#modalPro').modal('show');
    })
    $('#nuevo_val').click(function (e) {
        e.preventDefault();
    })
    $('#btnSendPro').click(function (e) {
        e.preventDefault();
        var formData = new FormData(document.querySelector('#formPro'));
        divLoading.style.display = "flex";
        fetch(base_url + '/Bienes/setPropiedad', {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(response => {
                var objData = response;
                if (objData.status) {
                    $('#modalPro').modal("hide");
                    document.getElementById("formPro").reset();
                    $('#pro_id').loadOptions('propiedades', ['pro_nombre']);
                } else {
                    swal({
                        title: "Error",
                        text: objData.msg + "</br><pre class='text-left'>" + JSON.stringify(objData.data, null, 2) + "</pre>",
                        type: "error",
                        html: true
                    });
                }
            })
            .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))
        divLoading.style.display = "none";
        return false;
    })
    $('#pro_id').change(function (e) {
        e.preventDefault();
        fetch(base_url + '/Bienes/getPropiedad/' + $(this).val())
            .then(response => response.json())
            .then(response => {
                if (response.pro_revalue == 1) {
                    $('#new_val').hide();
                    $('#set_val').hide();
                    $('#val_id').show();
                    $('#val_id').loadOptions('valores', ['val_valor'], {
                        val_pro_id: $(this).val()
                    });
                } else {
                    $('#val_id').hide();
                    $('#new_val').show();
                    $('#set_val').show();
                }
            })
            .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))
    })
    $('#nuevo_val').click(function (e) {
        e.preventDefault();
        $('#val_id').hide();
        $('#new_val').show();
        $('#set_val').show();
    })
    $('#select_val').click(function (e) {
        e.preventDefault();
        $('#new_val').hide();
        $('#set_val').hide();
        $('#val_id').show();
    })
    $('#set_val').click(function (e) {
        e.preventDefault();
        var form = new FormData();
        form.append('val_pro_id', $('#pro_id').val());
        form.append('val_valor', $('#new_val').val());
        fetch(base_url + '/Bienes/setValor', {
                method: "POST",
                body: form
            })
            .then(response => response.json())
            .then(response => {
                if (response.status) {
                    $('#val_id').loadOptions('valores', ['val_valor'], {
                        val_pro_id: $('#pro_id').val()
                    });
                    $('#new_val').hide();
                    $('#set_val').hide();
                    $('#val_id').show();
                } else {
                    swal({
                        title: "Atención",
                        text: response.msg + "</br><pre class='text-left'>" + JSON.stringify(response.data, null, 2) + "</pre>",
                        type: "error",
                        html: true
                    });
                }
            })
            .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))

    })
    $('#set_bie').click(  async function (e) {
        e.preventDefault();
        var formData = new FormData(document.getElementById("formBie"));
        var bbi = Object.fromEntries(new FormData(document.getElementById("formBbi")));
        bbi.bbi_c70_id = $$("bbi_c70_id").getSelectedId();
        bbi.bbi_c60_id = $$("bbi_c60_id").getSelectedId();
        bbi.bbi_c61_id = $$("bbi_c61_id").getSelectedId();
        if (!isUndefined(bie_table.getSelectedId())) {
            formData.append('bie_bie_id', bie_table.getSelectedItem().bie_id);
        }
        var batrib = bat_json;
        for (const i in batrib) {
            batrib[i].bat_val_id = batrib[i].bat_val_id.val_id;
            delete batrib[i].bat_options;
        }
        formData.append('bie_bbi_id', JSON.stringify(bbi));
        formData.append('bie_bat_id',JSON.stringify(batrib));

        var bie_img = [];
        for (let i = 0; i < $('#bie_img').children().length; i++) {
            if (!$('#bie_img').children()[i].getAttribute('data')) {
                let blob = await fetch($('#bie_img').children()[i].src).then(r => r.blob());
                bie_img[i] = 'bie_img_'+i;
                formData.append('bie_img_'+i,new File([blob],'imgen.jpg')); 
            }else{
                bie_img[i] = $('#bie_img').children()[i].getAttribute('data');
            }
        }
        formData.append('bie_img',JSON.stringify(bie_img));
        formData.set('bie_igv', +$('#bie_igv').prop('checked'))
        fetch(base_url + '/Bienes/setBien', {method: "POST",body: formData})
            .then(response => response.json())
            .then(response => {
                if (response.status) {
                    swal("Bien", 'Guardado con Éxito', "success");
                    $('#modalFormBienes').modal("hide");
                    // $$('bie_table').clearAll();
                    // $$('bie_table').load(base_url+"/Bienes/getBienes");
                    bie_table.reload();
                    bat_json = {};
                    bat.reload();
                    document.getElementById("formBie").reset();
                    for (let i = 0; i < $('#bie_img').children().length; i++) {
                        if (!$('#bie_img').children()[i].getAttribute('data')) {
                            URL.revokeObjectURL($('#bie_img').children()[i].src);
                        }
                    }
                    $('#bie_img').html('');
                } else {
                    swal({
                        title: "Error",
                        text: response.msg + "</br><pre class='text-left'>" + JSON.stringify(response.data, null, 2) + "</pre>",
                        type: "error",
                        html: true
                    });
                }
                    
            })
            .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))

    })
});

window.addEventListener('load', async () => {
    bie_table = await bie_table;
    listenTree();
    bie_table.select(true);
    divLoading.style.display = "none";
});

function setBat(id = -1) {
    if (id >= 0) {
        var pin = id;
    } else {
        var pin = 0;
        for (const i in bat_json) {
            if (Object.hasOwnProperty.call(bat_json, i)) {
                if (pin <= parseInt(i)) {
                    pin = parseInt(i) + 1;
                }
            }
        }
    }
    bat_json[pin] = {
        bat_val_id: {
            val_pro_id:{
                pro_id: $('#pro_id').val(),
                pro_nombre: $('#pro_id').find('option:selected').text()
            },
            val_id: $('#val_id').val(),
            val_valor: $('#val_id').find('option:selected').text()
        },
        bat_options: '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editBat(' + pin + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>' +
            '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteBat(' + pin + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>'
    };
    bat.reload();
    $('#set_bat').removeClass('btn-info').addClass('btn-primary');
    $('#set_bat').children('i').removeClass('fa-refresh').addClass('fa-plus');
    $('#set_bat').attr('onclick', 'event.preventDefault();setBat();')
}
function deleteBat(id) {
    delete bat_json[id];
    bat.reload();
}
function editBat(id) {
    $('#pro_id').val(bat_json[id].bat_val_id.val_pro_id.pro_id);
    $('#val_id').loadOptions('valores', ['val_valor'], {
        val_pro_id: bat_json[id].bat_val_id.val_pro_id.pro_id
    });
    setTimeout(() => {
        $('#val_id').val(bat_json[id].bat_val_id.val_id);
    }, 100);
    $('#set_bat').removeClass('btn-primary').addClass('btn-info');
    $('#set_bat').children('i').removeClass('fa-plus').addClass('fa-refresh');
    $('#set_bat').attr('onclick', 'event.preventDefault();setBat(' + id + ');')
    $('#set_bat').slideDown();
}
function openModalBienes() {
    document.querySelector('#bie_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#set_bie').classList.replace("btn-info", "btn-primary");
    $('#set_bie span').html("Guardar");
    document.querySelector('#titleModalBie').innerHTML = "Nuevo Bienes";
    document.querySelector("#formBie").reset();
    $('#modalFormBienes').modal('show');
    bat_json = {};
    bat.reload();
    for (let i = 0; i < $('#bie_img').children().length; i++) {
        if (!$('#bie_img').children()[i].getAttribute('data')) {
            URL.revokeObjectURL($('#bie_img').children()[i].src);
        }
    }
    $('#bie_img').html(''); 
    $$('bbi_c70_id').select(1576);
    $$('bbi_c60_id').select(1170);
    $$('bbi_c61_id').select(1206);
    $('#bbi_t5e_id').val(1);

    $('#bie_t6m_id').val(58);

    if (!isUndefined(bie_table.getSelectedId())) {
        $('#bie_codigo').val(bie_table.getSelectedItem().bie_codigo)
    }
    //console.log($$("bie_table").getSelectedId());
    //console.log(isUndefined($$("bie_table").getSelectedId()));
}
function openModalHis(id) {
        $('#modalTable_his').modal('show');
        his_table.reload(base_url+"/Reportes/getHistorico/"+id)
        setTimeout(() => {
            his_table.rezise();
        }, 220);
}
function ftnViewBie(id) {
    fetch(base_url + '/Bienes/getBien/'+id)
            .then(response => response.json())
            .then(response => {
                if (response.status) {
                    $('#view_bie_codigo').text(response.data.bie_codigo);
                    $('#view_bie_nombre').text(response.data.bie_nombre);
                    $('#view_bie_t6m_id').text(response.data.bie_t6m_id.t6m_descripcion);
                    $('#view_bie_p').text(response.data.bie_p);
                    $('#view_bie_img').html('');
                    var images = JSON.parse(response.data.bie_img);
                    for (const i in images) {
                        var image = new Image();
                        image.height = 100;
                        image.className = "rounded border m-1";
                        image.src = base_url+'/.uploads/'+images[i];
                        $('#view_bie_img').append(image);
                    }
                    $('#modalViewBie').modal('show');
                } else { 
                }
            })
            .catch(error =>swal("Atención", "Error en el proceso: " + error, "error")) 

}
function fntEditBie(id) {
    document.querySelector('#titleModalBie').innerHTML ="Actualizar Bien";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#set_bie').classList.replace("btn-primary", "btn-info");
    $('#set_bie span').html("Actualizar");
    fetch(base_url + '/Bienes/getBien/'+id)
    .then(response => response.json())
    .then(response => {
        if(response.status){
            // $$("bie_table").unselectAll();
            $('#bie_id').val(response.data.bie_id); 
            $('#bbi_id').val(response.data.bie_bbi_id.bbi_id);
            $('#bie_codigo').val(response.data.bie_codigo);
            $('#bie_nombre').val(response.data.bie_nombre);
            if (response.data.bie_t6m_id != null) {
                $('#bie_t6m_id').val(response.data.bie_t6m_id.t6m_id);
            }
            $('#bie_p').val(response.data.bie_p);
            $('#bie_igv').prop('checked',parseInt(response.data.bie_igv))
            $('#bie_img').html('');
            var images = JSON.parse(response.data.bie_img);
            for (const i in images) {
                var image = new Image();
                image.height = 100;
                image.className = "rounded border m-1";
                image.src = base_url+'/.uploads/'+images[i];
                image.draggable="true";
                image.setAttribute('data',images[i]);
                image.setAttribute('ondragstart',"dragstart(event)");
                $('#bie_img').append(image);
            }
            for (const i in response.data.bie_bat_id) {
                response.data.bie_bat_id[i]['bat_options'] = '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editBat(' + i + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>' +
                '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteBat(' + i + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>';
            }
            bat_json = response.data.bie_bat_id;
            bat.reload();
            $$('bbi_c70_id').select(response.data.bie_bbi_id.bbi_c70_id.t9p_id);
            $$('bbi_c60_id').select(response.data.bie_bbi_id.bbi_c60_id.t9p_id);
            $$('bbi_c61_id').select(response.data.bie_bbi_id.bbi_c61_id.t9p_id);
            $('#bbi_t5e_id').val(response.data.bie_bbi_id.bbi_t5e_id.t5e_id);
            $('#modalFormBienes').modal('show');
        }else{
            swal("Error", response.msg , "error");
        }
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}

function getHistorico(mov_id){
    fetch(base_url+'/Movimientos/getView/'+mov_id)
        .then(response => response.json())
        .then(response => {
            document.querySelector('#bodyModal').innerHTML = response.data;
            $('#titleModalMov').text(response.title);
            $('#modalViewMov').modal('show');
         })
         .catch(error => console.error('Error:', error));
}