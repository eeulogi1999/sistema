var sin_table;
var url_sin = base_url+"/Cierremeses/getSiniciales/2022-08";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#sin_table")) {
        sin_table = $('#sin_table').autoTable({
            "url":url_sin ,
            "numerate": true,
            "columns":[
                {"data":"cie_bie_id.bie_codigo",header:{t:"CODIGO",c:'text'},tipo:'string',footer:"TOTALES"},
                {"data":"cie_bie_id.bie_nombre",header:{t:"MATERIAL",c:'text'},tipo:'string',footer:{ c:"sum" }},
                {"data":"cie_bie_id.bie_t6m_id.t6m_descripcion",header:{t:"U.M."},tipo:'string'},
                {"data":"cie_qs",header:{t:"SALDO",align:'right'},tipo:'float',footer:{ c:"sum" }},
                {"data":"cie_p",header:{t:"VALOR PROMEDIO",align:'right'},tipo:'float'},
                {"data":"cie_mts",header:{t:"VALORIZADO",align:'right'},tipo:'money',footer:{ c:"sum" }},
                {"data":"cie_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    //$('#gem_gde_id').loadOptions('departamentos',['gde_departamento']);
    $("#new_bien").click(function(e) {
        $("#modalTableBie").modal('show');
        setTimeout(() => {
            $$("bie_table").resize();
        }, 220);
    })
    $('#select_bie').click(function (e) {
        e.preventDefault();
        $('#sin_bie_id').children().attr('value',$$("bie_table").getSelectedItem().bie_id);
        $('#sin_bie_id').children().text($$("bie_table").getSelectedItem().bie_codigo+' - '+$$("bie_table").getSelectedItem().bie_nombre);
    });
});

window.addEventListener('load', async () => {
    sin_table = await sin_table;
    divLoading.style.display = "none";
});