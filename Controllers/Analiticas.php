<?php 
class Analiticas extends Controllers{
    public function __construct(){
        parent::__construct('movimientos');   
        $this->newModel('mdetalles');          
        $this->newModel('agentes');
        $this->newModel('empresas');
        $this->newModel('personas');
        $this->newModel('tcambios');
        $this->newModel('establecimientos');
        $this->newModel('t12operaciones');
        $this->newModel('t10comprobantes');
        $this->newModel('t2identidades');
        $this->newModel('tcespeciales');
        $this->newModel('tafectaciones');
        $this->newModel('bienes');
        $this->newModel('simulaciones');
        $this->newModel('t4monedas');
    }
    public function Analiticas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Porcentaje de Ventas";
        $data['page_title'] = "Porcentaje de Ventas";
        $data['page_name'] = "Porcentaje de Ventas";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo']); 
        $data['page_functions_js'] = array("functions_analiticas.js");
        $this->views->getView($this,"Analiticas",$data);
    }

    public function listc($fecha){
        $mov = $this->movimientos->selectCustoms('mov_id',array('mov_tipo'=>2,'custom'=>'mov_age_id is not null and DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$fecha));
        $mov = !empty(implode(',', array_column($mov, 'mov_id')))?implode(',', array_column($mov, 'mov_id')):0;
        $mde = $this->mdetalles->selectCustoms('mde_bie_id,SUM(mde_q) AS mde_q,SUM(mde_importe) as mde_importe',array(
                'custom'=>'mde_mov_id in ('.$mov.') GROUP BY mde_bie_id'),array('mde_bie_id'));
        return $mde;
        die();
    }
    public function liste($fecha){
        $mov = $this->movimientos->selectCustoms('mov_id',array('mov_tipo'=>1,'mov_t10_id'=>51,'custom'=>'mov_cue_id IS NOT NULL and mov_age_id is not null and DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$fecha));
        $mov = !empty(implode(',', array_column($mov, 'mov_id')))?implode(',', array_column($mov, 'mov_id')):0;
        $mde = $this->mdetalles->selectCustoms('mde_bie_id,SUM(mde_q) AS mde_q,SUM(mde_importe) as mde_importe',array(
                'custom'=>'mde_mov_id in ('.$mov.') GROUP BY mde_bie_id'),array('mde_bie_id'));
        return $mde;
        die();
    }
    public function listn($fecha){
        $mov = $this->movimientos->selectCustoms('mov_id',array('mov_tipo'=>1,'custom'=>'mov_t10_id != 51 AND  mov_age_id is not null and DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$fecha));
        $mov = !empty(implode(',', array_column($mov, 'mov_id')))?implode(',', array_column($mov, 'mov_id')):0;
        $mde = $this->mdetalles->selectCustoms('mde_bie_id,SUM(mde_q) AS mde_q,SUM(mde_importe) as mde_importe',array(
                'custom'=>'mde_mov_id in ('.$mov.') GROUP BY mde_bie_id'),array('mde_bie_id'));
        return $mde;
        die();
    }
    public function getAnaliticas($mes){
        $mov = $this->movimientos->searchRegistro(array('mov_fechaE'=>str_replace('"','',$mes).'-01','mov_t12_id'=>16),'mov_id');
        $mde = $this->mdetalles->selectCustoms('mde_bie_id,mde_q,mde_importe',array('mde_mov_id'=>$mov['mov_id']),array('mde_bie_id'));
        $si = array_column($mde,'mde_q','mde_bie_id');
        $msi = array_column($mde,'mde_importe','mde_bie_id');
        $pco = $this->listc($mes);
        $co = array_column($pco,'mde_q','mde_bie_id');
        $mco = array_column($pco,'mde_importe','mde_bie_id');
        $pvn = $this->listn($mes);
        $vn = array_column($pvn,'mde_q','mde_bie_id');
        $mvn = array_column($pvn,'mde_importe','mde_bie_id');
        $pve = $this->liste($mes);
        $ve = array_column($pve,'mde_q','mde_bie_id');
        $mve = array_column($pve,'mde_importe','mde_bie_id');
        $array = array();
        $bie = $this->bienes->selectRegistros(null,array('bie_bbi_id','bie_t6m_id'));
        foreach ($bie as $i => $r) {  
            $_si = $si[$r['bie_id']]??0;
            $_co = $co[$r['bie_id']]??0;
            $_vn = $vn[$r['bie_id']]??0;
            $_ve = $ve[$r['bie_id']]??0;

            $_min = floatval($msi[$r['bie_id']]??0)+floatval($mco[$r['bie_id']]??0);
            $_mou = floatval($mvn[$r['bie_id']]??0)+floatval($mve[$r['bie_id']]??0);

            if ($_si>0 || $_co>0 || $_vn>0 || $_ve>0 ) {
                array_push($array,array('ana_nombre'=>$r['bie_nombre'],'ana_si'=>$_si,'ana_min'=>$_min,'ana_co'=>$_co,'ana_vn'=>$_vn,'ana_ve'=>$_ve,'ana_mou'=>$_mou));
            }
            
        }
        echo json_encode($array,JSON_UNESCAPED_UNICODE);
        die();
    }
}
?>