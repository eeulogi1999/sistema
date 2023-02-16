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

			$this->newController('Main');
			$tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tventa'];
			unset($this->Main);
			$_SESSION['por'] = array('CO'=>80,'PB'=>80,'AL'=>80);
			$_SESSION['tga'] = array('CO'=>$tga,'PB'=>$tga,'AL'=>$tga);
			$_SESSION['bas'] = array('CO'=>0,'PB'=>0,'AL'=>0);

			$data['page_id'] = 2;
			$data['page_tag'] = "Tendencias del Mercado";
			$data['page_title'] = "Tendencias del Mercado";
			$data['page_name'] = "Tendencias del Mercado";
			$data['page_data'] = array('gtc'=>$tga);
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
		public function setTenTgaBas(){
			$_SESSION[$_POST['a']][$_POST['b']] = $_POST['e'];
			echo json_encode(array('status'=>true),JSON_UNESCAPED_UNICODE);
            die();
		}

	}
 ?>