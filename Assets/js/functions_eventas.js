var eve_table,sim_table, val_table,inp_table,out_table,por_table;
var url_eve = base_url+"/Movimientos/getEventas";
var url_sim = base_url+"/Movimientos/getSimulaciones";
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
            "url": url_sim,
            "numerate": true,
            "columns":[
                {"data":"sim_bie_id.bie_nombre",header:{t:"MATERIAL",align:'center'},tipo:'string'},
                {"data":"sim_created",header:"FECHA",tipo:'string'},
                {"data":"sim_q",header:{t:"CANTIDAD KG.",align:'right'},tipo:'float'},
                {"data":"sim_p",header:{t:"PRECIO/KG",align:'right'},tipo:'money'},
                {"data":"sim_m",header:{t:"VENTA BRUTA",align:'right'},tipo:'money'},
                {"data":"sim_g",header:{t:"GASTO",align:'right'},tipo:'float'},
                {"data":"sim_n",header:{t:"VENTA NETA",align:'right'},tipo:'money'},
                {"data":"sim_pp",header:{t:"P/KG MERCADO",align:'right'},tipo:'money'},
                {"data":"sim_pc",header:{t:"P/KG COMPANY",align:'right'},tipo:'money'},
                {"data":"sim_qm",header:{t:"P/KG MAXIMO",align:'right'},tipo:'money',style:{color:'danger'}}
            ]
        });
    }
    if (document.querySelector("#form_sim")) {
        val_table = $('#val_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "cell":true,
            "thid": 'sim_id',
            "rezise": false,
            "export": false,
            "columns":[
                {"data":"sim_p_1",header:{t:"PRECIO 1",align:'right'},tipo:'float'},
                {"data":"sim_p_2",header:{t:"PRECIO 2",align:'right'},tipo:'float'},
                {"data":"sim_p_3",header:{t:"PRECIO 3",align:'right'},tipo:'float'},
                {"data":"sim_p_4",header:{t:"PRECIO 4",align:'right'},tipo:'float'},
                {"data":"sim_prom",render:(r)=>{ return (r.sim_p_1+r.sim_p_2+r.sim_p_3+r.sim_p_4)/4 },header:{t:"PRECIO PROMEDIO",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_p",header:{t:"PRECIO CACEL",align:'right'},tipo:'float',style:{bg:'warning'}},
                {"data":"sim_pmax",render:(r)=>{ return r.sim_mnkg+r.sim_mpkg},header:{t:"PRECIO MAXIMO",align:'right'},tipo:'float',style:{bg:'danger'}}
            ],
            "copyCellEditOrigin": async ()=>{
                // por_table.reload()
                // out_table.reload()
                // inp_table.reload()
            }
        });
        inp_table = $('#inp_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "cell":true,
            "rezise": false,
            "thid": 'sim_id',
            "export": false,
            "columns":[
                {"data":"sim_qtn",header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_qkg",header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_ptn",header:{t:"P/TN",align:'right'},tipo:'float'},
                {"data":"sim_pkg",render:(r)=>{return r.sim_ptn/1000},header:{t:"P/KG",align:'right'},tipo:'float'},
                {"data":"sim_gtc",header:{t:"T.C. SUNAT",align:'right'},tipo:'float'},
                {"data":"sim_mbtn",render:(r)=>{return r.sim_qtn*r.sim_ptn*r.sim_gtc},header:{t:"M. BRUTO/TN",align:'right'},tipo:'float'},
                {"data":"sim_mbkg",render:(r)=>{return r.sim_qkg*r.sim_pkg*r.sim_gtc},header:{t:"M. BRUTO/KG",align:'right'},tipo:'float'},
                {"data":"sim_g",header:{t:"GASTO",align:'right'},tipo:'float',style:{bg:'danger'}},
                {"data":"sim_mntn",render:(r)=>{return r.sim_mbtn-(r.sim_g*1000*r.sim_qtn)},header:{t:"M. NETO/TN",align:'right'},tipo:'float'},
                {"data":"sim_mnkg",render:(r)=>{return r.sim_mbkg-(r.sim_g*r.sim_qkg)},header:{t:"M. NETO/KG",align:'right'},tipo:'float'}
            ],
            "copyCellEditOrigin": async ()=>{
                por_table.reload()
                setTimeout(() => {
                    out_table.reload()
                    setTimeout(() => {
                        val_table.reload()
                    }, 50);
                }, 50);
            }
        });
        por_table = $('#por_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "cell":true,
            "thid": 'sim_id',
            "rezise": false,
            "export": false,
            "columns":[
                {"data":"sim_exp",header:{t:"% COM.",align:'right'},tipo:'float'},
                {"data":"sim_igv",header:{t:"% IGV",align:'right'},tipo:'float'},
                {"data":"sim_imp",header:{t:"% IMP.",align:'right'},tipo:'float'},
                {"data":"sim_cadm",header:{t:"% C. ADM",align:'right'},tipo:'float'},
                {"data":"sim_plus",header:{t:"% PLUS",align:'right'},edit:'text',tipo:'float'},
            ],
            "copyCellEditOrigin": async ()=>{
                //inp_table.reload()
                setTimeout(() => {
                    out_table.reload()
                    setTimeout(() => {
                        val_table.reload()
                    }, 50);
                }, 50);

            }
        });
        out_table = $('#out_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "rezise": false,
            "cell":true,
            "thid": 'sim_id',
            "export": false,
            "columns":[
                {"data":"sim_mbtn",header:{t:"M. BRUTO/TN",align:'right'},tipo:'float',style:{bg:'primary'}},
                {"data":"sim_mbkg",header:{t:"M. BRUTO/KG",align:'right'},tipo:'float',style:{bg:'primary'}},
                {"data":"sim_mxtn",render:(r)=>{ return r.sim_mbtn*r.sim_exp/100},header:{t:"M. C./TN",align:'right'},tipo:'float',style:{bg:'success'}},
                {"data":"sim_mxkg",render:(r)=>{ return r.sim_mbkg*r.sim_exp/100},header:{t:"M. C./KG",align:'right'},tipo:'float',style:{bg:'success'}},
                {"data":"sim_migtn",render:(r)=>{ return r.sim_mxtn*r.sim_igv/100},header:{t:"M. IGV/TN",align:'right'},tipo:'float',style:{bg:'secondary'}},
                {"data":"sim_migkg",render:(r)=>{ return r.sim_mxkg*r.sim_igv/100},header:{t:"M. IGV/KG",align:'right'},tipo:'float',style:{bg:'secondary'}},
                {"data":"sim_miptn",render:(r)=>{ return r.sim_mbtn*r.sim_imp/100},header:{t:"M. IMP/TN",align:'right'},tipo:'float'},
                {"data":"sim_mipkg",render:(r)=>{ return r.sim_mbkg*r.sim_imp/100},header:{t:"M. IMP/KG",align:'right'},tipo:'float'},
                {"data":"sim_mrtn",render:(r)=>{ return r.sim_migtn-r.sim_miptn},header:{t:"M.R./TN",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_mrkg",render:(r)=>{ return r.sim_migkg-r.sim_mipkg},header:{t:"M.R./KG",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_matn",render:(r)=>{ return r.sim_mrtn*r.sim_cadm/100},header:{t:"M. ADM./TN",align:'right'},tipo:'float'},
                {"data":"sim_makg",render:(r)=>{ return r.sim_mrkg*r.sim_cadm/100},header:{t:"M. ADM./KG",align:'right'},tipo:'float'},
                {"data":"sim_mptn",render:(r)=>{ return r.sim_matn*r.sim_plus/100},header:{t:"M. NETO/TN",align:'right'},tipo:'float',style:{bg:'danger'}},
                {"data":"sim_mpkg",render:(r)=>{ return r.sim_makg*r.sim_plus/100},header:{t:"M. NETO/KG",align:'right'},tipo:'float',style:{bg:'danger'}}
            ],
            "copyCellEditOrigin": async ()=>{
                por_table.reload()
                // val_table.reload()
                // inp_table.reload()
            }
        });
    }

});

window.addEventListener('load', async () => {
    if (document.querySelector("#eve_table")) {
        eve_table = await eve_table;
    }
    if (document.querySelector("#sim_table")) {
        sim_table = await sim_table;
    }
    if (document.querySelector("#form_sim")) {
        inp_table = await inp_table;
        por_table = await por_table;
        out_table = await out_table;
        val_table = await val_table;
        
    }
    divLoading.style.display = "none";
});
function openModalSim() {
    let r = {};
    r.sim_id=0
    r.sim_p_1=29
    r.sim_p_2=29
    r.sim_p_3=29
    r.sim_p_4=29
    r.sim_prom=(r.sim_p_1+r.sim_p_2+r.sim_p_3+r.sim_p_4)/4  //
    r.sim_p=29
    r.sim_p=29
    r.sim_qtn = 20
    r.sim_qkg = 1
    r.sim_ptn = 8205
    r.sim_pkg = r.sim_ptn/1000
    r.sim_gtc = parseFloat(data.sim.sim_gtc)
    r.sim_mbtn = r.sim_qtn*r.sim_ptn*r.sim_gtc
    r.sim_mbkg = r.sim_qkg*r.sim_pkg*r.sim_gtc
    r.sim_g = 0.56
    r.sim_mntn = r.sim_mbtn-(r.sim_g*1000*r.sim_qtn)
    r.sim_mnkg = r.sim_mbkg-(r.sim_g*r.sim_qkg)
    r.sim_exp = 93
    r.sim_mxtn = r.sim_mbtn*r.sim_exp/100
    r.sim_mxkg = r.sim_mbkg*r.sim_exp/100
    r.sim_igv = 18
    r.sim_migtn = r.sim_mxtn*r.sim_igv/100
    r.sim_migkg = r.sim_mxkg*r.sim_igv/100
    r.sim_imp = 3.5
    r.sim_miptn = r.sim_mbtn*r.sim_imp/100
    r.sim_mipkg = r.sim_mbkg*r.sim_imp/100
    r.sim_mrtn = r.sim_migtn-r.sim_miptn
    r.sim_mrkg = r.sim_migkg-r.sim_mipkg
    r.sim_cadm = 55
    r.sim_matn = r.sim_mrtn*r.sim_cadm/100
    r.sim_makg = r.sim_mrkg*r.sim_cadm/100
    r.sim_plus = 0
    r.sim_mptn = r.sim_matn*r.sim_plus/100
    r.sim_mpkg = r.sim_makg*r.sim_plus/100
    r.sim_pmax = r.sim_mnkg-r.sim_mpkg    //


    val_json[0] = r;
    val_table.reload();
    inp_table.reload();
    por_table.reload();
    out_table.reload();
}

