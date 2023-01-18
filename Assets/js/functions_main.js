
document.addEventListener('DOMContentLoaded',function () {
    if (document.querySelector("#periodo")) {
        document.querySelector("#periodo").valueAsDate = new Date(data.periodo);
        $("#periodo").change(function(e) {
            var formData = new FormData();  
            formData.append('periodo',this.value);
            fetch(base_url + '/Main/setPeriodo',{method: "POST",body: formData})
            .then(response => response.json())
            .then(response => {
                if (response.status) {
                    window.location.reload();
                } else {
                    document.querySelector("#periodo").valueAsDate = new Date(data.periodo);
                }
            })
            .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))
        })
    }
});
async function del(prefijo,id,res=false) {
    var table = capitalize(getTable(prefijo));
    var confirm = new Promise((resolver, rechazar)=>{swal({title: "Eliminar "+capitalize(getTable(prefijo)),
    text: "¿Realmente quiere eliminar el Registro?",
    type: "warning",
    showCancelButton: true,
    confirmButtonText: "Si, eliminar!",
    cancelButtonText: "No, cancelar!",
    closeOnConfirm: true,
    closeOnCancel: true},function(isConfirm){
        resolver(isConfirm);
    })
    });
    if (await confirm) {
        var formData = new FormData();  
        formData.append('prefijo',prefijo);
        formData.append('id',id);
        var response = await fetch(base_url + '/Main/del',{method: "POST",body: formData})
        .then(response => response.json())
        .then(response => {return response;})
        .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))
        if (!res) {
            if (response.status) {
                swal("Eliminar!", response.msg, "success");
                if (!isUndefined($$(prefijo+'_table'))){
                    $$(prefijo+'_table').clearAll();
                    //$$(prefijo+'_table').load(base_url+"/Main/getAll/"+prefijo);
                    $$(prefijo+'_table').load(base_url+"/"+table+"/get"+table);
                } else {
                    window[prefijo+'_table'].reload();
                }
            } else {
                swal("Atención!", response.msg, "error");
            } 
        }
    }else{
        if (res) {
            response = {status:false};
        }
    }
    return response;
}
async function off(node,prefijo,id,res=false) {
    var table = capitalize(getTable(prefijo));
    var confirm = new Promise((resolver, rechazar)=>{swal({title: "Cambiar estado de "+capitalize(getTable(prefijo)),
    text: "¿Seguro que desea cambiar de Estado del Registro?",
    type: "warning",
    showCancelButton: true,
    confirmButtonText: "Si, cambiar!",
    cancelButtonText: "No, cambiar!",
    closeOnConfirm: true,
    closeOnCancel: true},function(isConfirm){
        resolver(isConfirm);
    })
    });
    if (await confirm) {
        var json = {};
        json[prefijo+'_id'] = id;
        json[prefijo+'_status'] = +$(node).prop("checked");
        var response = await set(prefijo,null,json,true)
        if (!res) {
            if (!response.status) {
                swal("Atención!", response.msg, "error");
            }
        }
    }else{
        if (res) {
            response = {status:false};
        }
    }
    return response;
}
async function set(prefijo,where= null,json = null,res = false) {
    var table = capitalize(getTable(prefijo));
    if (typeof window['setPre'+capitalize(prefijo)]==='function') {
        var arr = await window['setPre'+capitalize(prefijo)](where,Object.fromEntries(new FormData(document.querySelector('#form_'+prefijo))),res);
        where = arr.where??where;
        json = arr.json??json;
        res = arr.res??res;
    }
    if (json != null) {
        var formData = new FormData();
        for (const i in json) {
            formData.append(i,json[i])
        }
    } else {
        var formData = new FormData(document.querySelector('#form_'+prefijo));
    }
    if (data[prefijo]) {
        for (const i in data[prefijo]) {
            formData.append(i,data[prefijo][i]);
        }
    } 
    formData.append('where',JSON.stringify(where)); 
    formData.append('prefijo',prefijo); 
    var response = await fetch(base_url + '/Main/set', {
            method: "POST",
            body: formData
        })
        .then(response => response.json())
        .then(response => {
            if (response.status) {
                if (res) {
                    return response;
                }else {
                    swal(capitalize(getTable(prefijo)), 'Guardado con Éxito', "success");
                    resetModal(prefijo);
                    if (!isUndefined($$(prefijo+'_table'))){
                        $$(prefijo+'_table').clearAll();
                        //$$(prefijo+'_table').load(base_url+"/Main/getAll/"+prefijo);
                        $$(prefijo+'_table').load(base_url+"/"+table+"/get"+table);
                    } else {
                        window[prefijo+'_table'].reload();
                    }
                }
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
    if (res) {
        return response;
    }
}
async function edit(prefijo,id,res=false) {
    document.querySelector('#titleModal_'+prefijo).innerHTML ="Actualizar "+capitalize(getTable(prefijo));
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#set_'+prefijo).classList.replace("btn-primary", "btn-info");
    document.querySelector("#form_"+prefijo).reset();
    $('#set_'+prefijo+' span').html("Actualizar");
    var response = await fetch(base_url + '/Main/get/'+prefijo+','+id)
    .then(response => response.json())
    .then(response => {
        if(response.status){
            for (const i in response.data) {
                data[prefijo+'Id'] = response.data;
                if (document.querySelector('#'+i) && response.data[i] != null) {
                    let pin = i.split('_');
                    if (pin.length>2) {
                        let n = parseInt(response.data[i][pin[1]+'_'+pin[2]]);
                        setTimeout(() => {
                            if (document.querySelector('#'+i)) {
                                $('#'+i).val(n);
                            }
                        }, 210);
                    }
                    if (document.querySelector('#'+i)) {
                        $('#'+i).val(response.data[i]); 
                    }
                }
            }
            $('#modal_'+prefijo).modal('show');
            return response;
        }else{
            swal("Error", response.msg , "error");
        }
    })
    .catch(e => console.error(e))
    if (res) {
        return response.data;
    }
}
async function view(prefijo,id,res=false) {
    var response = await fetch(base_url + '/Main/get/'+prefijo+','+id)
    .then(response => response.json())
    .then(response => {
        if(response.status){
            data[prefijo+'Id'] = response.data 
            for (const i in response.data) {
                $('#v_'+i).text(response.data[i]); 
            }
            $('#modalView_'+prefijo).modal('show');
            return response;
        }else{
            swal("Error", response.msg , "error");
        }
    })
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    if (res) {
        return response.data;
    }
}
function resetModal(prefijo) {
    document.querySelector("#form_"+prefijo).reset();
    $('#modal_'+prefijo).modal('hide');
}
function openModal(prefijo) {
    document.querySelector('#'+prefijo+'_id').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#set_'+prefijo).classList.replace("btn-info", "btn-primary");
    $('#set_'+prefijo+' span').html("Guardar");
    document.querySelector('#titleModal_'+prefijo).innerHTML = "Nuevo";  //+ capitalize( getTable(prefijo))
    document.querySelector("#form_"+prefijo).reset();
    $('#modal_'+prefijo).modal('show');
}

