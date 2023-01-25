<?php 
	class Controllers{
		protected $xp;
		public function __construct($name_table){
			if (session_status()==1) {
				session_name(PHPID);
				session_start();
			}
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
			
			if(empty($_SESSION['login']) && get_class($this) !='Login' ){
				header('Location: '.base_url().'/login');
				die();
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
			$model = "DatabaseModel";
			$routClass = "Models/".$model.".php";
			require_once $routClass;
			$this->{$name_table} = new $model($this->xp,DB_NAME,$name_table);
		}
		public function customModel(string $model, $bd = 'xd'){        //para agreagr modelos perzonalizados clasicos
			$routClass = "Models/".$model.".php";
			if(file_exists($routClass)){
				require_once $routClass;
				$this->{$model} = new $model($this->xp);
			}
		}
		public function loadModel($name_table){            //funcion que inicia el cargado del modelo del CRUD deficido desde el contructor
			$model = "DatabaseModel";
			$routClass = "Models/".$model.".php";
			if(file_exists($routClass)){
				require_once($routClass);
				$this->{$name_table} = new $model($this->xp,DB_NAME,$name_table);
				$pri = $this->xp->select_all("SELECT TABLE_NAME,TABLE_COMMENT FROM INFORMATION_SCHEMA.TABLES  WHERE table_schema = '".DB_NAME."'");
				$_SESSION['data_schemas'][DB_NAME] = array();
				foreach ($pri as $i => $d) {  
					if ($d['TABLE_COMMENT']=='g') {
						$_SESSION['data_schemas'][DB_NAME][$d['TABLE_COMMENT'].substr($d['TABLE_NAME'], 0, 2)]=$d['TABLE_NAME'];
					} else {
						$_SESSION['data_schemas'][DB_NAME][substr($d['TABLE_NAME'], 0, 3)]=$d['TABLE_NAME'];
					}
				}
				
			}
		}
		public function getTable($prefijo) {
			$table = null;
			foreach ($_SESSION['data_schemas'][DB_NAME] as $j => $tab) {
				if ($j==$prefijo){
					$table = $tab;
				}
			}
			return $table;
		}
	}
 ?>
