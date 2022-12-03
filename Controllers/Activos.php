<?php 
@ob_start();
class Activos extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));
        $this->newModel('aatributos'); 
        getPermisos(1);    
    }
    public function Activos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        } 
        $data['page_tag'] = ucfirst($_GET['url']);
        $data['page_title'] = ucfirst($_GET['url']);
        $data['page_name'] = ucfirst($_GET['url']);
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_activos.js");
        $this->views->getView($this,"activos",$data);
    }
    public function getTretable($id,$custom = null,$nro = null){
        if (!empty($custom)) {
            $arrData = $this->activos->selectRegistros($custom);
        } else {
            $arrData = $this->activos->selectRegistros(array("act_act_id"=>$id));
        }
        for ($i=0; $i < count($arrData); $i++) {
                $btnView = '';
                $btnEdit = '';
                $btnDelete = '';
                $arrData[$i]['act_nro'] = (is_null($nro)) ? $i+1 : $nro.'.'.($i+1) ;
                $arrData[$i]['act_aat_id'] = $this->aatributos->selectRegistros(array("aat_act_id"=>$arrData[$i]['act_id']),array('aat_act_id'));
                $arrData[$i]['act_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i]['act_status']]].'">'.array_keys(STATUS)[$arrData[$i]['act_status']].'</span>';
                if($_SESSION['perMod']['gtp_r']){
                    $btnView = '<button class="btn btn-info btn-sm" onClick="ftnViewAct('.$arrData[$i]['act_id'].')" title="Ver Activo"><i class="far fa-eye"></i></button>';
                }
                if($_SESSION['perMod']['gtp_u']){
                    $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="fntEditAct('.$arrData[$i]['act_id'].')" title="Editar Activo"><i class="fas fa-pencil-alt"></i></button>';
                }
                if($_SESSION['perMod']['gtp_d']){	
                    $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'act',".$arrData[$i]['act_id'].')" title="Eliminar Activo"><i class="far fa-trash-alt"></i></button>';
                }
                $arrData[$i]['act_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
                $arrData[$i]['data'] = $this->getTretable($arrData[$i]['act_id'],null,$arrData[$i]['act_nro']);
        }
        return $arrData;
    }
    public function getActivos(){
        $arrData = $this->getTretable(null,array("custom"=>"act_act_id IS NULL"));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getActivo($act_id){
        if($_SESSION['perMod']['gtp_r']){
            $act_id = intval($act_id);
            if($act_id > 0){
                $arrData = $this->activos->selectRegistro($act_id);
                if(!empty($arrData)){
                    $arrData['act_aat_id'] = $this->aatributos->selectRegistros(array('aat_act_id'=>$arrData['act_id']),array('aat_act_id'));
                    $arrResponse = array('status' => true, 'data' => $arrData);
                }else{
                    $arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
                }
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function setActivo(){
        if ($_POST) {
            foreach ($_POST as $i => $value) {
                if (is_json($value)){
                    $_POST[$i] = json_decode($value,true);
                }
            }
            if (empty($_POST['act_id'])) {
                foreach ($_POST['act_img'] as $i => $img) {
                    $img_name = 'img_'.md5($i.date('d-m-Y H:m:s')).'.jpg';
                    $upload = uploadImage($_FILES[$img],$img_name);
                    if ($upload) {
                        $_POST['act_img'][$i] = $img_name;
                    }
                }
                $_POST['act_img'] = json_encode($_POST['act_img'],JSON_UNESCAPED_UNICODE);
                $act = $_POST;
                unset($act['act_aat_id']);
                $act = $this->activos->insertRegistro($act);
                foreach ($_POST['act_aat_id'] as $i => $aat) {
                    $aat['aat_act_id']=$act['act_id'];
                    $aat = $this->aatributos->insertRegistro($aat);
                }
                echo json_encode($act,JSON_UNESCAPED_UNICODE);
            }else {
                $act_img = json_decode($this->activos->selectRegistro($_POST['act_id'])['act_img'],true); //
                foreach ($act_img as $i => $img) {
                    if (!in_array($img,$_POST['act_img'])) {
                        deleteFile($img);
                    }
                }
                foreach ($_POST['act_img'] as $i => $img) {
                    if (!in_array($img,$act_img)) {
                        $img_name = 'img_'.md5($i.date('d-m-Y H:m:s')).'.jpg';
                        $upload = uploadImage($_FILES[$img],$img_name);
                        if ($upload) {
                            $_POST['act_img'][$i] = $img_name;
                        }
                    }
                }
                $_POST['act_img'] = json_encode($_POST['act_img'],JSON_UNESCAPED_UNICODE);
                $act = $_POST;
                unset($act['act_aat_id']);
                $act = $this->activos->updateRegistro($act);
                $act_aat_id = $this->aatributos->selectRegistros(array('aat_act_id'=>$_POST['act_id']),array('aat_act_id'));
                foreach ($act_aat_id as $i => $aat) {
                    $status = true;
                    foreach ($_POST['act_aat_id'] as $i => $aatr) {
                        if (isset($aatr['aat_id'])) {
                            if($aat['aat_id']==$aatr['aat_id']) {
                                $status = false;
                            }
                        }
                    }
                    if($status){
                        $del = $this->aatributos->deleteRegistro($aat['aat_id']);
                    }
                }
                foreach ($_POST['act_aat_id'] as $i => $aat) {
                    if (!is_null($aat)) {
                        if (!isset($aat['aat_id'])) {
                            $aat['aat_act_id']=$_POST['act_id'];
                            $aat = $this->aatributos->insertRegistro($aat);
                        } else {
                            $aat = $this->aatributos->updateRegistro($aat);
                        }
                    }
                }
                echo json_encode($act,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }    
}