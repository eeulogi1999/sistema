<?php
	class Views{
		function getView($controller,$view,$data=""){
			$controller = get_class($controller);
			echo json_encode($controller,JSON_UNESCAPED_UNICODE);
			die();
			if($controller == "Home"){
				$view = "Views/".$view.".php";
			}else{
				$view = "Views/".$controller."/".$view.".php";
			}
			require_once ($view);
		}
	}

 ?>