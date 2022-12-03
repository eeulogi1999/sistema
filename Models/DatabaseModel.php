<?php 	
	class DatabaseModel{
		private $x;
		private $name_schema;	
		private $name_table;    
		private $references;	
		private $columns;	

		public function __construct($x,string $name_schema ,string $name_table ){
			$this->x = $x; 
			$this->name_schema = $name_schema; 
			$this->name_table = $name_table;  
			$this->references = $this->x->selectReferences($this->name_schema,$this->name_table);
			$this->columns = $this->x->selectColumns($this->name_table);
			foreach ($this->columns as $i => $row) {
				$this->{$row['Field']} = null;
			}
		}	
		public function selectRegistros(array $where = null,$select = array('','')){    
			$request = null;
			$strWhere = '';
			if (!empty($where)) {
				$validate = $this->x->validCampos($this->columns,$where);  		
				if ($validate['status'] || isset($where['custom'])){
					$strWhere = "WHERE ";
					foreach ($where as $i => $d) {
						if ($i == 'custom') {
							$strWhere .= ($i === array_key_last($where)) ? $d :$d."  AND ";
						}else{
							$this->{$i} = $validate['data'][$i];
							$strWhere .= ($i === array_key_last($where)) ? $i." = '{$this->$i}'":$i." = '{$this->$i}' AND ";
						}
					}
				}																
			}
			
			$sql = "SELECT * FROM {$this->name_table} $strWhere";
			$request = $this->x->select_all($sql);
			foreach ($request as $i => $row) {
				foreach ($this->references as $j => $ref) { 
					if (!empty($ref['REFERENCED_COLUMN_NAME']) && !empty($request[$i][$ref['COLUMN_NAME']])) {
						if (!in_array($ref['COLUMN_NAME'],$select)) {
							$request[$i][$ref['COLUMN_NAME']] = $this->x->selectComplements($ref,$request[$i][$ref['COLUMN_NAME']],$select);
						}
					}
				}
			}
			return $request;
		}
		public function selectCustoms($select = '*',array $where = null,array $nselec = array('','')){    
			$request = null;
			$strWhere = '';
			if (!empty($where)) {
				$validate = $this->x->validCampos($this->columns,$where);  		
				if ($validate['status'] || isset($where['custom'])){
					$strWhere = "WHERE ";
					foreach ($where as $i => $d) {
						if ($i == 'custom') {
							$strWhere .= ($i === array_key_last($where)) ? $d :$d."  AND ";
						}else{
							$this->{$i} = $validate['data'][$i];
							$strWhere .= ($i === array_key_last($where)) ? $i." = '{$this->$i}'":$i." = '{$this->$i}' AND ";
						}
					}
				}																
			}
			$sql = "SELECT $select FROM {$this->name_table} $strWhere";
			$request = $this->x->select_all($sql);
			foreach ($request as $i => $row) {
				foreach ($this->references as $j => $ref) { 
					if (!empty($ref['REFERENCED_COLUMN_NAME']) && !empty($request[$i][$ref['COLUMN_NAME']])) {
						if (!in_array($ref['COLUMN_NAME'],$nselec)) {
							$request[$i][$ref['COLUMN_NAME']] = $this->x->selectComplements($ref,$request[$i][$ref['COLUMN_NAME']],$nselec);
						}
					}
				}
			}
			return $request;
		}			
		public function insertRegistro(array $data,array $where = null){   
			$x = array_search('PRI',array_column($this->columns,'Key'));
			$validate = $this->x->validCampos($this->columns,$data,true);      //valid campo --- 3 parameter true for insert
			$response = 0;
			if ($validate['status']) {
				$com = $validate['data'];
				$insert = '';
				$values = '';
				$strWhere = '';
				foreach ($com as $i => $data) {
					$this->{$i} = $data;
					if ($i === array_key_last($com)){
						$insert .= $i;
						$values .= '?';
					}else {
						$insert .= $i.',';
						$values .= '?,';
					}
				}
				if (!is_null($where)) {
					$strWhere = ' WHERE ';
					foreach ($where as $i => $d) {
						if ($d == 'mov_fechaE') {
							$p = date( "Y-m", strtotime($this->{$d}));
							$strWhere .= ($i === array_key_last($where)) ? "DATE_FORMAT(mov_fechaE, '%Y-%m') = '$p'" :"DATE_FORMAT(mov_fechaE, '%Y-%m') = '$p' AND ";
						}else{
							$strWhere .= ($i === array_key_last($where)) ? $d." = '{$this->{$d}}'" :$d." = '{$this->{$d}}' AND ";
						}
					}
					$sql = "SELECT * FROM {$this->name_table} $strWhere";
					$request = $this->x->select($sql);
				}else {
					$request = null;
				}
				if(empty($request)){
					$sql  = "INSERT INTO {$this->name_table} ($insert) VALUES($values)";
					$arrData = array();
					foreach ($com as $i => $data) {
						array_push($arrData,$this->{$i});
					}
					$id = $this->x->insert($sql,$arrData);
					if ($id>0) {
						$response = array('status'=>true,'msg'=>'Guardado Correctamente',$this->columns[$x]['Field']=>$id);
					}else{
						$response = array('status'=>false,'msg'=>$this->name_table.' Error en Coneccion Sql');
						echo json_encode($response,JSON_UNESCAPED_UNICODE); 
                		die();
					}	
				}else {
					$response = array('status'=>false,'exist'=>true,'msg'=>'El Registro Existe',$this->columns[$x]['Field']=>$request[$this->columns[$x]['Field']],'data'=>$request);
				}	
			} else {
				$response = array('status'=>false,'msg'=>ucfirst($this->name_table).': Datos Incorrectos','data'=>$validate);
				echo json_encode($response,JSON_UNESCAPED_UNICODE); 
                die();
			}	
			return $response;
		}				
		public function updateRegistro(array $data){
			$x = array_search('PRI',array_column($this->columns,'Key'));
			$validate = $this->x->validCampos($this->columns,$data);
			$response = 0;
			if ($validate['status'] && isset($validate['data'][$this->columns[$x]['Field']])) {  
				$com = $validate['data'];
				$update = '';
				foreach ($com as $i => $d) {
					$this->{$i} = $d;
					if ($i === array_key_last($com)){
						$update .= $i.'=?';
					}else {
						$update .= $i.'=?,';
					}
				}
				$sql = "SELECT * FROM {$this->name_table} WHERE ".$this->columns[$x]['Field']." = ".$this->{$this->columns[$x]['Field']};
				$request = $this->x->select($sql);
				if(!empty($request)){
					$sql  = "UPDATE {$this->name_table} SET $update WHERE ".$this->columns[$x]['Field']." = ".$this->{$this->columns[$x]['Field']};
					
					$arrData = array();
					foreach ($com as $i => $d) {
						array_push($arrData,$this->{$i});
					}
					$update = $this->x->update($sql,$arrData);
					if ($update>0) {
						$response = array('status'=>true,'msg'=>'Actualizado Correctamente');
					}else{
						$response = array('status'=>false,'msg'=>'Error en Coneccion Sql');
					}
				}else {
					$response = array('status'=>false,'msg'=>'No existe eL ID');
				}	
			} else {
				$response = array('status'=>false,'msg'=>ucfirst($this->name_table).': Datos Incorrectos','data'=>$validate);
				echo json_encode($response,JSON_UNESCAPED_UNICODE); 
                die();
			}	
			return $response;
		}	
		public function selectRegistro(int $id,$select = array('','')){
			$x = array_search('PRI',array_column($this->columns,'Key'));
			$this->{$this->columns[$x]['Field']} = $id;
			$sql = "SELECT * FROM {$this->name_table} WHERE ".$this->columns[$x]['Field']."  = ".$this->{$this->columns[$x]['Field']};
			$request = $this->x->select($sql);
			if (!empty($request)){
				foreach ($this->references as $i => $row) { 
					if (!empty($row['REFERENCED_COLUMN_NAME']) && !empty($request[$row['COLUMN_NAME']])) {
						if (!in_array($row['COLUMN_NAME'],$select)) {
						$request[$row['COLUMN_NAME']] = $this->x->selectComplements($row,$request[$row['COLUMN_NAME']],$select);
						}
					}
				}
			}
			return $request;
		}		
		public function searchRegistro(array $where,$select = '*',array $nselec = array('','')){
			$request = null;
			$strWhere = '';
			if (!empty($where)) {
				$validate = $this->x->validCampos($this->columns,$where);
				if ($validate['status'] || isset($where['custom'])){
					$strWhere = "WHERE ";
					foreach ($where as $i => $d) {
						if ($i == 'custom') {
							$strWhere .= ($i === array_key_last($where)) ? $d :$d."  AND ";
						}else{
							$this->{$i} = $validate['data'][$i];
							$strWhere .= ($i === array_key_last($where)) ? $i." = '{$this->$i}'":$i." = '{$this->$i}' AND ";
						}
					}
				}
			}
			$sql = "SELECT $select FROM {$this->name_table} $strWhere";
			$request = $this->x->select($sql);
			if (!empty($request)){
				foreach ($this->references as $i => $row) { 
					if (!empty($row['REFERENCED_COLUMN_NAME']) && !empty($request[$row['COLUMN_NAME']])) {
						if (!in_array($row['COLUMN_NAME'],$nselec)) {
							$request[$row['COLUMN_NAME']] = $this->x->selectComplements($row,$request[$row['COLUMN_NAME']],$nselec);
						}
					}
				}
			}
			return $request;
		} 		
		public function deleteRegistro(int $id){
			$x = array_search('PRI',array_column($this->columns,'Key'));
			$this->{$this->columns[$x]['Field']} = $id;
			$sql = "DELETE FROM {$this->name_table} WHERE ".$this->columns[$x]['Field']."  = ".$this->{$this->columns[$x]['Field']};
			$request = $this->x->delete($sql);
			return $request;
		}

	}
 ?>