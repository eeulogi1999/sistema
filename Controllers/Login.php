<?php 
@ob_start();
	class Login extends Controllers{
		public function __construct(){		
			parent::__construct('usuarios');
			$this->newModel("accesos");
			$this->newModel("clientes");
		}
		public function login(){
			$data['page_tag'] = "Login - Sistema";
			$data['page_title'] = "Sistema CompanyCacel";
			$data['page_name'] = "login";
			$data['page_data'] = array();
			$data['page_functions_js'] = "functions_login.js";
			$this->views->getView($this,"login",$data);
		}	
		public function loginUser(){
			if($_POST){
				if(empty($_POST['gus_user']) || empty($_POST['gus_password'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de datos' );
				}else{
					$gus_user  =  strtolower(strClean($_POST['gus_user']));
					$gus_password = hash("SHA256",$_POST['gus_password']);
					$arrData = $this->usuarios->searchRegistro(array('gus_user'=>$gus_user,'gus_password'=>$gus_password));
					if(empty($arrData)){
						$arrResponse = array('status' => false, 'msg' => 'El usuario o la contraseña es incorrecto.' ); 
					}else{
						if($arrData['gus_status'] == 1){
							$_SESSION['gus'] = $arrData;
							$_SESSION['login'] = true;
							$htmlOptions = "";
							//if ($_SESSION['gus']['gus_id']==1) {
								$arrDatatwo = $this->clientes->selectRegistros();
							//} else {
							//	$arrDatatwo = $this->accesos->selectRegistros(array('gac_gus_id'=>$_SESSION['gus']['gus_id']));
							//}
							//dep($arrDatatwo);
							//die();
							if(count($arrDatatwo) > 0 ){
								for ($i=0; $i < count($arrDatatwo); $i++) { 
									$htmlOptions .= '<option value="'.$arrDatatwo[$i]['gcl_gem_id']['gem_id'].'">'.$arrDatatwo[$i]['gcl_gem_id']['gem_razonsocial'].'</option>';
								}
							}
							$arrResponse = array('status' => true, 'msg' => 'ok','htmlOp'=>$htmlOptions);
						}else{
							$arrResponse = array('status' => false, 'msg' => 'Usuario inactivo.');
						}
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function loginEmpresa(){
			if($_POST){
				if(empty($_POST['gac_gcl_id'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de datos' );
				}else{
					$_SESSION['gcl'] = $this->clientes->selectRegistro(intval($_POST['gac_gcl_id']));
					$this->newModel("establecimientos");
					$this->newModel("almacenes");
					if (count($this->establecimientos->selectRegistros())==1) {
						$_SESSION['est'] = $this->establecimientos->selectRegistro(1);
						$alm = $this->almacenes->selectRegistros(array('alm_est_id'=>1));
                		$_SESSION['alm'] = $this->almacenes->selectRegistro($alm[0]['alm_id']);
						//$_SESSION['periodo'] = "'2022-08'";
						$_SESSION['periodo'] = "'".date("Y-m")."'";
						$_SESSION['tree'] = 1;
						$arrResponse = array('status' => false, 'msg' => 'Lo hiciste', 'gcl'=>$_SESSION['gcl']['gcl_gem_id']['gem_ruc']);
					} else {
						$arrResponse = array('status' => true, 'msg' => 'Lo hiciste', 'gcl'=>$_SESSION['gcl']['gcl_gem_id']['gem_ruc']);
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}
		public function loginEstablecimiento(){
			if($_POST){
				$intId = intval($_POST['est_id']);
				if(empty($_POST['est_id'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de datos' );
				}else{
					$this->newModel("establecimientos");
					$this->newModel("almacenes");
					$_SESSION['est'] = $this->establecimientos->selectRegistro($intId);
					$alm = $this->almacenes->selectRegistros(array('alm_est_id'=>$intId));
            		$_SESSION['alm'] = $this->almacenes->selectRegistro($alm[0]['alm_id']);
					$_SESSION['periodo'] = "'".date("Y-m")."'";
					$_SESSION['tree'] = 1;
					$arrResponse = array('status' => true, 'msg' => 'Lo hiciste' );
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}
		public function resetPass(){
			if($_POST){
				error_reporting(0);
				if(empty($_POST['txtEmailReset'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de datos' );
				}else{
					$token = token();
					$strEmail  =  strtolower(strClean($_POST['txtEmailReset']));
					$arrData = $this->usuarios->searchRegistro(array('gus_user'=>$strEmail));
					if(empty($arrData)){
						$arrResponse = array('status' => false, 'msg' => 'Usuario no existente.'); 
					}else{
						$nombreUsuario = $arrData['gus_gpe_id']['gpe_nombre'].' '.$arrData['gus_gpe_id']['gpe_apellidos'];
						$url_recovery = base_url().'/Login/confirmUser/'.$strEmail.'/'.$token;
						$requestUpdate = $this->usuarios->updateRegistro(array('gus_id'=>$arrData['gus_id'],'gus_token'=>$token));

						$dataUsuario = array('nombreUsuario' => $nombreUsuario,
											 'email' => $strEmail,
											 'asunto' => 'Recuperar cuenta - '.NOMBRE_REMITENTE,
											 'url_recovery' => $url_recovery);
						if($requestUpdate){
							$sendEmail = sendEmail($dataUsuario,'email_cambioPassword');
							if($sendEmail){
								$arrResponse = array('status' => true, 
												 'msg' => 'Se ha enviado un email a tu cuenta de correo para cambiar tu contraseña.');
							}else{
								$arrResponse = array('status' => false, 
												 'msg' => 'No es posible realizar el proceso, intenta más tarde.' );
							}
						}else{
							$arrResponse = array('status' => false, 
												 'msg' => 'No es posible realizar el proceso, intenta más tarde.' );
						}
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}
		public function confirmUser($params){
			if(empty($params)){
				header('Location: '.base_url());
			}else{
				$arrParams = explode(',',$params);
				$strEmail = strClean($arrParams[0]);
				$strToken = strClean($arrParams[1]);
				$arrResponse = $this->usuarios->searchRegistro(array('gus_user'=>$strEmail,'gus_token'=>$strToken));
				if(empty($arrResponse)){
					header("Location: ".base_url());
				}else{
					$data['page_tag'] = "Cambiar contraseña";
					$data['page_name'] = "cambiar_contrasenia";
					$data['page_title'] = "Cambiar Contraseña";
					$data['email'] = $strEmail;
					$data['token'] = $strToken;
					$data['idpersona'] = $arrResponse['gus_id'];
					$data['page_functions_js'] = "functions_login.js";
					$this->views->getView($this,"cambiar_password",$data);
				}
			}
			die();
		}

		public function setPassword(){
			if(empty($_POST['idUsuario']) || empty($_POST['txtEmail']) || empty($_POST['txtToken']) || empty($_POST['txtPassword']) || empty($_POST['txtPasswordConfirm'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de datos' );
				}else{
					$intIdpersona = intval($_POST['idUsuario']);
					$strPassword = $_POST['txtPassword'];
					$strPasswordConfirm = $_POST['txtPasswordConfirm'];
					$strEmail = strClean($_POST['txtEmail']);
					$strToken = strClean($_POST['txtToken']);

					if($strPassword != $strPasswordConfirm){
						$arrResponse = array('status' => false, 
											 'msg' => 'Las contraseñas no son iguales.' );
					}else{
						$arrResponseUser = $this->usuarios->searchRegistro(array('gus_user'=>$strEmail,'gus_token'=>$strToken));
						if(empty($arrResponseUser)){
							$arrResponse = array('status' => false, 
											 'msg' => 'Erro de datos.' );
						}else{
							$strPassword = hash("SHA256",$strPassword);
							$requestPass = $this->usuarios->updateRegistro(array('gus_id'=>$intIdpersona,'gus_password'=>$strPassword));

							if($requestPass){
								$arrResponse = array('status' => true, 
													 'msg' => 'Contraseña actualizada con éxito.');
							}else{
								$arrResponse = array('status' => false, 
													 'msg' => 'No es posible realizar el proceso, intente más tarde.');
							}
						}
					}
				}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die();
		}
		public function getSelectEstablecimientos(){
			$this->newModel("establecimientos");
			$request = $this->establecimientos->selectRegistros();
			$htmlOptions = '';
			if(count($request) > 1 ){
				for ($i=0; $i < count($request); $i++) {   
					$htmlOptions .= '<option  value="'.$request[$i]['est_id'].'">'.$request[$i]['est_nombre'].'</option>';
				}
			}
			echo $htmlOptions;
			die();		
		}

	}
 ?>