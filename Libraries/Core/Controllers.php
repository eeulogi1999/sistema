<?php 
	class Controllers{
		protected $xp;
		protected $xd;
		public function __construct($name_table){
			if (session_status()==1) {
				session_name(PHPID);
				session_start();
			}
			echo json_encode(apache_request_headers(),JSON_UNESCAPED_UNICODE);
			die();
			$this->views = new Views();
			$this->xp = new Mysql(DB_NAME);
			if (!empty($_SERVER['PHP_AUTH_USER'])) {
				$this->newModel("usuarios");
				$this->newModel("clientes");
				$h = apache_request_headers();
				$gus = $this->usuarios->searchRegistro(array('gus_user'=>$_SERVER['PHP_AUTH_USER'],'gus_password'=>hash("SHA256",$_SERVER['PHP_AUTH_PW'])));
				if(!empty($gus)){
					$_SESSION['gus'] = $gus;
					$_SESSION['login'] = true;
					$_SESSION['gcl'] = $this->clientes->selectRegistro($h['gcl_id']);
					$_SESSION['periodo'] = (isset($h['periodo']))?'"'.$h['periodo'].'"':'"'.date("Y-m").'"';
					$_SESSION['tree'] = 1;
				}
			}
			if (isset($_GET['gcl_id'])) {
				$this->newModel("usuarios");
				$this->newModel("clientes");
				$h = apache_request_headers();
				$gus = $this->usuarios->selectRegistro(1);
				if(!empty($gus)){
					$_SESSION['gus'] = $gus;
					$_SESSION['login'] = true;
					$_SESSION['gcl'] = $this->clientes->selectRegistro(intval($_GET['gcl_id']));
					$_SESSION['periodo'] = (isset($h['periodo']))?'"'.$h['periodo'].'"':'"'.date("Y-m").'"';
					$_SESSION['tree'] = 1;
				}
			}
			if (!empty($_SESSION['gcl'])) {
				$this->xd = new Mysql(DB_SUBNAME.$_SESSION['gcl']['gcl_gem_id']['gem_ruc']);
				if (!empty($_SERVER['PHP_AUTH_USER'])) {
					$this->newModel("almacenes");
					$h = apache_request_headers();
					$_SESSION['alm'] = $this->almacenes->selectRegistro($h['alm_id']);
				}
				if (isset($_GET['gcl_id'])) {
					$this->newModel("almacenes");
					$_SESSION['alm'] = $this->almacenes->selectRegistro(1);
				}
			}
			if ($_SERVER['HTTP_SEC_FETCH_MODE']=='navigate') {
				if(empty($_SESSION['login']) && get_class($this) !='Login' ){
					header('Location: '.base_url().'/login');
					exit;
				}
			}
			$this->loadModel($name_table);
			if (!empty($_SESSION['tree'])) {
				$g = explode('.',strval($_SESSION['tree']));
				$_SESSION['perMod'] = getPermisos(intVal($g[array_key_last($g)]));
			}
		}
		public function newController(string $controller){    //para agregar controladores 
			$routClass = "Controllers/".$controller.".php";
			if(file_exists($routClass)){
				require_once $routClass;
				if (!isset($this->{$controller})) {
					$this->{$controller} = new $controller;
				}
			}
		}
		public function newModel(string $name_table){    //para agregar modelos de tablas que enxistan en la BD 
			//$routClass = "Models/".$model.".php";
			$model = "DatabaseModel";
			$routClass = "Models/".$model.".php";
			require_once $routClass;
			if (!empty($_SESSION['gcl'])&& empty($this->xd)) {
				$this->xd = new Mysql(DB_SUBNAME.$_SESSION['gcl']['gcl_gem_id']['gem_ruc']);
			}
			$name_schema = $this->searchSchema($name_table);
			if (!empty($name_schema)) {
				$x = ($name_schema==DB_NAME)? $this->xp : $this->xd ;
				$this->{$name_table} = new $model($x,$name_schema,$name_table);
			}
		}
		public function customModel(string $model, $bd = 'xd'){        //para agreagr modelos perzonalizados clasicos
			$routClass = "Models/".$model.".php";
			if(file_exists($routClass)){
				require_once $routClass;
				$x = ($bd=='xd')? $this->xd : $this->xp ;
				$this->{$model} = new $model($x);
			}
		}
		public function loadModel($name_table){            //funcion que inicia el cargado del modelo del CRUD deficido desde el contructor
			//$model = get_class($this)."Model";
			$model = "DatabaseModel";
			$routClass = "Models/".$model.".php";
			if(file_exists($routClass)){
				require_once($routClass);
				$name_schema = $this->searchSchema($name_table);
				$x = ($name_schema==DB_NAME)? $this->xp : $this->xd ;
				$this->{$name_table} = new $model($x,$name_schema,$name_table);
				if ($name_schema==DB_NAME) {
					$this->{$name_table} = new $model($this->xp,$name_schema,$name_table);
					if (empty($_SESSION['data_schemas'][$name_schema])) {
						$pri = $this->xp->select_all("SHOW TABLES in ".$name_schema);
						$_SESSION['data_schemas'][$name_schema] = array();
						foreach ($pri as $i => $d) {   //substr($d['Tables_in_'.$name_schema], 0, 2);
							$_SESSION['data_schemas'][$name_schema]['g'.substr($d['Tables_in_'.$name_schema], 0, 2)]=$d['Tables_in_'.$name_schema];
						}
					}
				}
			}
		}
		public function searchSchema($name_table){      //funcion para verificar si existe la tabla en las BDs
			if (isset($_SESSION['gcl']['gcl_gem_id']['gem_ruc'])) {
				$prox_schema = DB_SUBNAME.$_SESSION['gcl']['gcl_gem_id']['gem_ruc'];
				if (empty($_SESSION['data_schemas'][$prox_schema])) {
					$pri = $this->xp->select_all("SHOW TABLES in ".$prox_schema);
					$_SESSION['data_schemas'][$prox_schema] = array();
					foreach ($pri as $i => $d) {
						$_SESSION['data_schemas'][$prox_schema][substr($d['Tables_in_'.$prox_schema], 0, 3)]=$d['Tables_in_'.$prox_schema];
					}
				}
			}
			$newschema=DB_NAME;
			if (!empty($_SESSION['data_schemas'])) {
				foreach($_SESSION['data_schemas'] as $i => $arr) {
					if (in_array($name_table,$arr)) {
						$newschema = $i;
					}
				}
			}
			return $newschema ;

		}
		public function getTable($prefijo) {
			$table = null;
			// dep($_SESSION['data_schemas']);
        	// die();
			foreach ($_SESSION['data_schemas'] as $i => $bd) {
				foreach ($bd as $j => $tab) {
					if ($j==$prefijo){
						$table = $tab;
					}
				}
			}
			return $table;
		}
	}
 ?>
