<?php 
@ob_start();
require 'Libraries/html2pdf/vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;
require 'Libraries/numero2letras/vendor/autoload.php';
use Luecano\NumeroALetras\NumeroALetras;
class Adscripciones extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this))); 
        $this->newModel('ubicaciones'); 
        $this->newModel('adetalles');
        $this->formatter = new NumeroALetras();
    }
    public function Adscripciones(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        switch ($_GET['url']) {
            case 'altas':
                $_SESSION['ads']['ads_tipo'] = 1;
                break;
            case 'bajas':
                $_SESSION['ads']['ads_tipo'] = 2; 
                break; 
            default:
                header("Location:".base_url().'/dashboard');
                break;
        }
        $data['page_tag'] = ucfirst($_GET['url']).' de Activos';
        $data['page_title'] = ucfirst($_GET['url']).' de Activos';
        $data['page_name'] = $_GET['url'];
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_adscripciones.js","functions_activos.js","functions_colaboradores.js");
        $this->views->getView($this,"adscripciones",$data);
    }
    public function getAdscripciones(){
        $arrData = $this->adscripciones->selectRegistros(array('ads_tipo'=>$_SESSION['ads']['ads_tipo']));
        for ($i=0; $i < count($arrData); $i++) {
            $btnEdit = '';
            $btnDelete = '';
            $btnView = '';
            $btnPdf = '';
            $arrData[$i]['ads_nro'] = $i+1;
            $arrData[$i]['ads_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i]['ads_status']]].'">'.array_keys(STATUS)[$arrData[$i]['ads_status']].'</span>';
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary btn-sm" onClick="editAds('.$arrData[$i]['ads_id'].')" title="Editar Registro"><i class="fas fa-pencil-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'ads',".$arrData[$i]['ads_id'].')" title="Eliminar Registro"><i class="far fa-trash-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_r']){	
                $btnView = '<button class="btn btn-info btn-sm" onclick="getViewAsi('.$arrData[$i]['ads_id'].')" title="Ver Registro" > <i class="far fa-eye"></i> </button>';
                $btnPdf = '<a class="btn btn-danger btn-sm" href="'.base_url().'/Adscripciones/getPdf/'.$arrData[$i]['ads_id'].'" target="_blanck" title="Pdf Registro" ><i class="far fa-file-pdf"></i></a>';
            }
            $arrData[$i]['ads_options'] = '<div class="text-center">'.$btnView.' '.$btnPdf.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setAdscripciones(){
        if ($_POST) { 
            foreach ($_POST as $i => $value) {
                if (is_json($value)){
                    $_POST[$i] = json_decode($value,true);
                }
            }
            $arrAde = $_POST['ads_ade_id'];
            $arrUbi = $_POST['ads_ubi_id'];
            unset($_POST['ads_ade_id']);
            unset($_POST['ads_ubi_id']);
            $_POST['ads_cunico'] =  $this->adscripciones->searchRegistro(array('ads_tipo'=>$_SESSION['ads']['ads_tipo']),"MAX(ads_cunico) as 'next'")['next']+1;
            $_POST['ads_ubi_id'] = $this->ubicaciones->insertRegistro($arrUbi)['ubi_id'];
            $_POST['ads_tipo'] = $_SESSION['ads']['ads_tipo'];
            $asi = $this->adscripciones->insertRegistro($_POST);
            foreach ($arrAde as $i => $ade){ 
                $ade['ade_ads_id'] = $asi['ads_id'];
                $ade = $this->adetalles->insertRegistro($ade); 
            } 
            echo json_encode($ade,JSON_UNESCAPED_UNICODE); 
        }
        die();
    }
    public function delAdscripciones(){
        if (!empty($_POST['ads_id'])) {
            $asi = $this->adscripciones->deleteRegistro($_POST['ads_id']);
            if ($asi) {
                $arrResponse = array('status'=>true,'msg'=>'ok','data'=>$asi);
            } else {
                $arrResponse = array('status'=>false,'msg'=>'No se pudo eliminar el Registro');
            }
        }else {
            $arrResponse = array('status'=>true,'msg'=>'No se puede procesar el ID');
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getMovimiento($id,$return = false) {      
        $asi = $this->adscripciones->selectRegistro($id);
        $asi['ads_ade_id'] = $this->adetalles->selectRegistros(array('ade_ads_id'=>$id),array('ade_ads_id')); 
        if (!empty($asi)) {
            $response = array('status'=>true,'msg'=>'ok','data'=>$asi);
        } else {
            $response = array('status'=>false,'msg'=>'Movimiento no Encontrado','data'=>$asi);
        }
        if ($return) {
            return $response;
        }else{
            echo json_encode($response,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function getPdf($id){
        if(is_numeric($id)){
            $arrData = $this->getAdscripciones($id,true);
            if(!$arrData['status']){
                echo "Datos no encontrados";
            }else{
                ob_end_clean();
                $data['gcl'] = $_SESSION['gcl'];
                $data['mov'] = $arrData['data'];
                $html = getFile("Adscripciones/pdf",$data);
                $html2pdf = new Html2Pdf('p','A4','es','true','UTF-8');
                $html2pdf->writeHTML($html);
                $html2pdf->output('Asignacion-'.$id.'.pdf');   
            }
        }else{
            echo "Dato no válido";
        }
    }

}