<?php 
class Inversiones extends Controllers{
    public function __construct(){
        parent::__construct('inversiones');            
        $this->newModel('agentes');
    }
    public function Inversiones(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Resumen";
        $data['page_title'] = "Resumen";
        $data['page_name'] = "Resumen";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo'],'age_tipo' => 3); 
        $data['page_functions_js'] = array("functions_inversiones.js","functions_agentes.js");
        $this->views->getView($this,"inversiones",$data);
    }
    public function getInversiones(){
        $array = $this->inversiones->selectRegistros();
        echo json_encode($array,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getCuadre(){
        $age = $this->agentes->selectCustoms('age_id,age_gpe_id,age_json',array('age_tipo'=>3));
        $array = array();
        foreach ($age as $i => $d) {
            $obj = array();
            $obj['cua_gpe_id']=$d['age_gpe_id'];
            $obj['cua_si']=$this->inversiones->searchRegistro(array('inv_age_id'=>$d['age_id'],'inv_tipo'=>0, 
            'custom'=>'DATE_FORMAT(inv_fecha, "%Y-%m") = '.$_SESSION['periodo']),'inv_monto')['inv_monto']??0;
            $obj['cua_ing']=$this->inversiones->searchRegistro(array('inv_age_id'=>$d['age_id'],'inv_tipo'=>1,
            'custom'=>'DATE_FORMAT(inv_fecha, "%Y-%m") = '.$_SESSION['periodo']),'SUM(inv_monto) as ing')['ing']??0;
            $obj['cua_egr']=$this->inversiones->searchRegistro(array('inv_age_id'=>$d['age_id'],'inv_tipo'=>2,
            'custom'=>'DATE_FORMAT(inv_fecha, "%Y-%m") = '.$_SESSION['periodo']),'SUM(inv_monto) as egr')['egr']??0;
            $obj['cua_saldo']=$obj['cua_ing']-$obj['cua_egr'];
            $porc = !empty($d['age_json']) ?floatval(json_decode($d['age_json'],true)['age_porc'])??0:0;
            $obj['cua_porc'] = '<input type="text" value="'.number_format($porc ,2,'.',',').'" size="4" onChange="setPoc('.$d['age_id'].',event)">';
            $btnView = '<button class="btn btn-warning  btn-sm" onClick="viewInv('.$d['age_id'].',`'.$d['age_gpe_id']['gpe_nombre'].'`,'.$obj['cua_saldo'].')" title="Ver"><i class="far fa-eye"></i></button>'; 
            $obj['cua_com'] = $obj['cua_saldo']*($porc/100);
            $obj['cua_total'] = $obj['cua_saldo']+$obj['cua_com'];
            $obj['cua_opc'] = '<div class="text-center">'.$btnView.'</div>';
            array_push($array,$obj);
        }
        echo json_encode($array,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getIngreso($id){
        $array=$this->inversiones->selectRegistros(array('inv_age_id'=>$id,'custom'=>'inv_tipo in (0,1)'));
        echo json_encode($array,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getEgreso($id){
        $array=$this->inversiones->selectRegistros(array('inv_age_id'=>$id,'custom'=>'inv_tipo in (2)'));
        echo json_encode($array,JSON_UNESCAPED_UNICODE);
        die();
    }

}
?>