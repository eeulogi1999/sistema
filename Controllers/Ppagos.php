<?php 
@ob_start();
class Ppagos extends Controllers{
    public function __construct(){
        parent::__construct('ppagos');   
        $this->newModel('colaboradores'); 
        $this->newModel('personas');
        $this->newModel('cajas');  
    }
    public function Ppagos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Pago Planillas";
        $data['page_title'] = "Pago Planillas ";
        $data['page_name'] = "Pago Planillas";
        $data['page_data'] = array('ppa_tipo'=>PPA_TIPO,
        'ppa'=>array('ppa_gus_id'=>$_SESSION['gus']['gus_id']),
        'caj'=>array('caj_tipo'=>3,'caj_numero'=>6,'caj_tga_id'=>10),
        'asi'=>array('asi_week'=>$_SESSION['asi']['asi_week']));
        $data['page_functions_js'] = array("functions_ppagos.js");
        $this->views->getView($this,"ppagos",$data);
    }
    public function getPpagos(){
        $pre = 'ppa';
        $tabla = $this->getTable($pre);
        $arrData = $this->{$tabla}->selectRegistros();
        for ($i=0; $i < count($arrData); $i++) {
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
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="delPpa('.$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
            }
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function delPpa($id){
        $ppa = $this->ppagos->selectRegistro($id);
        $res = array('status'=>false,'msg'=>'Error en el proceso');
        if (!empty($ppa)) {
            $del1 = $this->cajas->deleteRegistro($ppa['ppa_caj_id']['caj_id']);
            if ($del1) {
                $del2 = $this->ppagos->deleteRegistro($ppa['ppa_id']);
                if ($del2) {
                    $res = array('status'=>true,'msg'=>'Procesado Correctamente');
                }
            }
        }
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
        die();

    }
}
?>