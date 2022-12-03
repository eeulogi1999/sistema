$('.login-content [data-toggle="flip1"]').click(function() {
	$("#formSelectEstablecimientos").hide();
	$("#formSelectEmpresa").hide();
	$("#formRecetPass").show();
	$("#box-log").css("transform", "rotateY(-180deg)");
	return false;
});
$('.login-content [data-toggle="flip2"]').click(function() {
	$("#formSelectEstablecimientos").hide();
	$("#formLogin").show();
	$("#box-log").css("transform", "rotateY(0deg)");
	return false;
});
$('.login-content [data-toggle="flip3"]').click(function() {
	$("#box-log").css("transform", "rotateY(-180deg)");
	return false;
});
var divLoading = document.querySelector("#divLoading");
document.addEventListener('DOMContentLoaded', function(){
	$("#formSelectEstablecimientos").hide();
	$("#formRecetPass").hide();
	if(document.querySelector("#formLogin")){
		let formLogin = document.querySelector("#formLogin");
		formLogin.onsubmit = function(e) {
			e.preventDefault();
			let gus_user = document.querySelector('#gus_user').value;
			let gus_password = document.querySelector('#gus_password').value;
			if(gus_user == "" || gus_password == ""){
				swal("Por favor", "Escribe usuario y contraseña.", "error");
				return false;
			}else{
				divLoading.style.display = "flex";
				fetch(base_url+'/Login/loginUser',{method: "POST",body:new FormData(formLogin) })
				.then(response => response.json()) 
				.then(objData => {
					if(objData.status){
						$("#formRecetPass").hide();
						$("#formSelectEmpresa").show();
						$("#box-log").css("transform", "rotateY(-180deg)");
						document.querySelector('#gac_gcl_id').innerHTML = objData.htmlOp;
					}else{
						swal("Atención", objData.msg, "error");
						document.querySelector('#gus_password').value = "";
					}
					divLoading.style.display = "none";
					return false;
				})
				.catch(error => swal("Atención","Error en el proceso: "+error, "error"))
			}
		}
	}
	if(document.querySelector("#formSelectEmpresa")){
		let formSelectEmpresa = document.querySelector("#formSelectEmpresa");
		formSelectEmpresa.onsubmit = async function(e) {
			e.preventDefault();
			divLoading.style.display = "flex";
			var objDatas = await fetch(base_url+'/Login/loginEmpresa',{method: "POST",body:new FormData(formSelectEmpresa) })
			.then(response => response.json()) 
			.then(response => {return response;})
			.catch(error => swal("Atención","Error en el proceso: "+error, "error"))
			
			if(objDatas.status){
				fetch(base_url+'/Login/getSelectEstablecimientos')
				.then(response => response.text()) 
				.then(response => {
					$("#formLogin").hide();
					$("#formSelectEstablecimientos").show();
					$("#box-log").css("transform", "rotateY(-360deg)");
					document.querySelector('#est_id').innerHTML = response;
				})
				.catch(error => swal("Atención","Error en el proceso: "+error, "error"))

			}
			else{
				window.location = base_url+'/dashboard';
			}
			divLoading.style.display = "none";
		}
	}
	if(document.querySelector("#formSelectEstablecimientos")){
		let formSelectEstablecimientos = document.querySelector("#formSelectEstablecimientos");
		formSelectEstablecimientos.onsubmit = function(e) {
			e.preventDefault();
			divLoading.style.display = "flex";
			fetch(base_url+'/Login/loginEstablecimiento',{method: "POST",body:new FormData(formSelectEstablecimientos) })
				.then(response => response.json()) 
				.then(objData => {
					if(objData.status){
						window.location = base_url+'/dashboard';
					}
					else{
						swal("Atención", objDatas.msg, "error");
					}
					divLoading.style.display = "none";
				})
				.catch(error => swal("Atención","Error en el proceso: "+error, "error"))
		}
	}

	if(document.querySelector("#formRecetPass")){		
		let formRecetPass = document.querySelector("#formRecetPass");
		formRecetPass.onsubmit = function(e) {
			e.preventDefault();

			let strEmail = document.querySelector('#txtEmailReset').value;
			if(strEmail == "")
			{
				swal("Por favor", "Escribe tu correo electrónico.", "error");
				return false;
			}else{
				divLoading.style.display = "flex";
				var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');		
				var ajaxUrl = base_url+'/Login/resetPass'; 
				var formData = new FormData(formRecetPass);
				request.open("POST",ajaxUrl,true);
				request.send(formData);
				request.onreadystatechange = function(){
					if(request.readyState != 4) return;

					if(request.status == 200){
						var objData = JSON.parse(request.responseText);
						if(objData.status)
						{
							swal({
								title: "",
								text: objData.msg,
								type: "success",
								confirmButtonText: "Aceptar",
								closeOnConfirm: false,
							}, function(isConfirm) {
								if (isConfirm) {
									window.location = base_url;
								}
							});
						}else{
							swal("Atención", objData.msg, "error");
						}
					}else{
						swal("Atención","Error en el proceso", "error");
					}
					divLoading.style.display = "none";
					return false;
				}	
			}
		}
	}

	if(document.querySelector("#formCambiarPass")){
		let formCambiarPass = document.querySelector("#formCambiarPass");
		formCambiarPass.onsubmit = function(e) {
			e.preventDefault();

			let strPassword = document.querySelector('#txtPassword').value;
			let strPasswordConfirm = document.querySelector('#txtPasswordConfirm').value;
			let idUsuario = document.querySelector('#idUsuario').value;

			if(strPassword == "" || strPasswordConfirm == ""){
				swal("Por favor", "Escribe la nueva contraseña." , "error");
				return false;
			}else{
				if(strPassword.length < 5 ){
					swal("Atención", "La contraseña debe tener un mínimo de 5 caracteres." , "info");
					return false;
				}
				if(strPassword != strPasswordConfirm){
					swal("Atención", "Las contraseñas no son iguales." , "error");
					return false;
				}
				divLoading.style.display = "flex";
				var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
				var ajaxUrl = base_url+'/Login/setPassword'; 
				var formData = new FormData(formCambiarPass);
				request.open("POST",ajaxUrl,true);
				request.send(formData);
				request.onreadystatechange = function(){
					if(request.readyState != 4) return;
					if(request.status == 200){
						var objData = JSON.parse(request.responseText);
						if(objData.status)
						{
							swal({
								title: "",
								text: objData.msg,
								type: "success",
								confirmButtonText: "Iniciar sessión",
								closeOnConfirm: false,
							}, function(isConfirm) {
								if (isConfirm) {
									window.location = base_url+'/login';
								}
							});
						}else{
							swal("Atención",objData.msg, "error");
						}
					}else{
						swal("Atención","Error en el proceso", "error");
					}
					divLoading.style.display = "none";
				}
			}
		}
	}

}, false);








