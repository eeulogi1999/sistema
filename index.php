<?php 
	require_once("Config.php");
	require_once("Helpers/Helpers.php");
	//$url = !empty($_GET['url']) ? $_GET['url'] : 'modulos';
	$url = !empty($_GET['url']) ? $_GET['url'] : 'login';
	$arrUrl = explode("/", $url);
	$controller = $arrUrl[0];
	$method = $arrUrl[0];
	$params = "";
	if($arrUrl[0] == "facturas" || $arrUrl[0] == "boletas" || $arrUrl[0] == "creditos" || $arrUrl[0] == "debitos" ){
		$controller = "comprobantes";
		$method = "comprobantes";
	}
	if($arrUrl[0] == "sbienes" || $arrUrl[0] == "entradas"|| $arrUrl[0] == "salidas"|| $arrUrl[0] == "mermas"|| $arrUrl[0] == "transferencias"||$arrUrl[0] == "ordencompra" || $arrUrl[0] == "ordenventa"){
		$controller = "movimientos";
		$method = "movimientos";
	}
	if($arrUrl[0] == "altas" || $arrUrl[0] == "bajas" ){
		$controller = "adscripciones";
		$method = "adscripciones";
	}
	if(!empty($arrUrl[1]))
	{
		if($arrUrl[1] != "")
		{
			$method = $arrUrl[1];	
		}
	}

	if(!empty($arrUrl[2]))
	{
		if($arrUrl[2] != "")
		{
			for ($i=2; $i < count($arrUrl); $i++) {
				$params .=  $arrUrl[$i].',';
				# code...
			}
			$params = trim($params,',');
		}
	}
	require_once("Libraries/Core/Autoload.php");
	require_once("Libraries/Core/Load.php");

?>
