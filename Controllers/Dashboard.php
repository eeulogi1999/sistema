<?php 
@ob_start();
	class Dashboard extends Controllers{
		public function __construct(){
			parent::__construct("usuarios");
			$this->newModel('personas');
			//session_regenerate_id(true);
			$_SESSION['asi']['asi_week']=(new DateTime())->format("Y").'-W'.(new DateTime())->format("W");
		}

		public function dashboard(){
			$this->newController('Main');
			$tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tventa'];
			unset($this->Main);
			$_SESSION['por'] = array('CO'=>80,'PB'=>80,'AL'=>80);
			$_SESSION['tga'] = array('CO'=>$tga,'PB'=>$tga,'AL'=>$tga);
			$_SESSION['bas'] = array('CO'=>0,'PB'=>0,'AL'=>0);

			$data['page_id'] = 2;
			$data['page_tag'] = "Tendencias del Mercado";
			$data['page_title'] = "Tendencias del Mercado";
			$data['page_name'] = "Tendencias del Mercado";
			$data['page_data'] = array('gtc'=>$tga,'pri'=>array('pri_gus_id'=>$_SESSION['gus']['gus_id']));
			$data['page_functions_js'] = array("functions_dashboard.js");
			$anio = date('Y');
			$mes = date('m');
			$this->views->getView($this,"dashboard",$data);
		}
		public function CumpleañosMes(){
			$cum = $this->personas->selectRegistros(array('custom'=>'gpe_fechan IS NOT NULL'));
			$arr = array();
			$res = array('status'=>false,'msg'=>'Cumpleaños del Mes','data'=>null);
			foreach ($cum as $i => $v) {
				if (intval((new DateTime($v['gpe_fechan']))->format("m"))==intval((new DateTime())->format("m"))) {
					array_push($arr,$v);
					$res = array('status'=>true,'msg'=>'Cumpleaños del Mes','data'=>$arr);
				}
			}
			echo json_encode($res,JSON_UNESCAPED_UNICODE);
            die();
		}
		public function setTenTgaBas(){
			$_SESSION[$_POST['a']][$_POST['b']] = $_POST['e'];
			echo json_encode(array('status'=>true),JSON_UNESCAPED_UNICODE);
            die();
		}
		public function saveImg(){
			$img_name = 'img_'.md5(date('d-m-Y H:m:s')).'.png';
            $upload = uploadImage($_FILES['file'],$img_name);
            if ($upload) {
				$curl = curl_init();
				curl_setopt_array($curl, array(
				CURLOPT_URL => 'https://graph.facebook.com/v15.0/110407845309879/messages',
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_ENCODING => '',
				CURLOPT_MAXREDIRS => 10,
				CURLOPT_TIMEOUT => 0,
				CURLOPT_FOLLOWLOCATION => true,
				CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				CURLOPT_CUSTOMREQUEST => 'POST',
				CURLOPT_POSTFIELDS =>'{
					"messaging_product": "whatsapp",
					"recipient_type": "individual",
					"to": "51916075889",
					"type": "image",
					"image": {
						"link": "'.BASE_URL.'/.uploads/'.$img_name.'"
					}
				}',
				CURLOPT_HTTPHEADER => array(
					'Content-Type: application/json',
					'Authorization: Bearer EAAHmlcHCEWIBADndcRED2msEAio5nQ8U0h1UmZAbPNiRprOtS0vPV53Q6agRJPJgO9SLnTDNRrBtUaIMFpttLxureTp0C8pYcEAexZBVkeZAp95jZAQa4uVVreLbCYod8IXHOYZBotryZBqMHTCfeEZALNUbF9lVjcFJrVjS8zBZA9nAT5cbEq0VT3pf0gScTQSO5faeiE9KbAZDZD'
				),
				));
				$response = curl_exec($curl);
				curl_close($curl);
				dep($response,false);
				echo json_encode(array('status'=>true,'img'=>$img_name),JSON_UNESCAPED_UNICODE);

            }else{
				echo json_encode(array('status'=>false),JSON_UNESCAPED_UNICODE);
			}
			die();

		}
		public function getAll($pre){
			$tabla = $this->getTable($pre);
			$this->newModel($tabla);
			$arrData = array();
			$where = json_decode($_POST['where'],true);
			$un = $this->{$tabla}->selectCustoms('pri_bie_id,MAX(pri_fecha) AS pri_fecha',array('custom'=>'pri_tipo = '.$where['pri_tipo'].' GROUP BY pri_bie_id'),array('pri_bie_id'));
			foreach ($un as $i => $r) {
				$where['pri_bie_id'] = $r['pri_bie_id'];
				$where['pri_fecha'] = $r['pri_fecha'];
				$p = $this->{$tabla}->searchRegistro($where);
				array_push($arrData,$p);
			}
			// $arrData = $this->{$tabla}->selectRegistros((isset($_POST['where']))?json_decode($_POST['where'],true):array());
			for ($i=0; $i < count($arrData); $i++) {
				// dep($arrData[$i],false);
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';
				if (isset($arrData[$i][$pre.'_status'])) {
					$arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
				}
				if((isset($_SESSION['perMod']['gtp_r']))?$_SESSION['perMod']['gtp_r']:0){
					$btnView = '<button class="btn btn-info btn-sm" onClick="view('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
				}
				if((isset($_SESSION['perMod']['gtp_u']))?$_SESSION['perMod']['gtp_r']:0){
					$btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
				}
				if((isset($_SESSION['perMod']['gtp_d']))?$_SESSION['perMod']['gtp_r']:0){
					$btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
				}
				$arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
			}
			unset($this->{$tabla});
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			die();
		}

	}
 ?>