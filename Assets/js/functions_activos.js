var aat;
var aat_json = {};
var i = 1;
document.addEventListener('DOMContentLoaded',function () {
    if (document.querySelector("#act_table")) {
        webix.ui({
            container: "act_table",
            rows:[
                {align:"left",body:{view:"select",width:"110",label:"Mostrar",labelWidth: "auto",labelRight:"Registros",options:["10", "50", "100","200"]}},
                {align:"left",body:{cols:[
                    {view:"button",type:"icon", icon:"fas fa-file-pdf",label:"PDF",width:80},
                    {view:"button",type:"icon", icon:"fas fa-file-excel",label:"EXCEL",width:80},
                    {view:"button",type:"icon", icon:"fas fa-file-csv",label:"CSV",width:80},
                    {view:"button",type:"icon", icon:"far fa-copy",label:"COPY",width:80}]}}, 
                {align:"right",body:{view:"text", label:"Buscar",width:270}},
                {view: "treetable",
                id:"act_table",
                resizeColumn: { headerOnly:true },
                resizeRow: { headerOnly:true },
                columns: [
                    {id: "act_nro",header: "#",sort:"int"},
                    {id: "act_codigo",header:["CODIGO", {content:"textFilter"}],sort:"string",width:200,template:"{common.treetable()} <span>#act_codigo#</span>"},  //content:"selectFilter"
                    {id: "act_nombre",header:["NOMBRE", {content:"textFilter"}],width:200,sort:"string"},
                    {id: "act_aat_id",header:["ATRIBUTOS", {content:"textFilter"}],fillspace:true,sort:"string",template:function(d,e,f){
                        response='';
                        for (const i in f) {
                            response+= `{ ${f[i].aat_val_id.val_pro_id.pro_nombre}: ${f[i].aat_val_id.val_valor} },`;
                        }
                        return  response;   
                    }},
                    {id: "act_p",header: "PRECIO",sort:"int"},
                    {id: "act_status",header: "ESTADO"},
                    {id: "act_options",header: "ACCION",width:150}
                ],
                scroll:false,   
                autoheight: true,
                pager:"pager",
                select: true,
                url: base_url+"/Activos/getActivos",
                sort:"multi"},
                {align:"right",body:{view:"pager",
                id:"pager",width:36*3,
                template:"{common.prev()}{common.pages()}{common.next()}",
                size:10,group:5}}
              ]
        });
        webix.ui({
            container: "act_t9p_id",
            view: "tree",
            id: "act_t9p_id",
            select: true,
            autowidth: true,
            height: 300,
            width: 350,
            url: base_url + '/Main/getT9pSelect/33'
        });
        $$("act_table").attachEvent("onItemDblClick", function(id, e, node){
            $$("act_table").unselectAll();
        });
    }
    aat = $('#aat').jsonTables({
        "src": "aat_json",
        "numerate": true,
        "columns": [{"data": "aat_val_id.val_pro_id.pro_nombre"},
                    {"data": "aat_val_id.val_valor"},
                    {"data": "aat_options"}]
        });

    $('#pro_id').loadOptions('propiedades',['pro_nombre']);
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
    $('#set_act').click(  async function (e) {
        e.preventDefault();
        var formData = new FormData(document.getElementById("formAct"));
        if (!isUndefined($$("act_table").getSelectedId())) {
            formData.append('act_act_id', $$("act_table").getSelectedItem().act_id);
        }
        var aatrib = aat_json;
        for (const i in aatrib) {
            aatrib[i].aat_val_id = aatrib[i].aat_val_id.val_id;
            delete aatrib[i].aat_options;
        }
        formData.append('act_t9p_id', $$("act_t9p_id").getSelectedId());
        formData.append('act_aat_id',JSON.stringify(aatrib));

        var act_img = [];
        for (let i = 0; i < $('#act_img').children().length; i++) {
            if (!$('#act_img').children()[i].getAttribute('data')) {
                let blob = await fetch($('#act_img').children()[i].src).then(r => r.blob());
                act_img[i] = 'act_img_'+i;
                formData.append('act_img_'+i,new File([blob],'imgen.jpg')); 
                URL.revokeObjectURL($('#act_img').children()[i].src);
            }else{
                act_img[i] = $('#act_img').children()[i].getAttribute('data');
            }
        }

        formData.append('act_img',JSON.stringify(act_img));

        fetch(base_url + '/Activos/setActivo', {method: "POST",body: formData})
            .then(response => response.json())
            .then(response => {
                if (response.status) {
                    swal("Activo", 'Guardado con Éxito', "success");
                    $('#modalAct').modal("hide");
                    act_table.reload();
                } else {
                    swal({
                        title: "Error",
                        text: response.msg + "</br><pre class='text-left'>" + JSON.stringify(response.data, null, 2) + "</pre>",
                        type: "error",
                        html: true
                    });
                }
                aat_json = {};
                aat.reload();
                document.getElementById("formAct").reset();
                    
            })
            .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))

    })
});
function setAat(id = -1) {
    if (id >= 0) {
        var pin = id;
    } else {
        var pin = 0;
        for (const i in aat_json) {
            if (Object.hasOwnProperty.call(aat_json, i)) {
                if (pin <= parseInt(i)) {
                    pin = parseInt(i) + 1;
                }
            }
        }
    }
    aat_json[pin] = {
        aat_val_id: {
            val_pro_id:{
                pro_id: $('#pro_id').val(),
                pro_nombre: $('#pro_id').find('option:selected').text()
            },
            val_id: $('#val_id').val(),
            val_valor: $('#val_id').find('option:selected').text()
        },
        aat_options: '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editAat(' + pin + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>' +
            '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteAat(' + pin + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>'
    };
    aat.reload();
    $('#set_aat').removeClass('btn-info').addClass('btn-primary');
    $('#set_aat').children('i').removeClass('fa-refresh').addClass('fa-plus');
    $('#set_aat').attr('onclick', 'event.preventDefault();setAat();')
}
function deleteAat(id) {
    delete aat_json[id];
    aat.reload();
}
function editAat(id) {
    $('#pro_id').val(aat_json[id].aat_val_id.val_pro_id.pro_id);
    $('#val_id').loadOptions('valores', ['val_valor'], {
        val_pro_id: aat_json[id].aat_val_id.val_pro_id.pro_id
    });
    setTimeout(() => {
        $('#val_id').val(aat_json[id].aat_val_id.val_id);
    }, 100);
    $('#set_aat').removeClass('btn-primary').addClass('btn-info');
    $('#set_aat').children('i').removeClass('fa-plus').addClass('fa-refresh');
    $('#set_aat').attr('onclick', 'event.preventDefault();setAat(' + id + ');')
    $('#set_aat').slideDown();
}
function openModalAct() {
    document.querySelector('#act_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#set_act').classList.replace("btn-info", "btn-primary");
    $('#set_act span').html("Guardar");
    document.querySelector('#titleModalAct').innerHTML = "Nuevo Activos";
    document.querySelector("#formAct").reset();
    $('#act_img').html('');
    $$("act_t9p_id").unselectAll();
    $('#modalAct').modal('show');
}
function ftnViewAct(id) {
    fetch(base_url + '/Activos/getActivo/'+id)
            .then(response => response.json())
            .then(response => {
                if (response.status) {
                    $('#view_act_codigo').text(response.data.act_codigo);
                    $('#view_act_nombre').text(response.data.act_nombre);
                    $('#view_act_t9p_id').text(response.data.act_t9p_id.t9p_codigo+' - '+response.data.act_t9p_id.t9p_descripcion);
                    $('#view_act_img').html('');
                    var images = JSON.parse(response.data.act_img);
                    for (const i in images) {
                        var image = new Image();
                        image.height = 100;
                        image.className = "rounded border m-1";
                        image.src = base_images+'/uploads/'+images[i];
                        $('#view_act_img').append(image);
                    }
                    $('#modalViewAct').modal('show');
                } else {
                    
                }

            })
            .catch(error =>swal("Atención", "Error en el proceso: " + error, "error")) 

}
function fntEditAct(id) {
    document.querySelector('#titleModalAct').innerHTML ="Actualizar Activos";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#set_act').classList.replace("btn-primary", "btn-info");
    $('#set_act span').html("Actualizar");
    fetch(base_url + '/Activos/getActivo/'+id)
    .then(response => response.json())
    .then(response => {
        if(response.status){
            $$("act_table").unselectAll();
            $('#act_id').val(response.data.act_id); 
            $('#act_codigo').val(response.data.act_codigo);
            $('#act_nombre').val(response.data.act_nombre);
            $('#act_status').val(response.data.act_status);
            $$("act_t9p_id").select(response.data.act_t9p_id.t9p_id);
            $('#act_img').html('');
            var images = JSON.parse(response.data.act_img);
            for (const i in images) {
                var image = new Image();
                image.height = 100;
                image.className = "rounded border m-1";
                image.src = base_images+'/uploads/'+images[i];
                image.draggable="true";
                image.setAttribute('data',images[i]);
                image.setAttribute('ondragstart',"dragstart(event)");
                $('#act_img').append(image);
            }
            for (const i in response.data.act_aat_id) {
                response.data.act_aat_id[i]['aat_options'] = '<div class="text-center"><button class="btn btn-primary btn-sm" onClick="event.preventDefault();editAat(' + i + ');" title="Editar"><i class="fas fa-pencil-alt"></i></button>' +
                '<button class="btn btn-danger btn-sm" onClick="event.preventDefault();deleteAat(' + i + ');" title="Eliminar"><i class="far fa-trash-alt"></i></button></div>';
            }
            aat_json = response.data.act_aat_id;
            aat.reload();
            $('#modalAct').modal('show');
        }else{
            swal("Error", response.msg , "error");
        }
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
}