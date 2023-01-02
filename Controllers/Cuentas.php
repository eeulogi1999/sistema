<?php 
@ob_start();
class Cuentas extends Controllers{
    public function __construct(){
        parent::__construct('cuentas');   
        $this->newModel('cajas');
        getPermisos(4); 
    }
    public function Cuentas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Cuentas";
        $data['page_title'] = "Cuentas";
        $data['page_name'] = "Cuentas";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_cuentas.js");
        $this->views->getView($this,"cuentas",$data);
    }
    public function getCuentas($p=null,$res=false){
        if (!empty($p)) {
            if ($p=='1') {
                $arrData = $this->cuentas->selectRegistros(array('cue_id'=>22));
            } else {
                $arrData = $this->cuentas->selectRegistros(array('custom'=>'cue_id != 22'));
            }
        } else {
            $arrData = $this->cuentas->selectRegistros();
        }
        $pre = 'cue'; $tabla = 'Cuentas';
        for ($i=0; $i < count($arrData); $i++) { 
            $btnView = '';
            $btnEdit = '';
            $btnDelete = '';
            $btnStatus = '';
             $arrData[$i][$pre.'_nro'] = $i+1;
            $arrData[$i][$pre.'_saldo'] = $this->cajas->searchRegistro(array('caj_cue_id'=>$arrData[$i][$pre.'_id'],'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),' SUM(caj_monto) AS saldo ')['saldo'];
            $arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
            if($_SESSION['perMod']['gtp_r']){
                $btnView = '<button class="btn btn-info btn-sm" onClick="viewCue('.$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
            }
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                //$btnStatus =  '<label class="switch"><input type="checkbox" id="set_gtc" '.($arrData[$i][$pre.'_status']).' onchange="off(this,'."'".$pre."',".$arrData[$i][$pre.'_id'].')"><span class="slider round"></span></label>';
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
            }
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.'</div>';
        }
        if ($res) {
            return $arrData;
        } else {
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        }
        die();
    }
    public function cierre(){
        $sal = $this->getCuentas(null,true);
        $r = array('status' => false,'msg' => "No procesado");
        for ($i=0; $i < count($sal); $i++) { 
            $caj = array();
            $caj['caj_tipo'] = 0;
            $caj['caj_numero'] = $i;
            $caj['caj_cue_id'] = $sal[$i]['cue_id'];
            $caj['caj_monto'] = $sal[$i]['cue_saldo'];
            $caj['caj_fecha'] = '2023-01-01';
            $d = $this->cajas->insertRegistro($caj);
            $r = array('status' => true,'msg' => "Procesado Correctamente");
        }
        echo json_encode($r,JSON_UNESCAPED_UNICODE);
        die();
    }
    

}