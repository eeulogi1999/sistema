<?php 
@ob_start();
class Planillas extends Controllers{
    public function __construct(){
        parent::__construct('asistencias');   
        $this->newModel('colaboradores'); 
        $this->newModel('ppagos'); 
    }
    public function Planillas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Planillas";
        $data['page_title'] = "Planillas ";
        $data['page_name'] = "Planillas";
        $data['page_data'] = array('asi'=>array('asi_week'=>$_SESSION['asi']['asi_week']));
        $data['page_functions_js'] = array("functions_planillas.js");
        $this->views->getView($this,"planillas",$data);
    }
    public function getPlanillas(){
        $rwcol = $this->colaboradores->selectRegistros();
        $rw = array();
        for ($i=0; $i < count($rwcol); $i++) { 
            $r['pla_col_id'] = $rwcol[$i];
            $r['pla_ndias'] = $this->asistencias->searchRegistro(array('asi_col_id'=>$rwcol[$i]['col_id'],
            'custom'=>'asi_ext IS NULL AND WEEKOFYEAR(asi_horaE) = "'.explode('W',$_SESSION['asi']['asi_week'])[1].'"'),
            "COUNT(asi_id) as 'nd'")['nd'];

            $rwnh = $this->asistencias->selectRegistros(array('asi_col_id'=>$rwcol[$i]['col_id'],'asi_ext'=>1,
            'custom'=>'WEEKOFYEAR(asi_horaE) = "'.explode('W',$_SESSION['asi']['asi_week'])[1].'"'));
            $nh = 0;
            for ($j=0; $j < count($rwnh); $j++) { 
                $dt1 = new DateTime($rwnh[$j]['asi_horaE']);
                $dt2 = new DateTime($rwnh[$j]['asi_horaS']);
                $dif = $dt1->diff($dt2);
                $nh+=intval($dif->format('%h'));
            }
            $view = '<button class="btn btn-warning btn-sm" onClick="viewAsi('.$r['pla_col_id']['col_id'].')" title="Ver Planilla"><i class="far fa-eye"></i></button>'; 
            $r['pla_hweek'] = $nh;
            $r['pla_sweek'] = $r['pla_col_id']['col_sbase']/4;
            $r['pla_hextras'] =  $nh; // pla_estado
            $r['pla_mhxtras'] =  $r['pla_hextras']*(($r['pla_sweek']/6)/8);
            $r['pla_sueldo'] = $r['pla_ndias']*($r['pla_sweek']/6);    //($r['pla_ndias'])*($r['pla_sweek']/6)+$r['pla_mhxtras'];
            
            $add = $this->ppagos->selectRegistros(array('ppa_col_id'=>$rwcol[$i]['col_id'],'custom'=>'WEEKOFYEAR(ppa_fecha) = "'.explode('W',$_SESSION['asi']['asi_week'])[1].'"'));
            $pla_adelantos = 0;
            foreach ($add as $t => $d) {
                $pla_adelantos+=abs($d['ppa_caj_id']['caj_monto']);
            }
            $r['pla_adelantos'] = $pla_adelantos;
            $r['pla_tpagar'] = $r['pla_sueldo']-$r['pla_adelantos'];
            switch (true) {
                case $r['pla_tpagar']<0:
                    $text = '<span class="badge badge-danger">POR COBRAR</span>';
                    break;
                case $r['pla_tpagar']>0:
                    $text = '<span class="badge badge-warning">POR PAGAR</span>';
                    break;
                default:
                    $text = '<span class="badge badge-success">OK</span>';
                    break;
            }
            $r['pla_status'] = $text;
            $r['pla_options'] = '<div class="text-center">'.$view.'</div>';
            array_push($rw,$r); 
        }
        echo json_encode($rw,JSON_UNESCAPED_UNICODE);
        die();
    }
    
}