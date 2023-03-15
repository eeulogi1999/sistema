<?php 
	spl_autoload_register(function($class){
		dep($class,false);
		if(file_exists("Libraries/".'Core/'.$class.".php")){
			require_once("Libraries/".'Core/'.$class.".php");
		}
	});
	// require_once("Libraries/Core/Controllers.php");
	// require_once("Libraries/Core/Views.php");
	// require_once("Libraries/Core/Mysql.php");
	// require_once("Libraries/Core/Conexion.php");
 ?>