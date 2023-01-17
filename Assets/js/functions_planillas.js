var pla_table;
var url_pla = base_url+"/Planillas/getPlanillas";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#pla_table")) {
        pla_table = $('#pla_table').autoTable({
            "url": url_pla,
            "numerate": true,
            "thid": 'pla_id',
            "columns":[
                {"data":"pla_col_id.col_gpe_id.gpe_nombre",header:{t:"NOMBRE",c:'text'},tipo:'string'},
                {"data":"pla_col_id.col_gpe_id.gpe_apellidos",header:{t:"APELLIDOS",c:'text'},tipo:'string'},
                {"data":"pla_sweek",header:{t:"BASE SEMANAL"},tipo:'money'},
                {"data":"pla_saldo",header:{t:"SALDO SEMANA"},tipo:'money'},
                {"data":"pla_ndias",header:{t:"#DIAS"},tipo:'string'},
                {"data":"pla_hextras",header:{t:"H. E."},tipo:'string'},
                {"data":"pla_mhxtras",header:{t:"S/ H.E."},tipo:'money'},
                {"data":"pla_sueldo",header:{t:"SUELDO"},tipo:'money'},
                {"data":"pla_adelantos",header:{t:"ADELANTOS"},tipo:'money'},
                {"data":"pla_tpagar",header:{t:"TOTAL PAGAR"},style:{condition:{minzero:'text-danger'}},tipo:'money'},
                {"data":"pla_status",header:{t:"ESTADO"},tipo:'string'},
                {"data":"pla_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#week")) {
        document.querySelector("#week").value  = data.asi.asi_week;
        $('#week').change(function (e) {
            e.preventDefault();
            var formData = new FormData();
            formData.append('asi_week',$('#week').val()); 
            fetch(base_url + '/Asistencias/changeWeek',{method: "POST",body: formData})
            .then(r => r.json())
            .then(r => {
                if (r.status) {
                    pla_table.reload();
                } else {
                    swal("Atencion","Error en el Proceso","error");
                }
            })
            .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
        })
    }
});

window.addEventListener('load', async () => {
    pla_table = await pla_table;
    divLoading.style.display = "none";
});


function saveColSaldos() {
    fetch(base_url + '/Planillas/saveColSaldos')
            .then(r => r.json())
            .then(r => {
                if (r.status) {
                    swal("Atencion",r.msg,"success");
                } else {
                    swal({
                        title: "Error", 
                        text: r.msg+"</br><pre class='text-left'>"+ JSON.stringify(r.data, null, 2) + "</pre>",
                        type: "error",
                        html: true
                    });
                }
            })
            .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
}
