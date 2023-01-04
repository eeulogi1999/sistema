<?php 
@ob_start();
class Roles extends Controllers{
    public function __construct(){
        parent::__construct('roles');   
        if(empty($_SESSION['login'])){
            header('Location: '.base_url().'/login');
            die();
        }
        $this->newModel('tpermisos');
        $this->newModel('modulos');
    }
    public function Roles(){
        $data['page_tag'] = "Roles";
        $data['page_title'] = "Roles ";
        $data['page_name'] = "Roles";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_roles.js");
        $this->views->getView($this,"roles",$data);
    }
    public function getRoles(){
        $pre = 'gro';
        $tabla = 'roles';
        $this->newModel($tabla);
        $arrData = $this->{$tabla}->selectRegistros();
        for ($i=0; $i < count($arrData); $i++) {
            $btnView = '';
            $btnEdit = '';
            $btnDelete = '';
            $btn = '';
            if (isset($arrData[$i][$pre.'_status'])) {
                $arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
            }
                $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
                $btn = '<button class="btn btn-warning btn-sm" onClick="tpe('.$arrData[$i][$pre.'_id'].')" title="Conceder Permisos"><i class="fas fa-user-lock"></i></button>';
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.' '.$btn.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }


    public function getTpermisos($id){
        $arrData = $this->tpermisos->selectRegistros(array('gtp_gro_id'=>$id));
        $arr = array();
        $arrGmo = $this->modulos->selectRegistros();
        foreach ($arrGmo as $n => $v) {
            $d = $this->tpermisos->searchRegistro(array('gtp_gro_id'=>$id,'gtp_gmo_id'=>$v['gmo_id']));
            if (empty($d)) {
                $d = $this->tpermisos->insertRegistro(array('gtp_gro_id'=>$id,'gtp_gmo_id'=>$v['gmo_id']));
                $d = $this->tpermisos->selectRegistro($d['gtp_id']);
            }
            $d['gtp_r'] = '<div class="custom-control custom-switch">
            <input type="checkbox" class="custom-control-input" id="gtp_r_'.$d['gtp_id'].'" '.(($d['gtp_r']==1)?'checked':'').' onclick="set(`gtp`,null,{gtp_id:'.$d['gtp_id'].',gtp_r:+$(`#gtp_r_'.$d['gtp_id'].'`).prop(`checked`)},true)">
            <label class="custom-control-label" for="gtp_r_'.$d['gtp_id'].'"></label>
            </div>';
            $d['gtp_w'] = '<div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="gtp_w_'.$d['gtp_id'].'" '.(($d['gtp_w']==1)?'checked':'').' onclick="set(`gtp`,null,{gtp_id:'.$d['gtp_id'].',gtp_w:+$(`#gtp_w_'.$d['gtp_id'].'`).prop(`checked`)},true)">
                <label class="custom-control-label" for="gtp_w_'.$d['gtp_id'].'"></label>
            </div>';
            $d['gtp_u'] = '<div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="gtp_u_'.$d['gtp_id'].'" '.(($d['gtp_u']==1)?'checked':'').' onclick="set(`gtp`,null,{gtp_id:'.$d['gtp_id'].',gtp_u:+$(`#gtp_u_'.$d['gtp_id'].'`).prop(`checked`)},true)">
                <label class="custom-control-label" for="gtp_u_'.$d['gtp_id'].'"></label>
            </div>';
            $d['gtp_d'] = '<div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="gtp_d_'.$d['gtp_id'].'" '.(($d['gtp_d']==1)?'checked':'').' onclick="set(`gtp`,null,{gtp_id:'.$d['gtp_id'].',gtp_d:+$(`#gtp_d_'.$d['gtp_id'].'`).prop(`checked`)},true)">
                <label class="custom-control-label" for="gtp_d_'.$d['gtp_id'].'"></label>
            </div>';
            array_push($arr,$d);
        }
        echo json_encode($arr,JSON_UNESCAPED_UNICODE);
        die();
    }

}