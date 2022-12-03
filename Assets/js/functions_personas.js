var gpe_table;
var url_gpe = base_url+"/Main/getAll/gpe";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gpe_table")) {
        gpe_table = $('#gpe_table').autoTable({
            "url": url_gpe,
            "numerate": true,
            "thid": 'gpe_id',
            "columns":[
                {"data":"gpe_identificacion",header:{t:"DOC/DNI"},tipo:'string'},
                {"data":"gpe_nombre",header:{t:"NOMBRE"},tipo:'string'},
                {"data":"gpe_apellidos",header:{t:"APELLIDOS",c:'text'},tipo:'string'},
                {"data":"gpe_gdi_id.gdi_distrito",header:{t:"DISTRITO"},tipo:'string'},
                {"data":"gpe_direccion",header:{t:"DIRECCION"},tipo:'string'},
                {"data":"gpe_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gpe_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    $('#gpe_gt2_id').loadOptions('t2identidades',['gt2_descripcion']);
    $('#gpe_gde_id').loadOptions('departamentos',['gde_departamento']);
    $('#gpe_gde_id').change(function(){
        $('#gpe_gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$(this).val()});
        $('#gpe_gdi_id').html('');
    })
    $('#gpe_gpr_id').change(function(){
        $('#gpe_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$(this).val()});
    })
    $('#gpe_gt2_id').change(function(e){
        e.preventDefault();
        switch (this.value) {
            case '1':
                var formData = new FormData()
                formData.append('gpe_gt2_id',this.value);
                fetch(base_url + '/Personas/getNumPersona', {method: "POST",body: formData})
                .then(response => response.json())
                .then(response => {
                    $('#gpe_identificacion').val(response.age_num);
                })
                .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
                break;
            default:
                break;
        }
    })
    $('#gpe_identificacion').keypress(function (e) {
        var keycode = (e.keyCode ? e.keyCode : e.which);
        if (keycode == '13') {
            e.preventDefault();
            switch ($('#gpe_gt2_id').val()) {
                case '2':
                    fetch(base_url + '/Main/getConsultaDNI/' + this.value)
                    .then(response => response.json())
                    .then(response => {
                        $('#gpe_nombre').val(response.nombres);
                        $('#gpe_apellidos').val(response.apellidoPaterno+' '+response.apellidoMaterno);
                        $('#gpe_direccion').val('');
                        $('#gdi_id').val('');
                        $('#gpr_id').val('');
                        $('#gde_id').val('');
        
                    })
                    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
                    break;
                default:
                    break;
            }
        }
    });
});

window.addEventListener('load', async () => {
    gpe_table = await gpe_table;
    divLoading.style.display = "none";
});