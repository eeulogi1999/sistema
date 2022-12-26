<?php 
@ob_start();
class Modulos extends Controllers{
    public function __construct(){
        parent::__construct('modulos');   
        if(empty($_SESSION['login'])){
            header('Location: '.base_url().'/login');
            die();
        }
        getPermisos(1);
        $this->newModel('tpermisos');
        $this->newModel('modulos');
    }
    public function Modulos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Roles";
        $data['page_title'] = "Roles ";
        $data['page_name'] = "Roles";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_modulos.js");
        $this->views->getView($this,"modulos",$data);
    }

    public function getTretable($id,$custom = null,$nro = null){
        $pre = 'gmo';
        $tabla = 'modulos';
        if (!empty($custom)) {
            $arrData = $this->modulos->selectRegistros($custom);
        } else {
            $arrData = $this->modulos->selectRegistros(array("gmo_gmo_id"=>$id));
        }
        $arr = array();
        for ($i=0; $i < count($arrData); $i++) {
                $btnView = '';
                $btnEdit = '';
                $btnDelete = '';
                $arrData[$i]['bie_nro'] = (is_null($nro)) ? $i+1 : $nro.'.'.($i+1) ;
                if (isset($arrData[$i][$pre.'_status'])) {
                    $arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
                }
                if($_SESSION['perMod']['gtp_r']){
                    $btnView = '<button class="btn btn-info btn-sm" onClick="view('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
                }
                if($_SESSION['perMod']['gtp_u']){
                    $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
                }
                if($_SESSION['perMod']['gtp_d']){
                    $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
                }
                $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
                array_push($arr,$arrData[$i]); 
                $child = $this->getTretable($arrData[$i]['gmo_id'],null,$arrData[$i]['bie_nro']);
                for ($j=0; $j < count($child) ; $j++) { 
                    array_push($arr,$child[$j]);    
                }
        }
        return $arr;
    }
    public function getModulos(){
        $arrData = $this->getTretable(null,array("custom"=>"gmo_gmo_id IS NULL"));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }

}