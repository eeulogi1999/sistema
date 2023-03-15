<?php
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
	echo json_encode('sdfgsd',JSON_UNESCAPED_UNICODE);
	die();
 ?>