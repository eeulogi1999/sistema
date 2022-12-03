<?php
class Conexion{
	private $conect;

	public function __construct(){
	}
	public function conect($bd){
		$connectionString = "mysql:host=".DB_HOST.";dbname=".$bd.";charset=".DB_CHARSET;
		try{
			$this->conect = new PDO($connectionString, DB_USER, DB_PASSWORD);
			$this->conect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			//echo "conexión exitosa";
		}catch(PDOException $e){
			$this->conect = 'Error de conexión';
			echo "ERROR: " . $e->getMessage();
		}
		return $this->conect;
	}
}

?>