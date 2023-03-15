<?php 
	echo json_encode(array(spl_autoload_register()),JSON_UNESCAPED_UNICODE);
	die();
	spl_autoload_register(function($class){
		if(file_exists("Libraries/".'Core/'.$class.".php")){
			require_once("Libraries/".'Core/'.$class.".php");
		}
	});
 ?>