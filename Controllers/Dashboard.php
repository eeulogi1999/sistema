<?php 
@ob_start();
	class Dashboard extends Controllers{
		public function __construct(){
			parent::__construct("usuarios");
			$this->newModel('personas');
			//session_regenerate_id(true);
			$_SESSION['asi']['asi_week']=(new DateTime())->format("Y").'-W'.(new DateTime())->format("W");
		}

		public function dashboard(){
			$data['page_id'] = 2;
			$data['page_tag'] = "Dashboard";
			$data['page_title'] = "Dashboard";
			$data['page_name'] = "dashboard";
			$data['page_data'] = array();
			$data['page_functions_js'] = array("functions_dashboard.js");
			$anio = date('Y');
			$mes = date('m');

			$this->views->getView($this,"dashboard",$data);
		}
		public function CumpleañosMes(){
			$cum = $this->personas->selectRegistros(array('custom'=>'gpe_fechan IS NOT NULL'));
			$arr = array();
			$res = array('status'=>false,'msg'=>'Cumpleaños del Mes','data'=>null);
			foreach ($cum as $i => $v) {
				if (intval((new DateTime($v['gpe_fechan']))->format("m"))==intval((new DateTime())->format("m"))) {
					array_push($arr,$v);
					$res = array('status'=>true,'msg'=>'Cumpleaños del Mes','data'=>$arr);
				}
			}
			echo json_encode($res,JSON_UNESCAPED_UNICODE);
            die();
		}

	}
 ?>