$('.date-picker').datepicker( {
    closeText: 'Cerrar',
	prevText: '<Ant',
	nextText: 'Sig>',
	currentText: 'Hoy',
	monthNames: ['1 -', '2 -', '3 -', '4 -', '5 -', '6 -', '7 -', '8 -', '9 -', '10 -', '11 -', '12 -'],
	monthNamesShort: ['Enero','Febrero','Marzo','Abril', 'Mayo','Junio','Julio','Agosto','Septiembre', 'Octubre','Noviembre','Diciembre'],
    changeMonth: true,
    changeYear: true,
    showButtonPanel: true,
    dateFormat: 'MM yy',
    showDays: false,
    onClose: function(dateText, inst) {
        $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
    }
});

function fntSearchCMes(){
    let fecha = document.querySelector("#comprasMes").value;
    if(fecha == ""){
        swal("", "Seleccione mes y año" , "error");
        return false;
    }else{
        let request = (window.XMLHttpRequest) ? 
            new XMLHttpRequest() : 
            new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url+'/Dashboard/comprasMes';
        divLoading.style.display = "flex";
        let formData = new FormData();
        formData.append('fecha',fecha);
        request.open("POST",ajaxUrl,true);
        request.send(formData);
        request.onreadystatechange = function(){
            if(request.readyState != 4) return;
            if(request.status == 200){
                $("#graficasCompraMes").html(request.responseText);
                divLoading.style.display = "none";
                return false;
            }
        }
    }
}

function fntSearchVMes(){
    let fecha = document.querySelector("#ventasMes").value;
    if(fecha == ""){
        swal("", "Seleccione mes y año" , "error");
        return false;
    }else{
        let request = (window.XMLHttpRequest) ? 
            new XMLHttpRequest() : 
            new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url+'/Dashboard/ventasMes';
        divLoading.style.display = "flex";
        let formData = new FormData();
        formData.append('fecha',fecha);
        request.open("POST",ajaxUrl,true);
        request.send(formData);
        request.onreadystatechange = function(){
            if(request.readyState != 4) return;
            if(request.status == 200){
                $("#graficasVentasMes").html(request.responseText);
                divLoading.style.display = "none";
                return false;
            }
        }
    }
}
// Cambio de color Procesos

// document.getElementById("fase1").addEventListener("click", cambios1);
// document.getElementById("fase2").addEventListener("click", cambios2);
// document.getElementById("fase3").addEventListener("click", cambios3);


// function cambios1() {

//     document.getElementById("fase1").className="selected";
//     document.getElementById("fase3").className="done";
//     document.getElementById("fase2").className="done";
// }
// function cambios2() {

//  document.getElementById("fase2").className="selected";
//  document.getElementById("fase3").className="done";
// document.getElementById("fase1").className="done";  


// }
// function cambios3() {
  
    
//     document.getElementById("fase3").className="selected";
//     document.getElementById("fase1").className="done";
//     document.getElementById("fase2").className="done";
// }