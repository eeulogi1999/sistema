<?php 
@ob_start();
require 'Libraries/phpspreadsheet/vendor/autoload.php';
class Bienes extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));
        $this->newModel('propiedades');
        $this->newModel('batributos'); 
        $this->newModel('establecimientos'); 
        $this->newModel('bbienes');
        $this->newModel('valores');
        $this->newModel('mdetalles'); 
    }
    public function Bienes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        } 
        $data['estData'] = $this->establecimientos->selectRegistros(); 
        $data['page_tag'] = "Bienes";
        $data['page_title'] = "Bienes";
        $data['page_name'] = "bienes";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_bienes.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"bienes",$data);
    }
    public function Sbienes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        } 
        $data['estData'] = $this->establecimientos->selectRegistros(); 
        $data['page_tag'] = "Saldos";
        $data['page_title'] = "Saldos ";
        $data['page_name'] = "Saldos";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo'],'xfun'=>array('minzero'=>array('col'=>'sbi_qs')));
        $data['page_functions_js'] = array("functions_sbienes.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"sbienes",$data);
    }
    public function Smateriales(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        } 
        $data['estData'] = $this->establecimientos->selectRegistros(); 
        $data['page_tag'] = "Saldos";
        $data['page_title'] = "Saldos ";
        $data['page_name'] = "Saldos";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_smateriales.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"sbienes",$data);
    }
    public function Cventas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        } 
        $data['estData'] = $this->establecimientos->selectRegistros(); 
        $data['page_tag'] = "Costo de ventas";
        $data['page_title'] = "Costo de ventas ";
        $data['page_name'] = "Costo de ventas";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_sbienes.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"cventas",$data);
    }
    public function getTretable($id,$custom = null,$nro = null){
        if (!empty($custom)) {
            $arrData = $this->bienes->selectRegistros($custom);
        } else {
            $arrData = $this->bienes->selectRegistros(array("bie_bie_id"=>$id));
        }
        $arr = array();
        for ($i=0; $i < count($arrData); $i++) { 
            $cod = explode('-',$arrData[$i]['bie_codigo']);
            if (count($cod)>1) {
                $arrData[$i]['bie_codigo'] = $cod [1].'-'.$cod [0];
            }
        }
        usort($arrData, function($a, $b) {
            return $a['bie_codigo'] <=> $b['bie_codigo'];
        });
        for ($i=0; $i < count($arrData); $i++) {
                $btnView = '';
                $btnEdit = '';
                $btnDelete = '';
                $btnHis = '';
                $arrData[$i]['bie_nro'] = (is_null($nro)) ? $i+1 : $nro.'.'.($i+1) ;
                $text='';
                $bat  = $this->batributos->selectRegistros(array("bat_bie_id"=>$arrData[$i]['bie_id']),array('bat_bie_id','bat_pro_id'));
                foreach ($bat as $k => $d) {
                    $text .= '{'.$d['bat_val_id']['val_pro_id']['pro_nombre'].':'.$d['bat_val_id']['val_valor'].'}, ';
                }
                $arrData[$i]['bie_bat_id'] = $text;
                $arrData[$i]['bie_status'] = '<span class="badge badge-success">ACTIVO</span>';
                if($_SESSION['perMod']['gtp_r']){
                    $btnView = '<button class="btn btn-info btn-sm" onClick="ftnViewBie('.$arrData[$i]['bie_id'].')" title="Ver Bien"><i class="far fa-eye"></i></button>';
                }
                if($_SESSION['perMod']['gtp_u']){
                    $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="fntEditBie('.$arrData[$i]['bie_id'].')" title="Editar Bien"><i class="fas fa-pencil-alt"></i></button>';
                }
                if($_SESSION['perMod']['gtp_d']){	
                    $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'bie'".','.$arrData[$i]['bie_id'].')" title="Eliminar Bien"><i class="far fa-trash-alt"></i></button>';
                }
                $arrData[$i]['bie_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.'</div>';
                array_push($arr,$arrData[$i]); 
                $child = $this->getTretable($arrData[$i]['bie_id'],null,$arrData[$i]['bie_nro']);
                for ($j=0; $j < count($child) ; $j++) { 
                    array_push($arr,$child[$j]);    
                }
        }
        return $arr;
    }
    public function getBienes(){
        $arrData = $this->getTretable(null,array("custom"=>"bie_bie_id IS NULL AND json_extract(bie_alm_id,'$[0]') = ".$_SESSION['alm']['alm_id'].""));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setPropiedad(){
        if ($_POST) {
            $pro = $this->propiedades->insertRegistro($_POST);
            if ($pro['status']) {
                $arrResponse = array('status' => true, 'msg' =>'Datos guardados correctamente.');
            } else if($pro['exist']){
                $arrResponse = array('status' => false, 'msg' =>'¡Atención! El Registro ya existe.');
            } else{
                $arrResponse = array('status' => false, 'msg' =>'¡Atención! Error al conectar a las BD');
            }
        } else {
            $arrResponse = array('status' => false, 'msg' => '¡Atención! No es posible Guardar los datos.');
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getPropiedad($id){
        $pro = $this->propiedades->selectRegistro($id);
        echo json_encode($pro,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getBbien($bbi_id){
        if($_SESSION['perMod']['gtp_r']){
            $bbi_id = intval($bbi_id);
            if($bbi_id > 0){
                $arrData = $this->bbienes->selectRegistro($bbi_id);
                if(empty($arrData)){
                    $arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
                }else{
                    $arrResponse = array('status' => true, 'data' => $arrData);
                }
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function getBien($bie_id){
        if($_SESSION['perMod']['gtp_r']){
            $bie_id = intval($bie_id);
            if($bie_id > 0){
                $arrData = $this->bienes->selectRegistro($bie_id);
                if(!empty($arrData)){
                    $arrData['bie_bat_id'] = $this->batributos->selectRegistros(array('bat_bie_id'=>$arrData['bie_id']),array('bat_bie_id'));
                    $arrResponse = array('status' => true, 'data' => $arrData);
                }else{
                    $arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
                }
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function setBien($data = null){
        if (!empty($data)) {
            $_POST = $data;
        }
        if ($_POST) {
            foreach ($_POST as $i => $value) {
                if (is_json($value)){
                    $_POST[$i] = json_decode($value,true);
                }
            }
            if (empty($_POST['bie_id'])) {
                foreach ($_POST['bie_img'] as $i => $img) {
                    $img_name = 'img_'.md5($i.date('d-m-Y H:m:s')).'.jpg';
                    $upload = uploadImage($_FILES[$img],$img_name);
                    if ($upload) {
                        $_POST['bie_img'][$i] = $img_name;
                    }
                }
                $_POST['bie_alm_id'] = json_encode([intval($_SESSION['alm']['alm_id'])],JSON_UNESCAPED_UNICODE);
                $_POST['bie_img'] = json_encode($_POST['bie_img'],JSON_UNESCAPED_UNICODE);
                $bbi = $this->bbienes->insertRegistro($_POST['bie_bbi_id']);
                $_POST['bie_bbi_id']  = ($bbi['status']) ? $bbi['bbi_id'] : null ;
                $arrBie = $_POST;
                unset($arrBie['bie_bat_id']);
                $bie = $this->bienes->insertRegistro($arrBie,array('bie_codigo','bie_nombre'));
                if (isset($bie['exist'])) {
                    if ($bie['exist']) {
                        $bie['status'] = false;
                        if (!empty($data)) {
                            return $bie;
                        }else{
                            echo json_encode($bie,JSON_UNESCAPED_UNICODE);
                        }
                        die();
                    }
                }
                foreach ($_POST['bie_bat_id'] as $i => $bat) {
                    $bat['bat_bie_id']=$bie['bie_id'];
                    $bat = $this->batributos->insertRegistro($bat);
                }
            }else {
                $bie_img = json_decode($this->bienes->selectRegistro($_POST['bie_id'])['bie_img'],true); //
                foreach ($bie_img as $i => $img) {
                    if (!in_array($img,$_POST['bie_img'])) {
                        deleteFile($img);
                    }
                }
                foreach ($_POST['bie_img'] as $i => $img) {
                    if (!in_array($img,$bie_img)) {
                        $img_name = 'img_'.md5($i.date('d-m-Y H:m:s')).'.jpg';
                        $upload = uploadImage($_FILES[$img],$img_name);
                        if ($upload) {
                            $_POST['bie_img'][$i] = $img_name;
                        }
                    }
                }
                $_POST['bie_alm_id'] = json_encode([intval($_SESSION['alm']['alm_id'])],JSON_UNESCAPED_UNICODE);
                $_POST['bie_img'] = json_encode($_POST['bie_img'],JSON_UNESCAPED_UNICODE);
                $bbi = $this->bbienes->updateRegistro($_POST['bie_bbi_id']);
                $_POST['bie_bbi_id']  = ($bbi['status']) ? $_POST['bie_bbi_id']['bbi_id'] : null ;
                $arrBie = $_POST;
                unset($arrBie['bie_bat_id']);
                $bie = $this->bienes->updateRegistro($arrBie);
                $bie_bat_id = $this->batributos->selectRegistros(array('bat_bie_id'=>$_POST['bie_id']),array('bat_bie_id'));
                foreach ($bie_bat_id as $i => $bat) {
                    $status = true;
                    foreach ($_POST['bie_bat_id'] as $i => $batr) {
                        if (isset($batr['bat_id'])) {
                            if($bat['bat_id']==$batr['bat_id']) {
                                $status = false;
                            }
                        }
                    }
                    if($status){
                        $del = $this->batributos->deleteRegistro($bat['bat_id']);
                    }
                }
                foreach ($_POST['bie_bat_id'] as $i => $bat) {
                    if (!is_null($bat)) {
                        if (!isset($bat['bat_id'])) {
                            $bat['bat_bie_id']=$_POST['bie_id'];
                            $bat = $this->batributos->insertRegistro($bat);
                        } else {
                            $bat = $this->batributos->updateRegistro($bat);
                        }
                    }
                }
            }
            if (!empty($data)) {
                return $bie;
            }else{
                echo json_encode($bie,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function importExcel(){
        //SELECT * FROM bienes WHERE json_extract(bie_alm_id,'$[0]') = 2;
        $reader = new PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        $reader->setReadDataOnly(true);
        $spreadsheet = $reader->load('Assets/excel/bie.xlsx');
        $sheet = $spreadsheet->getSheet($spreadsheet->getFirstSheetIndex());
        $de = $sheet->toArray(); 
        $keys = array_shift($de);
        $re = array_map(function($values) use ($keys) {
            return array_combine($keys, $values); }, $de);
        $un = array_unique(array_column($re,'bie_id'));
        foreach ($un as $i => $d) {
            if (!empty($d)) {
                $ou = array();
                $pr = '';
                for ($j=0; $j < count($re); $j++) { 
                    if ($re[$j]['bie_bie_id'] == $un[$i]) {
                        array_push($ou,$re[$j]);
                    }
                    if (intval($re[$j]['bie_id']) == intval($un[$i])) {
                        $pr = $re[$j];
                    }
                }
                //$pr = $re[array_search($un[$i],array_column($re,'bie_id'))];
                $val = $this->valores->insertRegistro(array('val_pro_id'=>1,'val_valor'=>$pr['bie_bat_id']));
                $pr['bie_status'] = 1;
                $pr['bie_bie_id'] = '';
                $pr['bie_bbi_id'] = '{"bbi_id":"","bbi_t5e_id":"1","bbi_c70_id":1576,"bbi_c60_id":1170,"bbi_c61_id":1206}';
                $pr['bie_bat_id'] = '{"1":{"bat_val_id":'.$val["val_id"].'}}';
                $pr['bie_img'] = '[]';
                $pr['bie_igv'] = 0;
                $pr['bie_id'] = '';
                $bie1 = $this->setBien($pr);
                for ($k=0; $k <count($ou) ; $k++) {
                    // dep($num++); 
                    $ou[$k]['bie_status'] = 1;
                    $ou[$k]['bie_bie_id'] = $bie1['bie_id'];
                    $ou[$k]['bie_bbi_id'] = '{"bbi_id":"","bbi_t5e_id":"1","bbi_c70_id":1576,"bbi_c60_id":1170,"bbi_c61_id":1206}';
                    $ou[$k]['bie_bat_id'] = '{}';
                    $ou[$k]['bie_img'] = '[]';
                    $ou[$k]['bie_igv'] = 0;
                    $this->setBien($ou[$k]);
                }
            }
        }
        die();
    }
    public function setValor(){
        if ($_POST) {
            $val = $this->valores->insertRegistro($_POST);
            if ($val['status']) {
                $data = $this->valores->selectRegistro($val['val_id']);
                $arrResponse = array('status' => true, 'msg' =>'Datos guardados correctamente.','data' => $data);
            } else if($val['val_id'] == 'exist'){
                $arrResponse = array('status' => false, 'msg' =>'¡Atención! El Registro ya existe.');
            } else{
                $arrResponse = array('status' => false, 'msg' =>'¡Atención! Error al conectar a las BD');
            }
        } else {
            $arrResponse = array('status' => false, 'msg' => '¡Atención! No es posible Guardar los datos.');
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getPropiedades(){
        $arrData = $this->batibutosModel->selectPropiedades();
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getValores(){
        $pro_id = intval($_POST['pro_id']);
        $arrData = $this->batibutosModel->selectValores($pro_id);
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }    
    public function delBien(){      
        if($_POST){
            if($_SESSION['perMod']['gtp_r']){
                $bie_id = intval($_POST['bie_id']);
                $requestDelete = $this->model->deleteBien($bie_id);
                if($requestDelete)
                {
                    $arrResponse = array('status' => true, 'msg' => 'Se ha eliminado el Bien');
                }else{
                    $arrResponse = array('status' => false, 'msg' => 'Error al eliminar el Bien.');
                }
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function getHistorico($bie_id){
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $data['bie'] = $this->bienes->selectRegistro($bie_id,array('bie_bbi_id'));
        $data['mde'] = $this->mdetalles->selectRegistros(array('mde_bie_id'=>5),array('mde_bie_id','mov_age_id','mov_alm_id','mov_tce_id'));
        ob_end_clean();
        $html = getFile("Bienes/kardex",$data);
        $arrResponse = array("status" => true,"data" => $html);
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    } 
    public function prueba(){
        dep(json_encode([intval($_SESSION['alm']['alm_id'])],JSON_UNESCAPED_UNICODE));
        die();
    }

}
?>