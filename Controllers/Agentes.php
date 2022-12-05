<?php 

@ob_start();
class Agentes extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));
        $this->newModel('t2identidades');
        getPermisos(1);
    }

    public function Clientes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Clientes";
        $data['page_title'] = "Clientes";
        $data['page_name'] = "Clientes";
        $data['page_data'] = array('age_tipo' => 2);
        $data['page_functions_js'] = array("functions_agentes.js","functions_empresas.js","functions_personas.js");
        $this->views->getView($this,"agentes",$data);
    }
    public function Proveedores(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Proveedores";
        $data['page_title'] = "Proveedores";
        $data['page_name'] = "Proveedores";
        $data['page_data'] = array('age_tipo' => 1);
        $data['page_functions_js'] = array("functions_agentes.js","functions_empresas.js","functions_personas.js");
        $this->views->getView($this,"agentes",$data);
    }
    public function getAgentes($age_tipo){
        if (intval($age_tipo)>0) {
            $arrData = $this->agentes->selectRegistros(array('age_tipo'=>$age_tipo));
        }else {
            $arrData = $this->agentes->selectRegistros();
        }
        
        $pre = 'age'; $tabla = 'Agentes';
        for ($i=0; $i < count($arrData); $i++) { 
            $btnView = '';
            $btnEdit = '';
            $btnDelete = '';
            $arrData[$i][$pre.'_nro'] = $i+1;
            if (!empty($arrData[$i]['age_gem_id'])) {
                $arrData[$i]['age_ide'] =         $arrData[$i]['age_gem_id']['gem_ruc'];
                $arrData[$i]['age_nombre'] =      $arrData[$i]['age_gem_id']['gem_razonsocial'];
                $arrData[$i]['age_direccion'] =   $arrData[$i]['age_gem_id']['gem_direccion'];
                $arrData[$i]['age_email'] =       $arrData[$i]['age_gem_id']['gem_email'];
                $arrData[$i]['age_gdi_id'] =      $arrData[$i]['age_gem_id']['gem_gdi_id'];
                $arrData[$i]['age_gt2_id'] =      $this->t2identidades->selectRegistro(4);
            } else {
                $arrData[$i]['age_ide'] =         $arrData[$i]['age_gpe_id']['gpe_identificacion'];
                $arrData[$i]['age_nombre'] =      $arrData[$i]['age_gpe_id']['gpe_nombre'].', '.$arrData[$i]['age_gpe_id']['gpe_apellidos'];
                $arrData[$i]['age_direccion'] =   $arrData[$i]['age_gpe_id']['gpe_direccion'];
                $arrData[$i]['age_email'] =       $arrData[$i]['age_gpe_id']['gpe_email'];
                $arrData[$i]['age_gdi_id'] =      $arrData[$i]['age_gpe_id']['gpe_gdi_id'];
                $arrData[$i]['age_gt2_id'] =      $arrData[$i]['age_gpe_id']['gpe_gt2_id'];
            }
            $arrData[$i][$pre.'_tipo'] = '<span class="badge badge-'.AGE_TIPO[array_keys(AGE_TIPO)[$arrData[$i][$pre.'_tipo']]].'">'.array_keys(AGE_TIPO)[$arrData[$i][$pre.'_tipo']].'</span>';
            $arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
            if($_SESSION['perMod']['gtp_r']){
                $btnView = '<button class="btn btn-info btn-sm" onClick="view('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
            }
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
            }
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }


}

?>