var inv_table,cua_table,ing_table,egr_table;
var sim_table;
var jsn_sim = [];
var url_inv = base_url+"/Inversiones/getInversiones";
var url_cua = base_url+"/Inversiones/getCuadre";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#inv_table")) {
        inv_table = $('#inv_table').autoTable({
            "url": url_inv,
            "numerate": true,
            "columns":[
                {"data":"inv_age_id.age_gpe_id.gpe_nombre",header:{t:"AGENTE",align:'center',c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"inv_tipo",header:{t:"TIPO MOVIMIENTO",align:'center'},tipo:'string',render:(r)=>r.inv_tipo==1?'INGRESO':'SALIDA'},
                {"data":"inv_fecha",header:{t:"FECHA"},tipo:'strind'},
                {"data":"inv_obs",header:{t:"OBSERVACIONES"},tipo:'string'},
                {"data":"inv_monto",header:{t:"MONTO",align:'right'},tipo:'float',footer:{c:'sum'}},
                {"data":"inv_opt",header:{t:"OPCIONES",align:'center'},tipo:'string'}]
        });
    }
    if (document.querySelector("#cua_table")) {
        cua_table = $('#cua_table').autoTable({
            "url": url_cua,
            "numerate": true,
            "columns":[
                {"data":"cua_gpe_id.gpe_nombre",header:{t:"AGENTE",align:'center',c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"cua_si",header:{t:"SALDO INICIAL",align:'right'},tipo:'money',footer:{c:'sum'}},
                {"data":"cua_ing",header:{t:"INGRESO",align:'right'},tipo:'money',footer:{c:'sum'}},
                {"data":"cua_egr",header:{t:"EGRESO",align:'right'},tipo:'money',footer:{c:'sum'}},
                {"data":"cua_saldo",header:{t:"SALDO",align:'right'},tipo:'money',footer:{c:'sum'}},
                {"data":"cua_porc",header:{t:"PORCENTAJE",align:'right'},tipo:'string'},
                {"data":"cua_com",header:{t:"COMISION",align:'right'},tipo:'money',footer:{c:'sum'}},
                {"data":"cua_total",header:{t:"TOTAL GENERAL",align:'right'},tipo:'money',footer:{c:'sum'}},
                {"data":"cua_opc",header:{t:"OPCIONES",align:'center'},tipo:'string'}]
        });
    }
    if (document.querySelector("#ing_table")) {
        ing_table = $('#ing_table').autoTable({
            "url": base_url+"/Inversiones/getEgreso/1",
            "numerate": true,
            "columns":[
                {"data":"inv_fecha",header:{t:"FECHA"},tipo:'string'},
                {"data":"inv_obs",header:{t:"OBSERVACIONES"},tipo:'string'},
                {"data":"inv_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{c:'sum'}}]
        });
    }
    if (document.querySelector("#egr_table")) {
        egr_table = $('#egr_table').autoTable({
            "url": base_url+"/Inversiones/getIngreso/1",
            "numerate": true,
            "columns":[
                {"data":"inv_fecha",header:{t:"FECHA",align:'right'}},
                {"data":"inv_obs",header:{t:"OBSERVACIONES",align:'right'}},
                {"data":"inv_monto",header:{t:"MONTO",align:'right'},tipo:'money',footer:{c:'sum'}}]
        });
    }
    if (document.querySelector("#inv_age_id")) {
        $("#new_age").click(function(e) {
            $("#modalTable_age").modal('show');
            setTimeout(() => {
                age_table.rezise();
                age_table.select(true);
            }, 220);
        })
        $("#select_age").click(function(e) {
            $('#inv_age_id').children().attr('value',age_table.getSelectedItem().age_id);
            $('#inv_age_id').children().text(age_table.getSelectedItem().age_ide+' - '+age_table.getSelectedItem().age_nombre);
            $('#inv_gt4_id').val(age_table.getSelectedItem().age_gt4_id.gt4_id);
        })
    }
    if (document.querySelector("#sim_table")) {
        sim_table = $('#sim_table').autoTable({
            "src": 'jsn_sim',
            "numerate": true,
            "columns":[
                {"data":"sim_ci",header:{t:"SUBTOTAL",align:'right'}, tipo:'money'},
                {"data":"sim_i",header:{t:"INTERESES",align:'right'}, tipo:'money'},
                {"data":"sim_cf",header:{t:"SALDO TOTAL",align:'right'}, tipo:'money'},
            ]
        });
    }
    $('#inv_gt4_id').loadOptions('t4monedas',['gt4_descripcion']);
    $('#inv_cue_id').loadOptions('cuentas',['cue_nombre'],{'cue_status':1});
    $('#inv_t1m_id').loadOptions('t1mediopagos',['t1m_descripcion'],{'t1m_status':1});


});

window.addEventListener('load', async () => {
    if (document.querySelector("#inv_table")) {
        inv_table = await inv_table;
        setTimeout(() => {
            inv_table.rezise();
        }, 250);
    }
    if (document.querySelector("#cua_table")) {
        cua_table = await cua_table;
        setTimeout(() => {
            cua_table.rezise();
        }, 250);
    }
    if (document.querySelector("#ing_table")) {
        ing_table = await ing_table;
    }
    if (document.querySelector("#egr_table")) {
        egr_table = await egr_table;
    }
    if (document.querySelector("#sim_table")) {
        sim_table = await sim_table;
    }
    divLoading.style.display = "none";
});

function viewInv(id,nombre,monto) {
    $("#modalView_Inv").modal('show'); 
    ing_table.reload(base_url+"/Inversiones/getIngreso/"+id);
    egr_table.reload(base_url+"/Inversiones/getEgreso/"+id);
    $('#h_age_id').text(nombre)
    $('#inv_saldo').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(monto))
}

async function setPoc(id,e) {
    await set(`age`,null,{age_id:id,age_json:JSON.stringify({age_porc:e.target.value})},true); 
    cua_table.reload()
}

async function setTrato(e) {
    e.preventDefault()
    let r = Object.fromEntries( new FormData(e.target))
    jsn_sim = []
    for (let i = 1; i < parseInt(r.tra_n)+1 ; i++) {
        let tra_cf = parseFloat(r.tra_ci)*Math.pow(1+(parseFloat(r.tra_i)/100)/parseFloat(r.tra_c) ,i)
        jsn_sim.push({sim_ci:parseFloat(r.tra_ci),sim_i:tra_cf-parseFloat(r.tra_ci),sim_cf:tra_cf})
    }
    sim_table.reload();
    


    
}
