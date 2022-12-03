<?php 
	class Mysql {
		private $conexion;
		private $strquery;
		private $arrValues;
		private $name_schema;
		public $data_schemas;
		

		function __construct(string $bd){
			$this->name_schema = $bd;
			$this->conexion = new Conexion();
			$this->conexion = $this->conexion->conect($this->name_schema);		
		}

		public function selectColumns($tabla){
			$sql = "SHOW COLUMNS FROM $tabla";
			$request = $this->select_all($sql);
			return $request ;
		} 

		public function selectReferences($schema,$tabla){
			$sql = "SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
			WHERE TABLE_SCHEMA = '{$schema}' AND TABLE_NAME = '{$tabla}'";
			$request = $this->select_all($sql);
			return $request ;
		} 
		public function selectComplements($ref,$val,$select = array('','')){   //
			$sql = "SELECT * FROM ".$ref['REFERENCED_TABLE_SCHEMA'].".".$ref['REFERENCED_TABLE_NAME']."  WHERE ".$ref['REFERENCED_COLUMN_NAME']."=".$val;
			$request = $this->select($sql);
			$references = $this->selectReferences($ref['REFERENCED_TABLE_SCHEMA'],$ref['REFERENCED_TABLE_NAME']);
			foreach ($references as $j => $rw) { 
				if (!empty($rw['REFERENCED_COLUMN_NAME']) && !empty($request[$rw['COLUMN_NAME']])) {
					if (!in_array($rw['COLUMN_NAME'],$select)) {
						$request[$rw['COLUMN_NAME']] = $this->selectComplements($rw,$request[$rw['COLUMN_NAME']],$select);
					}
				}
			}
			return $request ;
		} 
		//Insertar un registro
		public function insert(string $query, array $arrValues){
			$this->strquery = $query;
			$this->arrValues = $arrValues;
        	$insert = $this->conexion->prepare($this->strquery);
        	$resInsert = $insert->execute($this->arrValues);
        	if($resInsert){
	        	$lastInsert = $this->conexion->lastInsertId();
	        }else{
	        	$lastInsert = 0;
	        }
	        return $lastInsert;  // true if res > 0
		}
		//Busca un registro
		public function select(string $query){
			$this->strquery = $query;
        	$result = $this->conexion->prepare($this->strquery);
			$result->execute();
        	$data = $result->fetch(PDO::FETCH_ASSOC);
        	return $data;
		}
		//Devuelve todos los registros
		public function select_all(string $query){
			$this->strquery = $query;
        	$result = $this->conexion->prepare($this->strquery);
			$result->execute();
        	$data = $result->fetchall(PDO::FETCH_ASSOC);
        	return $data;     
		}
		//Actualiza registros
		public function update(string $query, array $arrValues){
			$this->strquery = $query;
			$this->arrValues = $arrValues;
			$update = $this->conexion->prepare($this->strquery);
			$resExecute = $update->execute($this->arrValues);
	        return $resExecute;     // true if res > 0
		}
		//Eliminar un registros
		public function delete(string $query){
			$this->strquery = $query;
        	$result = $this->conexion->prepare($this->strquery);
			$del = $result->execute();
        	return $del;
		}
		public function setTypeDate($type,$value){
			$arrStr = array('varchar','date','text','datetime');
			$arrInt = array('bigint','int','tinyint');
			$arrFloat = array('double','decimal','float');
			$arrJson = array('json','longtext'); 
			$response = array('status'=>false,'value'=>null);
			switch (true) {
				case in_array($type,$arrStr):
					$val = strval($value);
					if (is_string($val) && $val!= "" && $value != 'null') {
						$response = array('status'=>true,'value'=>$val);
					}else{
						$response = array('status'=>false,'value'=>null);
					}
					break;
				case in_array($type,$arrInt):
					if (is_array($value) && array_key_exists(0,$value)) {
						if ($value[0]=='$_SESSION') {
							$value=$_SESSION[$value[1]][$value[2]];
						}
					}
					
					$val = intval($value);
					if (is_numeric($val) && ($value != 'null'|| $value == 0 )) { // 0 != 'null' => false
						$response = array('status'=>true,'value'=>$val);
					}else{
						$response = array('status'=>false,'value'=>null);
					}
					break;
				case in_array($type,$arrFloat):
					$val = floatval($value);
					if (is_float($val) && $value != 'null') {
						$response = array('status'=>true,'value'=>$val);
					}else{
						$response = array('status'=>false,'value'=>null);
					}
					break;
				case in_array($type,$arrJson):
					if (is_json($value) && $value != 'null') {
						$response = array('status'=>true,'value'=>$value);
					}else{
						$response = array('status'=>false,'value'=>null);
					}
					break;
				default:
					$response = array('status'=>false,'value'=>null);
					break;
			}
			return $response;
		}
		public function validCampos($request,$data,$insert = false){     //false solo vailida campos //true valida para insert
			$status = true;                                        
			$msg = array();
			$arrRequiere = array();
			foreach ($request as $j => $row) {
				if (empty($row['Default']) && $row['Null']=='NO') {
					if ($row['Extra'] != 'auto_increment') {
						$arrRequiere[$row['Field']] = false;      
					}
				}
			}
			foreach ($data as $i => $value) {
				if (in_array($i, array_column($request,'Field'))) {
					$k = array_search($i, array_column($request,'Field'));
					$tdata = $this->setTypeDate(explode('(',$request[$k]['Type'])[0],$value);
					if (($request[$k]['Key']=='PRI') || ($request[$k]['Key']=='MUL')) {
						if ($tdata['value']>0) {
							if ($tdata['status']) {
								$data[$i] = $tdata['value'];
								$arrRequiere[$i] = true; 
							} else {
								$data[$i] = 'Requiere type '.$request[$k]['Type'];
								$status = false;
							}
						}else{
							if ($insert && $request[$k]['Key']=='PRI') {
								unset($data[$i]);
							}elseif($request[$k]['Null'] == 'YES'){     //falta default
								if (!$insert) {
									$data[$i] = null;
								} else {
									unset($data[$i]);
								}
							}else{
								$data[$i] = "No Indice";
								$status = false;
							}
						}
					}else{
						if (!is_null($tdata['value'])) {
							if ($tdata['status']) {
								$data[$i] = $tdata['value'];
								$arrRequiere[$i] = true;    
							} else {
								$data[$i] = 'Requiere type '.$request[$k]['Type'];
								$status = false;
							}
						}else{                                           //falta default
							if ($request[$k]['Null']=='NO' ) {
								if (!empty($request[$k]['Default'])) {
									unset($data[$i]);
								}else {
									$data[$i] = "Data Vacia";
									$status = false;
								}
							}
							if ($request[$k]['Null']=='YES') {
								if (!$insert) {
									$data[$i] = null;            //update null
								} else {
									unset($data[$i]); 
								}              
							}else{
								$data[$i] = "No definido";
							}
						}
					}
				}else{
					unset($data[$i]);
					$msg[$i] = 'No Existe Columna';
				}
			}
			if ($insert) {
				foreach ($arrRequiere as $n => $value) {
					if (!$arrRequiere[$n]) {
						if (!isset($data[$n])) {
							$msg[$n] = "Campo no Definidos y Requeridos";
						} else {
							$msg[$n] = $data[$n];
						}
						$status = false;
					}
				}
			}
			return array('status'=>$status,'msg'=>$msg,'data'=>$data);
		}
	}


 ?>

