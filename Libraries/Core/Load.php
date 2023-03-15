<?php 
	$controller = ucwords($controller);
	$controllerFile = "Controllers/".$controller.".php";
	if(file_exists($controllerFile)){
		require_once($controllerFile);
		$controller = new $controller();
		if(method_exists($controller, $method)){
			$controller->{$method}($params);
		}else{
			require_once("Controllers/Error.php");
			header('Location: '.base_url().'/dashboard');
			exit;
		}
	}else{
		require_once("Controllers/Error.php");
		header('Location: '.base_url().'/dashboard');
		exit;

	}

 ?>