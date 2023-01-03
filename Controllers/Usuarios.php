<?php 
@ob_start();
	class Usuarios extends Controllers{
		public function __construct(){
			parent::__construct(strtolower(get_class($this)));
			if(empty($_SESSION['login'])){
				header('Location: '.base_url().'/login');
				die();
			}
			$this->newModel('accesos');
			$this->newModel('clientes');
			getPermisos(1);
		}
		public function Usuarios(){
			$data['page_tag'] = "Usuarios";
			$data['page_title'] = "USUARIOS";
			$data['page_name'] = "usuarios";
			$data['page_data'] = array();
			$data['page_functions_js'] = array("functions_usuarios.js","functions_personas.js","functions_areas.js","functions_roles.js");
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
					$btn = '<button class="btn btn-warning btn-sm" onClick="gac('.$arrData[$i][$pre.'_id'].')" title="Conceder Accesos"><i class="fas fa-user-lock"></i></button>';
				}
				$arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.' '.$btn.'</div>';
			}
			unset($this->{$tabla});
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}
		public function getGaccesos($id){
			$arrData = $this->accesos->selectRegistros(array('gac_gus_id'=>$id));
			$arr = array();
			$arrGmo = $this->clientes->selectRegistros();
			foreach ($arrGmo as $n => $v) {
				$d = $this->accesos->searchRegistro(array('gac_gus_id'=>$id,'gac_gcl_id'=>$v['gcl_id']));
				if (empty($d)) {
					$d = $this->accesos->insertRegistro(array('gac_gus_id'=>$id,'gac_gcl_id'=>$v['gcl_id']));
					$d = $this->accesos->selectRegistro($d['gac_id']);
				}
				$d['gac_use'] = '<div class="custom-control custom-switch">
				<input type="checkbox" class="custom-control-input" id="gac_r_'.$d['gac_id'].'" '.(($d['gac_use']==1)?'checked':'').' onclick="set(`gac`,null,{gac_id:'.$d['gac_id'].',gac_use:+$(`#gac_r_'.$d['gac_id'].'`).prop(`checked`)},true)">
				<label class="custom-control-label" for="gac_r_'.$d['gac_id'].'"></label>
				</div>';
				array_push($arr,$d);
			}
			echo json_encode($arr,JSON_UNESCAPED_UNICODE);
			die();
		}


	}
 ?>