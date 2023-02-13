var sim_table,nac_table;
var url_sim = base_url+"/Movimientos/getSimulaciones/";
var val_json = {};
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
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

    $('#sim_bie_id').loadOptions('bienes',['bie_nombre'],{'bie_status':1});
    document.querySelector("body").style.overflowY = 'auto';

});

window.addEventListener('load', async () => {
    if (document.querySelector("#sim_table")) {
        sim_table = await sim_table;
        sim_table.rezise()
    }
    if (document.querySelector("#nac_table")) {
        nac_table = await nac_table;
        nac_table.rezise()
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
    val_json[0] = r;
    reload()
}

function editCell(i,e) {
    e.preventDefault();
    e.stopPropagation();
    val_json[0][i] = parseFloat(e.target.value) 
    reload()
}
function reload() {
    val_json[0].sim_pkg = ((r)=>{
        if (r.sim_tipo == 1) {
            return r.sim_ptn/1000
        } else {
            return r.sim_pkg
        }
    })(val_json[0])
    val_json[0].sim_mbkg = ((r)=>{
        if (r.sim_tipo == 1) {
            return r.sim_qkg*r.sim_pkg*r.sim_gtc
        } else {
            return r.sim_pkg
        }
    })(val_json[0])
    val_json[0].sim_mbtn = ((r)=>{
        if (r.sim_tipo == 1) {
            return r.sim_qtn*r.sim_ptn*r.sim_gtc
        } else {
            return r.sim_pkg*1000*r.sim_qtn
        }
    })(val_json[0])
    val_json[0].sim_mntn = ((r)=>{return r.sim_mbtn-(r.sim_g*1000*r.sim_qtn)})(val_json[0])
    val_json[0].sim_mnkg = ((r)=>{return r.sim_mbkg-(r.sim_g*r.sim_qkg)})(val_json[0])
    val_json[0].sim_mxtn = ((r)=>{ return r.sim_mbtn*r.sim_exp/100})(val_json[0])
    val_json[0].sim_mxkg = ((r)=>{ return r.sim_mbkg*r.sim_exp/100})(val_json[0])
    val_json[0].sim_migtn = ((r)=>{ return r.sim_mxtn*r.sim_igv/100})(val_json[0])
    val_json[0].sim_migkg = ((r)=>{ return r.sim_mxkg*r.sim_igv/100})(val_json[0])
    val_json[0].sim_miptn = ((r)=>{ return r.sim_mbtn*r.sim_imp/100})(val_json[0])
    val_json[0].sim_mipkg = ((r)=>{ return r.sim_mbkg*r.sim_imp/100})(val_json[0])
    val_json[0].sim_mrtn = ((r)=>{ return r.sim_migtn-r.sim_miptn})(val_json[0])
    val_json[0].sim_mrkg = ((r)=>{ return r.sim_migkg-r.sim_mipkg})(val_json[0])

    val_json[0].sim_matn = ((r)=>{ return r.sim_mrtn*(r.sim_cadm/100)})(val_json[0])
    val_json[0].sim_makg = ((r)=>{ return r.sim_mrkg*(r.sim_cadm/100)})(val_json[0])
    val_json[0].sim_msatn = ((r)=>{ return r.sim_mrtn-r.sim_matn})(val_json[0])
    val_json[0].sim_msakg = ((r)=>{ return r.sim_mrkg-r.sim_makg})(val_json[0])

    val_json[0].sim_mptn = ((r)=>{ return r.sim_msatn*(r.sim_plus/100)})(val_json[0])
    val_json[0].sim_mpkg = ((r)=>{ return r.sim_msakg*(r.sim_plus/100)})(val_json[0])
    val_json[0].sim_msptn = ((r)=>{ return r.sim_msatn-r.sim_mptn})(val_json[0])
    val_json[0].sim_mspkg = ((r)=>{ return r.sim_msakg-r.sim_mpkg})(val_json[0])


    val_json[0].sim_pp = ((r)=>{
        let ls = [r.sim_p_1,r.sim_p_2,r.sim_p_3,r.sim_p_4];
        let li = [];
        for (const i in ls) {
            if (ls[i] > 0) {
                li.push(ls[i])
            }
        }
        return li.reduce(function(a, b){return a + b;})/li.length})(val_json[0])
    val_json[0].sim_pm = ((r)=>{ return r.sim_mnkg+r.sim_msakg*(r.sim_plus/100)})(val_json[0])

    val_json[0].sim_mkg = ((r)=>{return r.sim_mnkg-r.sim_pc})(val_json[0])
    val_json[0].sim_mtn = ((r)=>{return r.sim_qtn*1000*r.sim_mkg})(val_json[0])
    val_json[0].sim_ikg = ((r)=>{return r.sim_mnkg-r.sim_pm})(val_json[0])
    val_json[0].sim_itn = ((r)=>{return r.sim_qtn*1000*r.sim_ikg})(val_json[0])
    

    for (const i in val_json[0]) {
        if (i == 'sim_bie_id' || i == "sim_obs") {
            $('#'+i).val(val_json[0][i])           
        } else {
            $('#'+i).text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(val_json[0][i],-2).toFixed(2)))
        }
        
    }
    $('#sim_exp').text(val_json[0].sim_exp)
    $('#sim_igv').text(val_json[0].sim_igv)
    $('#sim_imp').text(val_json[0].sim_imp)
    $('#sim_cadm').text(val_json[0].sim_cadm)
    $('#sim_plus').text(val_json[0].sim_plus)
    $('#sim_qtn').text(val_json[0].sim_qtn)
    $('#sim_qkg').text(val_json[0].sim_qkg)
    $('#sim_ptn').text(Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(Math.ceil10(val_json[0].sim_ptn,-2).toFixed(2)))
    $('#sim_pkg').text(Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(Math.ceil10(val_json[0].sim_pkg,-2).toFixed(2)))
    $('.sim_mbtn').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(val_json[0].sim_mbtn,-2).toFixed(2)))
    $('.sim_mbkg').text(Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(val_json[0].sim_mbkg,-2).toFixed(2)))
    $('.sim_gtc').text(val_json[0].sim_gtc)
    $('.sim_g').text(val_json[0].sim_g)

    var es = ['#sim_qtn','#sim_qkg','#sim_ptn','#sim_pkg','.sim_gtc','.sim_g','#sim_p_1','#sim_p_2','#sim_p_3','#sim_p_4','#sim_pc','#sim_exp','#sim_igv','#sim_imp','#sim_cadm','#sim_plus','.sim_mbkg']
    for (const i in es) {
        $(es[i]).dblclick(function(){
            let e =  es[i].substring(1, es[i].length)
            if (e == 'sim_mbkg') { 
                $(this).html('<input type="text" value="'+val_json[0][e]+'" size="10" onChange="editCell(`sim_pkg`,event)">') 
            } else {
                $(this).html('<input type="text" value="'+val_json[0][e]+'" size="10" onChange="editCell(`'+e+'`,event)">')  
            }
        })
    }
    if (data.sim.sim_tipo == 2) {
        $('#inp_table tr > *:nth-child(3)').hide();
        $('#inp_table tr > *:nth-child(4)').hide();
        $('#por_table tr > *:nth-child(1)').hide();
        $('#out_table tr > *:nth-child(3)').hide();
        $('#por_table thead tr > *:nth-child(2)').text('DETRACCION');
        $('#out_table thead tr > *:nth-child(4)').text('DETRACCION');
        $('#inp_table .sim_mbkg').removeClass('bg-dark-lite');
    }else{
        $('#inp_table tr > *:nth-child(3)').css('display','table-cell');
        $('#inp_table tr > *:nth-child(4)').css('display','table-cell');
        $('#por_table tr > *:nth-child(1)').css('display','table-cell');
        $('#out_table tr > *:nth-child(3)').css('display','table-cell');
        $('#por_table thead tr > *:nth-child(2)').text('% IGV');
        $('#out_table thead tr > *:nth-child(4)').text('IGV');
        $('#inp_table .sim_mbkg').addClass('bg-dark-lite');
    }
    if (!parseInt(data.per.gtp_u)) {
        $('#por_table').hide()
        $('#out_table').hide()
    }
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
    return {json}; 
}
function setPosSim(where,json,res) {
    sim_table.reload()
    nac_table.reload()
    return true; 
}
function delPosSim(where,json,res) {
    sim_table.reload()
    nac_table.reload()
    return true; 
}
async function getPosSim() {
    val_json[0] = data.simId
    data.sim.sim_tipo = parseInt(data.simId.sim_tipo)
    val_json[0].sim_gtc = (data.simId.sim_tce_id.tce_compra)?data.simId.sim_tce_id.tce_compra:data.simId.sim_tce_id.tce_gtc_id.gtc_tcompra
    val_json[0].sim_gus_id = data.simId.sim_gus_id.gus_id
    val_json[0].sim_bie_id = data.simId.sim_bie_id.bie_id 
    val_json[0].sim_tce_id = data.simId.sim_tce_id.tce_id
    for (const r in val_json[0]) {
        if (r == "sim_obs") {
            val_json[0][r] = val_json[0][r]
        } else {
            val_json[0][r] = parseFloat(val_json[0][r]) 
        }   
    }
    reload();
}




