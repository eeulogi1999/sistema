<?php 
@ob_start();
class Cajas extends Controllers{
    public function __construct(){
        parent::__construct('cajas');   
        //$this->newModel('cuentas');
        getPermisos(2); 
    }
    public function Ingresos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Ingresos";
        $data['page_title'] = "Ingresos";
        $data['page_name'] = "Ingresos";
        $num = $this->cajas->searchRegistro(array('caj_tipo'=>1),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('age_tipo' => 0,
        'caj'=>array('caj_tipo'=>1,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_cajas.js","functions_agentes.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Egresos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Egresos";
        $data['page_title'] = "Egresos";
        $data['page_name'] = "Egresos";
        $num = $this->cajas->searchRegistro(array('caj_tipo'=>2),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('age_tipo' => 0,
        'caj'=>array('caj_tipo'=>2,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_cajas.js","functions_agentes.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Scuentas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Saldo de cuentas";
        $data['page_title'] = "Saldo de cuentas";
        $data['page_name'] = "Saldo de cuentas";
        $num = $this->cajas->searchRegistro(array('caj_tipo'=>0),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('caj'=>array('caj_tipo'=>0,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_cajas.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Gastos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Gastos";
        $data['page_title'] = "Gastos";
        $data['page_name'] = "Gastos";
        $num = $this->cajas->searchRegistro(array('caj_tipo'=>3),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('caj'=>array('caj_tipo'=>3,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_cajas.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Subgastos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Gastos";
        $data['page_title'] = "Gastos";
        $data['page_name'] = "Gastos";
        $data['page_data'] = array(); 
        $data['page_functions_js'] = array("functions_subgastos.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Cinternos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Movimiento Interno";
        $data['page_title'] = "Movimiento Interno";
        $data['page_name'] = "Movimiento Interno";
        $num = $this->cajas->searchRegistro(array('caj_tipo'=>5),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('caj'=>array('caj_tipo'=>5,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_cajas.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Iadicionales(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Ingresos Otros";
        $data['page_title'] = "Ingresos Otros";
        $data['page_name'] = "Ingresos Otros";
        $num = $this->cajas->searchRegistro(array('caj_tipo'=>4),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('caj'=>array('caj_tipo'=>4,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_cajas.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function getCajas($caj_tipo){
        $arrData = $this->cajas->selectRegistros(array('caj_tipo'=>$caj_tipo,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']));
        $pre = 'caj'; $tabla = 'Cajas';
        for ($i=0; $i < count($arrData); $i++) { 
            $btnView = '';
            $btnEdit = '';
            $btnDelete = '';
            $arrData[$i][$pre.'_nro'] = $i+1;
            if (!empty($arrData[$i]['caj_age_id'])) {
                $arrData[$i][$pre.'_age_ide'] = (!empty($arrData[$i]['caj_age_id']['age_gem_id'])) ? $arrData[$i]['caj_age_id']['age_gem_id']['gem_razonsocial'] : $arrData[$i]['caj_age_id']['age_gpe_id']['gpe_nombre'] ;
            }
            $arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
            if($_SESSION['perMod']['gtp_r']){
                $btnView = '<button class="btn btn-info btn-sm" onClick="viewCaj('.$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
            }
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="editCaj('.$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
            }
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getNumCajas(){
        $_POST['custom'] = 'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'];
        $caj_numero = $this->cajas->searchRegistro($_POST,"MAX(caj_numero) as 'next'")['next'];
        $arrData = array('caj_numero'=>str_pad($caj_numero+1,8,0,STR_PAD_LEFT));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getDetalles($cue_id){
        $arrData = $this->cajas->selectRegistros(array('caj_cue_id'=>$cue_id,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']));
        for ($i=0; $i < count($arrData); $i++) { 
            $arrData[$i]['caj_nro'] = $i+1;
            $arrData[$i]['caj_tipo'] = CAJ[$arrData[$i]['caj_tipo']];
            if (!empty($arrData[$i]['caj_age_id'])) {
                if (!empty($arrData[$i]['caj_age_id']['age_gem_id'])) {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gem_id']['gem_razonsocial'];
                } else {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gpe_id']['gpe_nombre'];
                }
            }else {
                $arrData[$i]['caj_age_id']['age_nombre'] = '';
            }
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getI($cue_id){
        $arrData = $this->cajas->selectRegistros(array('caj_tipo'=>1,'caj_cue_id'=>$cue_id,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' ORDER BY caj_fecha ASC'));
        for ($i=0; $i < count($arrData); $i++) { 
            $arrData[$i]['caj_nro'] = $i+1;
            $arrData[$i]['caj_tipo'] = CAJ[$arrData[$i]['caj_tipo']];
            if (!empty($arrData[$i]['caj_age_id'])) {
                if (!empty($arrData[$i]['caj_age_id']['age_gem_id'])) {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gem_id']['gem_razonsocial'];
                } else {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gpe_id']['gpe_nombre'];
                }
            }else {
                $arrData[$i]['caj_age_id']['age_nombre'] = '';
            }
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getE($cue_id){
        $arrData = $this->cajas->selectRegistros(array('caj_tipo'=>2,'caj_cue_id'=>$cue_id,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' ORDER BY caj_fecha ASC'));
        for ($i=0; $i < count($arrData); $i++) { 
            $arrData[$i]['caj_nro'] = $i+1;
            $arrData[$i]['caj_tipo'] = CAJ[$arrData[$i]['caj_tipo']];
            if (!empty($arrData[$i]['caj_age_id'])) {
                if (!empty($arrData[$i]['caj_age_id']['age_gem_id'])) {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gem_id']['gem_razonsocial'];
                } else {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gpe_id']['gpe_nombre'];
                }
            }else {
                $arrData[$i]['caj_age_id']['age_nombre'] = '';
            }
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getG($cue_id){
        $arrData = $this->cajas->selectRegistros(array('caj_tipo'=>3,'caj_cue_id'=>$cue_id,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' ORDER BY caj_fecha ASC'));
        for ($i=0; $i < count($arrData); $i++) { 
            $arrData[$i]['caj_nro'] = $i+1;
            $arrData[$i]['caj_tipo'] = CAJ[$arrData[$i]['caj_tipo']];
            if (!empty($arrData[$i]['caj_age_id'])) {
                if (!empty($arrData[$i]['caj_age_id']['age_gem_id'])) {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gem_id']['gem_razonsocial'];
                } else {
                    $arrData[$i]['caj_age_id']['age_nombre'] = $arrData[$i]['caj_age_id']['age_gpe_id']['gpe_nombre'];
                }
            }else {
                $arrData[$i]['caj_age_id']['age_nombre'] = '';
            }
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getGastos(){
        $arrData = $this->cajas->selectCustoms('caj_tga_id,ABS(SUM(caj_monto)) as caj_monto',array('caj_tipo'=>3,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' GROUP BY caj_tga_id'));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    

}