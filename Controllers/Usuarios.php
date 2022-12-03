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
		}
		public function Usuarios(){
			$data['page_tag'] = "Usuarios";
			$data['page_title'] = "USUARIOS";
			$data['page_name'] = "usuarios";
			$data['page_data'] = array();
			$data['page_functions_js'] = array("functions_usuarios.js");
			$this->views->getView($this,"usuarios",$data);
		}

	}
 ?>