var gem_table;
var url_gem = base_url+"/Main/getAll/gem";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#gem_table")) {
        gem_table = $('#gem_table').autoTable({
            "url": url_gem,
            "numerate": true,
            "thid": 'gem_id',
            "columns":[
                {"data":"gem_ruc",header:{t:"RUC",c:'text'},tipo:'string'},
                {"data":"gem_razonsocial",header:{t:"RAZON SOCIAL",c:'text'},tipo:'string'},
                {"data":"gem_gdi_id.gdi_distrito",header:{t:"DISTRITO",c:'text'},tipo:'string'},
                {"data":"gem_direccion",header:{t:"DIRECCION",c:'text'},tipo:'string'},
                {"data":"gem_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"gem_options",header:{t:"ACCIONES"},tipo:'string'}
            ]
        });
    }
    $('#gem_gde_id').loadOptions('departamentos',['gde_departamento']);
    
    $('#gem_gde_id').change(function(){
        $('#gem_gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$(this).val()});
        $('#gem_gdi_id').html('');
    })
    $('#gem_gpr_id').change(function(){
        $('#gem_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$(this).val()});
    })
    $('#gem_ruc').keypress(function (e) {
		var keycode = (e.keyCode ? e.keyCode : e.which);
		if (keycode == '13') {
			e.preventDefault();
			fetch(base_url + '/Main/getConsultaRuc/' + this.value)
				.then(response => response.json())
				.then(response => {
					$('#gem_razonsocial').val(response.razonSocial);
					$('#gem_direccion').val(response.direccion);
					$('#gem_gde_id').valfinder(response.departamento);
                    $('#gem_gpr_id').loadOptions('provincias',['gpr_provincia'],{gpr_gde_id:$('#gem_gde_id').val()});
                    setTimeout(() => {
                        $('#gem_gpr_id').valfinder(response.provincia);
                        $('#gem_gdi_id').loadOptions('distritos',['gdi_distrito'],{gdi_gpr_id:$('#gem_gpr_id').val()});
                        setTimeout(() => {
                            $('#gem_gdi_id').valfinder(response.distrito); 
                        }, 500); 
                    }, 500);
                    
				})
				.catch(error => swal("Atención","Error en el proceso: "+error, "error"))	
		}
	});
});
window.addEventListener('load', async () => {
    gem_table = await gem_table;
    divLoading.style.display = "none";
});

async function setPreGem(where,json,res) {
    if (!json.gem_gcl_id) {
        json.gem_gcl_id = await JSON.stringify([parseInt(data.gcl_id)]);
    }
    return {json}
}

async function setPosGem(res) {
    if (res.exist) {
        var gem_gcl_id = JSON.parse(res.data.gem_gcl_id);
        gem_gcl_id.push(parseInt(data.gcl_id));
        await set('gem',null,{gem_id:parseInt(res.gem_id),gem_gcl_id:JSON.stringify(gem_gcl_id)})
        return true
    }
    return false
}