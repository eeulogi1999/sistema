<?php 
	spl_autoload_register(function($class){
		echo json_encode($class,JSON_UNESCAPED_UNICODE);
		die();
		if(file_exists("Libraries/".'Core/'.$class.".php")){
			require_once("Libraries/".'Core/'.$class.".php");
		}
	});
 ?>