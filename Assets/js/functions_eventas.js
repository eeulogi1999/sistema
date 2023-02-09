var eve_table,sim_table,nac_table, val_table,inp_table,out_table,por_table,res_table;
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
    if (document.querySelector("#form_sim")) {
        inp_table = $('#inp_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "cell":true,
            "rezise": false,
            "thid": 'sim_id',
            "export": false,
            "columns":[
                {"data":"sim_qtn",head:{t:'CANTIDAD',colspan:2},header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_qkg",header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_ptn",head:{t:'PRECIO',colspan:2},header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_pkg",render:(r)=>{
                    if (r.sim_tipo == 1) {
                        return r.sim_ptn/1000
                    } else {
                        return r.sim_pkg
                    }
                },header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_gtc",header:{t:"T.C. SUNAT",align:'right'},tipo:'float'},
                {"data":"sim_mbtn",head:{t:'MONTO SOLES',colspan:2},render:(r)=>{
                    if (r.sim_tipo == 1) {
                        return r.sim_qtn*r.sim_ptn*r.sim_gtc
                    } else {
                        return r.sim_pkg*1000*r.sim_qtn
                    }
                },header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_mbkg",render:(r)=>{
                    if (r.sim_tipo == 1) {
                        return r.sim_qkg*r.sim_pkg*r.sim_gtc
                    } else {
                        return r.sim_pkg
                    }
                },header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_g",header:{t:"GASTO",align:'right'},tipo:'float',style:{bg:'danger'}},
                {"data":"sim_mntn",head:{t:'PRECIO',colspan:2},render:(r)=>{return r.sim_mbtn-(r.sim_g*1000*r.sim_qtn)},header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_mnkg",render:(r)=>{return r.sim_mbkg-(r.sim_g*r.sim_qkg)},header:{t:"KG",align:'right'},tipo:'float'}
            ],
            "copyCellEditOrigin": async ()=>{
                por_table.reload()
                setTimeout(() => {
                    out_table.reload()
                    setTimeout(() => {
                        val_table.reload()
                        setTimeout(() => {
                            res_table.reload()
                            setTimeout(() => {
                                if (data.sim.sim_tipo == 2) {
                                    $('#inp_table tr > *:nth-child(4)').hide();
                                    $('#inp_table tr > *:nth-child(5)').hide();
                                    $('#inp_table tr > *:nth-child(6)').hide();
                                    $('#out_table tr > *:nth-child(4)').hide();
                                    $('#out_table tr > *:nth-child(5)').hide();
                                    $('#por_table tr > *:nth-child(2)').hide();
                                }
                            }, 50);
                        }, 50);
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
                {"data":"sim_exp",header:{t:"% COM.",align:'right'},tipo:'float',style:{bg:'success'}},
                {"data":"sim_igv",header:{t:"% IGV",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_imp",header:{t:"% IMP.",align:'right'},tipo:'float',style:{bg:'primary'}},
                {"data":"sim_cadm",header:{t:"% C. ADM",align:'right'},tipo:'float',style:{bg:'warning'}},
                {"data":"sim_plus",header:{t:"% PLUS",align:'right'},edit:'text',tipo:'float',style:{bg:'danger'}}
            ],
            "copyCellEditOrigin": async ()=>{
                setTimeout(() => {
                    out_table.reload()
                    setTimeout(() => {
                        val_table.reload()
                        setTimeout(() => {
                            res_table.reload()
                            setTimeout(() => {
                                if (data.sim.sim_tipo == 2) {
                                    $('#inp_table tr > *:nth-child(4)').hide();
                                    $('#inp_table tr > *:nth-child(5)').hide();
                                    $('#inp_table tr > *:nth-child(6)').hide();
                                    $('#out_table tr > *:nth-child(4)').hide();
                                    $('#out_table tr > *:nth-child(5)').hide();
                                    $('#por_table tr > *:nth-child(2)').hide();
                                }
                            }, 50);
                        }, 50);
                    }, 50);
                }, 50);

            }
        });
        out_table = $('#out_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "rezise": false,
            "export": false,
            "columns":[
                {"data":"sim_mbtn",header:{t:"TN",align:'right'},head:{t:'MONTO BRUTO',colspan:2},tipo:'float'},
                {"data":"sim_mbkg",header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_mxtn",render:(r)=>{ return r.sim_mbtn*r.sim_exp/100},head:{t:'COMPRA',colspan:2},header:{t:"TN",align:'right'},tipo:'float',style:{bg:'success'}},
                {"data":"sim_mxkg",render:(r)=>{ return r.sim_mbkg*r.sim_exp/100},header:{t:"KG",align:'right'},tipo:'float',style:{bg:'success'}},
                {"data":"sim_migtn",render:(r)=>{ return r.sim_mxtn*r.sim_igv/100},head:{t:'IGV',colspan:2},header:{t:"TN",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_migkg",render:(r)=>{ return r.sim_mxkg*r.sim_igv/100},header:{t:"KG",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_miptn",render:(r)=>{ return r.sim_mbtn*r.sim_imp/100},head:{t:'IMPUESTO',colspan:2},header:{t:"TN",align:'right'},tipo:'float',style:{bg:'primary'}},
                {"data":"sim_mipkg",render:(r)=>{ return r.sim_mbkg*r.sim_imp/100},header:{t:"KG",align:'right'},tipo:'float',style:{bg:'primary'}},
                {"data":"sim_mrtn",render:(r)=>{ return r.sim_migtn-r.sim_miptn},head:{t:'RETORNO',colspan:2},header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_mrkg",render:(r)=>{ return r.sim_migkg-r.sim_mipkg},header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_matn",render:(r)=>{ return r.sim_mrtn*(1-r.sim_cadm/100)},head:{t:'GASTO ADM.',colspan:2},header:{t:"TN",align:'right'},tipo:'float',style:{bg:'warning'}},
                {"data":"sim_makg",render:(r)=>{ return r.sim_mrkg*(1-r.sim_cadm/100)},header:{t:"KG",align:'right'},tipo:'float',style:{bg:'warning'}},
                {"data":"sim_mptn",render:(r)=>{ return r.sim_matn*(1-r.sim_plus/100)},head:{t:'MONTO NETO',colspan:2},header:{t:"TN",align:'right'},tipo:'float',style:{bg:'danger'}},
                {"data":"sim_mpkg",render:(r)=>{ return r.sim_makg*(1-r.sim_plus/100)},header:{t:"KG",align:'right'},tipo:'float',style:{bg:'danger'}}
            ],
            "copyCellEditOrigin": async ()=>{
                //por_table.reload()
            }
        });
        val_table = $('#val_table').autoTable({
            "src": 'val_json',
            "numerate": true,
            "cell":true,
            "thid": 'sim_id',
            "rezise": false,
            "export": false,
            "columns":[
                {"data":"sim_p_1",header:{t:"L. NORTE",align:'right'},head:{t:'PRECIOS DEL MERCADO',colspan:4},tipo:'float'},
                {"data":"sim_p_2",header:{t:"L. CENTRO",align:'right'},tipo:'float'},
                {"data":"sim_p_3",header:{t:"L. SUR",align:'right'},tipo:'float'},
                {"data":"sim_p_4",header:{t:"L. OTROS",align:'right'},tipo:'float'},
                {"data":"sim_pp",render:(r)=>{ 
                    let ls = [r.sim_p_1,r.sim_p_2,r.sim_p_3,r.sim_p_4];
                    let li = [];
                    for (const i in ls) {
                        if (ls[i] > 0) {
                            li.push(ls[i])
                        }
                    }
                    return li.reduce(function(a, b){return a + b;})/li.length},
                header:{t:"PRECIO PROMEDIO",align:'right'},tipo:'float',style:{bg:'info'}},
                {"data":"sim_pc",header:{t:"PRECIO CACEL",align:'right'},tipo:'float',style:{bg:'warning'}},
                {"data":"sim_pm",render:(r)=>{ return r.sim_mnkg+r.sim_makg*(r.sim_plus/100)},header:{t:"PRECIO MAXIMO",align:'right'},tipo:'float',style:{bg:'danger'}}
            ],
            "copyCellEditOrigin": async ()=>{
                res_table.reload()
                setTimeout(() => {
                    if (data.sim.sim_tipo == 2) {
                        $('#inp_table tr > *:nth-child(4)').hide();
                        $('#inp_table tr > *:nth-child(5)').hide();
                        $('#inp_table tr > *:nth-child(6)').hide();
                        $('#out_table tr > *:nth-child(4)').hide();
                        $('#out_table tr > *:nth-child(5)').hide();
                        $('#por_table tr > *:nth-child(2)').hide();
                    }
                }, 50);
            }
        });
        res_table = $('#res_table').autoTable({
            "src": 'val_json',
            "rezise": false,
            "export": false,
            "columns":[
                {"data":"sim_mkg",render:(r)=>{return r.sim_mnkg-r.sim_pc},head:{t:'MARGEN',colspan:2},header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_mtn",render:(r)=>{return r.sim_qtn*1000*r.sim_mkg},header:{t:"TN",align:'right'},tipo:'float'},
                {"data":"sim_ikg",render:(r)=>{return r.sim_mnkg-r.sim_pm},head:{t:'INVERSION',colspan:2},header:{t:"KG",align:'right'},tipo:'float'},
                {"data":"sim_itn",render:(r)=>{return r.sim_qtn*1000*r.sim_ikg},header:{t:"TN",align:'right'},tipo:'float'}
            ],
            "copyCellEditOrigin": async ()=>{}
        });
        $('#sim_bie_id').loadOptions('bienes',['bie_nombre'],{'bie_status':1});
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
    if (document.querySelector("#form_sim")) {
        inp_table = await inp_table;
        por_table = await por_table;
        out_table = await out_table;
        val_table = await val_table;
        res_table = await res_table;
    }
    divLoading.style.display = "none";
});
function openModalC(t) {
    if (!parseInt(data.per.gtp_u)) {
        $('#por_table').hide()
        $('#out_table').hide()
    }
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
    val_json[0] = r;
    inp_table.reload();
    setTimeout(() => {
        por_table.reload();
        setTimeout(() => {
            out_table.reload();
            setTimeout(() => {
                val_table.reload();
                setTimeout(() => {
                    res_table.reload();
                    setTimeout(() => {
                        if (data.sim.sim_tipo == 2) {
                            $('#inp_table tbody tr > *:nth-child(4)').hide();
                            $('#inp_table thead tr:eq(1) > *:nth-child(4)').hide();
                            $('#inp_table thead tr:eq(0) > *:nth-child(3)').hide();
                            $('#inp_table tfoot tr > *:nth-child(4)').hide();
                            $('#inp_table tbody tr > *:nth-child(5)').hide();
                            $('#inp_table thead tr:eq(1) > *:nth-child(5)').hide();
                            $('#inp_table tfoot tr > *:nth-child(5)').hide();
                            $('#inp_table tbody tr > *:nth-child(6)').hide();
                            $('#inp_table thead tr:eq(1) > *:nth-child(6)').hide();
                            $('#inp_table thead tr:eq(0) > *:nth-child(4)').hide();
                            $('#inp_table tfoot tr > *:nth-child(6)').hide();
                            $('#out_table tbody tr > *:nth-child(4)').hide();
                            $('#out_table tfoot tr > *:nth-child(4)').hide();
                            $('#out_table thead tr:eq(1) > *:nth-child(4)').hide();
                            $('#out_table thead tr:eq(0) > *:nth-child(3)').hide();
                            $('#out_table tbody tr > *:nth-child(5)').hide();
                            $('#out_table tfoot tr > *:nth-child(5)').hide();
                            $('#out_table thead tr:eq(1) > *:nth-child(5)').hide();
                            $('#out_table thead tr:eq(0) > *:nth-child(4)').text('DETRACCION');
                            $('#por_table tr > *:nth-child(2)').hide();
                            $('#por_table tr:eq(1) > th:nth-child(3)').text('% DET+IGV')
                            $('#out_table tr:eq(1) > th:nth-child(6)').text('DET/TN')
                            $('#out_table tr:eq(1) > th:nth-child(7)').text('DET/KG')
                        }else{
                            $('#inp_table tr > *').css('display','table-cell');
                            $('#por_table tr > *').css('display','table-cell');
                            $('#out_table tr > *').css('display','table-cell');
                            $('#out_table thead tr:eq(0) > *:nth-child(4)').text('IGV');
                            $('#por_table tr:eq(1) > th:nth-child(3)').text('% IGV')
                            $('#out_table tr:eq(1) > th:nth-child(6)').text('IGV/TN')
                            $('#out_table tr:eq(1) > th:nth-child(7)').text('IGV/KG')
                        }
                    }, 50);
                }, 50);
            }, 50);
        }, 50);
    }, 50);
}
function setPreSim(where,json,res) {
    if (val_json[0].sim_gtc != data.sim.sim_gtc) {
       set('tce',{tce_id:data.sim.sim_tce_id,tce_compra:val_json[0].sim_gtc}) 
    }
    if (parseInt(val_json[0].sim_id)>0) {
        json.sim_obs = $('#sim_obs').val()
        json = {...val_json[0],...data,...json}
        delete json.sim_created;
    } else {
        json = {...data.sim,...json,...val_json[0]}
    }
    inp_table.clear()
    por_table.clear()
    out_table.clear()
    val_table.clear()
    res_table.clear()
    return {json}; 
}
function setPosSim(where,json,res) {
    nac_table.reload()
    return true; 
}
function delPosSim(where,json,res) {
    nac_table.reload()
    return true; 
}
async function getPosSim() {
    if (!parseInt(data.per.gtp_u)) {
        $('#por_table').hide()
        $('#out_table').hide()
    }
    val_json[0] = data.simId
    data.sim.sim_tipo = parseInt(data.simId.sim_tipo)
    val_json[0].sim_gtc = (data.simId.sim_tce_id.tce_compra)?data.simId.sim_tce_id.tce_compra:data.simId.sim_tce_id.tce_gtc_id.gtc_tcompra
    val_json[0].sim_gus_id = data.simId.sim_gus_id.gus_id
    val_json[0].sim_bie_id = data.simId.sim_bie_id.bie_id 
    val_json[0].sim_tce_id = data.simId.sim_tce_id.tce_id
    for (const r in data.simId) {
        val_json[0][r] = parseFloat(data.simId[r])
    }
    inp_table.reload();
    setTimeout(() => {
        por_table.reload();
        setTimeout(() => {
            out_table.reload();
            setTimeout(() => {
                val_table.reload();
                setTimeout(() => {
                    res_table.reload();
                    setTimeout(() => {
                        if (data.sim.sim_tipo == 2) {
                            $('#inp_table tbody tr > *:nth-child(4)').hide();
                            $('#inp_table thead tr:eq(1) > *:nth-child(4)').hide();
                            $('#inp_table thead tr:eq(0) > *:nth-child(3)').hide();
                            $('#inp_table tfoot tr > *:nth-child(4)').hide();
                            $('#inp_table tbody tr > *:nth-child(5)').hide();
                            $('#inp_table thead tr:eq(1) > *:nth-child(5)').hide();
                            $('#inp_table tfoot tr > *:nth-child(5)').hide();
                            $('#inp_table tbody tr > *:nth-child(6)').hide();
                            $('#inp_table thead tr:eq(1) > *:nth-child(6)').hide();
                            $('#inp_table thead tr:eq(0) > *:nth-child(4)').hide();
                            $('#inp_table tfoot tr > *:nth-child(6)').hide();
                            $('#out_table tbody tr > *:nth-child(4)').hide();
                            $('#out_table tfoot tr > *:nth-child(4)').hide();
                            $('#out_table thead tr:eq(1) > *:nth-child(4)').hide();
                            $('#out_table thead tr:eq(0) > *:nth-child(3)').hide();
                            $('#out_table tbody tr > *:nth-child(5)').hide();
                            $('#out_table tfoot tr > *:nth-child(5)').hide();
                            $('#out_table thead tr:eq(1) > *:nth-child(5)').hide();
                            $('#out_table thead tr:eq(0) > *:nth-child(4)').text('DETRACCION');
                            $('#por_table tr > *:nth-child(2)').hide();
                            $('#por_table tr:eq(1) > th:nth-child(3)').text('% DET+IGV')
                            $('#out_table tr:eq(1) > th:nth-child(6)').text('DET/TN')
                            $('#out_table tr:eq(1) > th:nth-child(7)').text('DET/KG')
                        }else{
                            $('#inp_table tr > *').css('display','table-cell');
                            $('#por_table tr > *').css('display','table-cell');
                            $('#out_table tr > *').css('display','table-cell');
                            $('#out_table thead tr:eq(0) > *:nth-child(4)').text('IGV');
                            $('#por_table tr:eq(1) > th:nth-child(3)').text('% IGV')
                            $('#out_table tr:eq(1) > th:nth-child(6)').text('IGV/TN')
                            $('#out_table tr:eq(1) > th:nth-child(7)').text('IGV/KG')
                        }
                    }, 50);
                }, 50);
            }, 50);
        }, 50);
    }, 50);
}
