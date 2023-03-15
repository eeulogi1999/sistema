<?php
	echo json_encode('hola',JSON_UNESCAPED_UNICODE);
	die();
	class Views{
		function getView($controller,$view,$data=""){
			$controller = get_class($controller);
			if($controller == "Home"){
				$view = "Views/".$view.".php";
			}else{
				$view = "Views/".$controller."/".$view.".php";
			}
			require_once ($view);
		}
	}

 ?>