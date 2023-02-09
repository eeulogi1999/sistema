var eve_table,sim_table,nac_table;
var url_eve = base_url+"/Movimientos/getEventas";
var url_sim = base_url+"/Movimientos/getSimulaciones/";
var val_json = {};
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#eve_table")) {
        eve_table = $('#eve_table').autoTable({
            "url": url_eve,
            "numerate": true,
            "columns":[
                {"data":"mov_doc",header:{t:"DOC.",align:'center'},tipo:'string'},
                {"data":"mov_age_id.age_gem_id.gem_razonsocial",header:"AGENTE",tipo:'string'},
                {"data":"mov_cue_id.cue_nombre",header:"CUENTAS",tipo:'string'},
                {"data":"mov_bie_id.bie_nombre",header:"MATERIAL",tipo:'string'},
                {"data":"mov_mde_id.0.mde_q",header:{t:"CANT./KG",align:'right'},tipo:'float'},
                {"data":"mov_tonq",header:{t:"CANT./TON",align:'right'},tipo:'float',style:{color:'success'}},
                {"data":"mov_mde_id.0.mde_vu",header:{t:"PRECIO/KG",align:'right'},tipo:'money',chr:'mov_gt4_id'},
                {"data":"mov_tonvu",header:{t:"PRECIO/TON",align:'right'},tipo:'money',chr:'mov_gt4_id',style:{color:'success'}},
                {"data":"mov_total",header:{t:"MONTO TOTAL",align:'right'},tipo:'money',chr:'mov_gt4_id'},
                {"data":"mov_qe",header:{t:"Q. ENTREGADA",align:'right'},tipo:'float'},
                {"data":"mov_qeref",header:{t:"REFERENCIAS",align:'center'},tipo:'string'},
                {"data":"mov_qs",header:{t:"Q. SALDO",align:'right'},tipo:'float'},
                {"data":"mov_fechaV",header:{t:"PLAZO",align:'center'},tipo:'string'},
                {"data":"mov_mstatus",header:{t:"ESTADO",align:'center'},tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#sim_table")) {
        sim_table = $('#sim_table').autoTable({
            "url": url_sim+1,
            "numerate": true,
            "columns":[
                {"data":"sim_bie_id.bie_nombre",header:{t:"MATERIAL",align:'center'},tipo:'string'},
                {"data":"sim_created",header:"ULTIMA MODIFICACIÓN",tipo:'string'},
                {"data":"sim_gus_id.gus_gpe_id.gpe_nombre",header:"USER",tipo:'string'},
                {"data":"sim_q",header:{t:"CANTIDAD KG.",align:'right'},tipo:'float'},
                {"data":"sim_p",header:{t:"PRECIO/KG",align:'right'},tipo:'money'},
                {"data":"sim_m",header:{t:"VENTA BRUTA",align:'right'},tipo:'money'},
                {"data":"sim_tce_id.tce_gtc_id.gtc_tcompra",render:(r)=>{
                    return (r.sim_tce_id.tce_compra)?r.sim_tce_id.tce_compra:r.sim_tce_id.tce_gtc_id.gtc_tcompra}
                ,header:{t:"T.C SUNAT",align:'right'},tipo:'float'},
                {"data":"sim_g",header:{t:"GASTO",align:'right'},tipo:'float'},
                {"data":"sim_n",header:{t:"VENTA NETA",align:'right'},tipo:'money'},
                {"data":"sim_pp",header:{t:"P/KG MERCADO",align:'right'},tipo:'money'},
                {"data":"sim_pc",header:{t:"P/KG COMPANY",align:'right'},tipo:'money'},
                {"data":"sim_pm",header:{t:"P/KG MAXIMO",align:'right'},tipo:'money',style:{color:'danger'}},
                {"data":"sim_obs",header:{t:"OBSERV.",align:'center'},tipo:'string'},
                {"data":"sim_opt",header:{t:"OPCIONES",align:'center'},tipo:'string'}
            ]
        });
    }
    if (document.querySelector("#nac_table")) {
        nac_table = $('#nac_table').autoTable({
            "url": url_sim+2,
            "numerate": true,
            "columns":[
                {"data":"sim_bie_id.bie_nombre",header:{t:"MATERIAL",align:'center'},tipo:'string'},
                {"data":"sim_created",header:"ULTIMA MODIFICACIÓN",tipo:'string'},
                {"data":"sim_gus_id.gus_gpe_id.gpe_nombre",header:"USER",tipo:'string'},
                {"data":"sim_q",header:{t:"CANTIDAD KG.",align:'right'},tipo:'float'},
                {"data":"sim_p",header:{t:"PRECIO/KG",align:'right'},tipo:'money'},
                {"data":"sim_m",header:{t:"VENTA BRUTA",align:'right'},tipo:'money'},
                {"data":"sim_tce_id.tce_gtc_id.gtc_tcompra",render:(r)=>{return (r.sim_tce_id.tce_compra)?r.sim_tce_id.tce_compra:r.sim_tce_id.tce_gtc_id.gtc_tcompra}
                ,header:{t:"T.C SUNAT",align:'right'},tipo:'float'},
                {"data":"sim_g",header:{t:"GASTO",align:'right'},tipo:'float'},
                {"data":"sim_n",header:{t:"VENTA NETA",align:'right'},tipo:'money'},
                {"data":"sim_pp",header:{t:"P/KG MERCADO",align:'right'},tipo:'money'},
                {"data":"sim_pc",header:{t:"P/KG COMPANY",align:'right'},tipo:'money'},
                {"data":"sim_pm",header:{t:"P/KG MAXIMO",align:'right'},tipo:'money',style:{color:'danger'}},
                {"data":"sim_obs",header:{t:"OBSERV.",align:'center'},tipo:'string'},
                {"data":"sim_opt",header:{t:"OPCIONES",align:'center'},tipo:'string'}
            ]
        });
    }

    document.querySelector("body").style.overflowY = 'auto';

});

window.addEventListener('load', async () => {
    if (document.querySelector("#eve_table")) {
        eve_table = await eve_table;
    }
    if (document.querySelector("#sim_table")) {
        sim_table = await sim_table;
    }
    if (document.querySelector("#nac_table")) {
        nac_table = await nac_table;
    }
    divLoading.style.display = "none";
});


function openModalC(t) {
    openModal('sim');
    data.sim.sim_tipo = t;
    let r = {};
    r.sim_tipo = t
    r.sim_id=0
    r.sim_p_1=(t==1)?29:5.1
    r.sim_p_2=(t==1)?29:5.1
    r.sim_p_3=(t==1)?29:5.1
    r.sim_p_4=(t==1)?29:5.1
    r.sim_pc=(t==1)?29:5.1
    r.sim_qtn = 20
    r.sim_qkg = 1
    r.sim_ptn = 8205
    r.sim_pkg = 5.15
    r.sim_gtc = parseFloat(data.sim.sim_gtc)
    r.sim_g = (t==1)?0.56:0.05
    r.sim_exp = (t==1)?93:100
    r.sim_det = 17.7
    r.sim_igv = (t==1)?18:17.7;
    r.sim_imp = (t==1)?3.5:2.5;
    r.sim_cadm = 55
    r.sim_plus = 0
    r.sim_pkg = ((r)=>{
        if (r.sim_tipo == 1) {
            return r.sim_ptn/1000
        } else {
            return r.sim_pkg
        }
    })(r)
    r.sim_mbtn = ((r)=>{
        if (r.sim_tipo == 1) {
            return r.sim_qtn*r.sim_ptn*r.sim_gtc
        } else {
            return r.sim_pkg*1000*r.sim_qtn
        }
    })(r)
    r.sim_mbkg = ((r)=>{
        if (r.sim_tipo == 1) {
            return r.sim_qkg*r.sim_pkg*r.sim_gtc
        } else {
            return r.sim_pkg
        }
    })(r)
    r.sim_mntn = ((r)=>{return r.sim_mbtn-(r.sim_g*1000*r.sim_qtn)})(r)
    r.sim_mnkg = ((r)=>{return r.sim_mbkg-(r.sim_g*r.sim_qkg)})(r)
    r.sim_mxtn = ((r)=>{ return r.sim_mbtn*r.sim_exp/100})(r)
    r.sim_mxkg = ((r)=>{ return r.sim_mbkg*r.sim_exp/100})(r)
    r.sim_migtn = ((r)=>{ return r.sim_mxtn*r.sim_igv/100})(r)
    r.sim_migkg = ((r)=>{ return r.sim_mxkg*r.sim_igv/100})(r)
    r.sim_miptn = ((r)=>{ return r.sim_mbtn*r.sim_imp/100})(r)
    r.sim_mipkg = ((r)=>{ return r.sim_mbkg*r.sim_imp/100})(r)
    r.sim_mrtn = ((r)=>{ return r.sim_migtn-r.sim_miptn})(r)
    r.sim_mrkg = ((r)=>{ return r.sim_migkg-r.sim_mipkg})(r)
    r.sim_matn = ((r)=>{ return r.sim_mrtn*(1-r.sim_cadm/100)})(r)
    r.sim_makg = ((r)=>{ return r.sim_mrkg*(1-r.sim_cadm/100)})(r)
    r.sim_mptn = ((r)=>{ return r.sim_matn*(1-r.sim_plus/100)})(r)
    r.sim_mpkg = ((r)=>{ return r.sim_makg*(1-r.sim_plus/100)})(r)
    r.sim_pp = ((r)=>{
        let ls = [r.sim_p_1,r.sim_p_2,r.sim_p_3,r.sim_p_4];
        let li = [];
        for (const i in ls) {
            if (ls[i] > 0) {
                li.push(ls[i])
            }
        }
        return li.reduce(function(a, b){return a + b;})/li.length})(r)
    r.sim_pm = ((r)=>{ return r.sim_mnkg+r.sim_makg*(r.sim_plus/100)})(r)

    r.sim_mkg = ((r)=>{return r.sim_mnkg-r.sim_pc})(r)
    r.sim_mtn = ((r)=>{return r.sim_qtn*1000*r.sim_mkg})(r)
    r.sim_ikg = ((r)=>{return r.sim_mnkg-r.sim_pm})(r)
    r.sim_itn = ((r)=>{return r.sim_qtn*1000*r.sim_ikg})(r)
    

    for (const i in r) {
        $('#'+i).text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(r[i],-2).toFixed(2)))
    }
    $('.sim_mbtn').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(r.sim_mbtn,-2).toFixed(2)))
    $('.sim_mbkg').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(r.sim_mbkg,-2).toFixed(2)))
    $('.sim_gtc').text(r.sim_gtc)
    $('.sim_g').text(r.sim_g)

    val_json[0] = r;
}

