<?php 
@ob_start();
	class Dashboard extends Controllers{
		public function __construct(){
			parent::__construct("usuarios");
			//session_regenerate_id(true);
			$_SESSION['asi']['asi_week']=(new DateTime())->format("Y").'-W'.(new DateTime())->format("W");
			getPermisos(1);
		}

		public function dashboard()
		{
			$data['page_id'] = 2;
			$data['page_tag'] = "Dashboard";
			$data['page_title'] = "Dashboard";
			$data['page_name'] = "dashboard";
			$data['page_data'] = array();
			$data['page_functions_js'] = "functions_dashboard.js";

			$anio = date('Y');
			$mes = date('m');

			$this->views->getView($this,"dashboard",$data);
		}

	}
 ?>