<?php 
@ob_start();
	class Usuarios extends Controllers{
		public function __construct(){
			parent::__construct(strtolower(get_class($this)));
			if(empty($_SESSION['login'])){
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(1);
			$this->newModel('usuarios');
		}
		public function Usuarios(){
			$data['page_tag'] = "Usuarios";
			$data['page_title'] = "USUARIOS";
			$data['page_name'] = "usuarios";
			$data['page_data'] = array();
			$data['page_functions_js'] = array("functions_usuarios.js");
			$this->views->getView($this,"usuarios",$data);
		}
		public function getUsuarios(){
			$pre = 'gus';
			$tabla = 'usuarios';
			$arrData = $this->usuarios->selectRegistros();
			for ($i=0; $i < count($arrData); $i++) {
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';
				$tpe = '';
				if (isset($arrData[$i][$pre.'_status'])) {
					$arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
				}
				if($_SESSION['perMod']['gtp_r']){
					$btnView = '<button class="btn btn-info btn-sm" onClick="view('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
				}
				if($_SESSION['perMod']['gtp_u']){
					$btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
				}
				if($_SESSION['perMod']['gtp_d']){
					$btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
				}
				$tpe = '<button class="btn btn-warning btn-sm" onClick="tpe('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="fas fa-user-lock"></i></button>';
				$arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.' '.$tpe.'</div>';
			}
			unset($this->{$tabla});
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}

	}
 ?>