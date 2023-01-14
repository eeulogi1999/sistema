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
            $week = intval(explode('W',$_SESSION['asi']['asi_week'])[1]);
            $r1 = $this->getPlaCol($rwcol[$i],$week-1);
            $r = $this->getPlaCol($rwcol[$i],$week);
            $r['pla_saldo'] = $r1['pla_tpagar'];
            $r['pla_tpagar'] = 0;
            if ($r['pla_ndias']>0) {
                if (intval($week)-1==0) {
                    $r['pla_saldo'] = 0;
                    $r['pla_tpagar'] = $r['pla_sweek']+$r['pla_mhxtras']-abs($r['pla_adelantos']);
                } else {
                    $r['pla_tpagar'] = $r['pla_sweek']+$r['pla_saldo']+$r['pla_mhxtras']-abs($r['pla_adelantos']);
                }
            }
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

            array_push($rw,$r); 
        }
        echo json_encode($rw,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getPlaCol($col,$week){
        $r['pla_ndias'] = $this->asistencias->searchRegistro(array('asi_col_id'=>$col["col_id"],
        'custom'=>'asi_ext IS NULL AND WEEKOFYEAR(asi_horaE) = "'.$week.'"'),
        "COUNT(DISTINCT(DATE_FORMAT(asi_horaE, '%Y-%m-%d'))) as 'nd'")['nd'];
        $r['pla_col_id'] = $col;
        $rwnh = $this->asistencias->selectRegistros(array('asi_col_id'=>$col["col_id"],
        'custom'=>'asi_ext IS NULL AND WEEKOFYEAR(asi_horaE) = "'.$week.'"'));
        $nh = 0;
        $nm = (new DateTime)->setTime(0,0,0);
        for ($j=0; $j < count($rwnh); $j++) { 
            $dt1 = new DateTime($rwnh[$j]['asi_horaE']);
            $dt2 = new DateTime($rwnh[$j]['asi_horaS']);
            $dif = $dt1->diff($dt2);
            $nmh = (intval($nm->format('h'))<12)?intval($nm->format('h')):0;
            $nh += intval($dif->format('%h')) +$nmh;
            $nm = (new DateTime)->setTime(0,intval($nm->format('i')),0);
            $nm = $nm->modify('+'.$dif->format('%i').' minute');
        }
        $nh += (intval($nm->format('h'))<12)?intval($nm->format('h')):0;
        $nm = (intval($nm->format('i'))>0)?intval($nm->format('i'))/60:0;
        $nh += $nm;
        $view = '<button class="btn btn-warning btn-sm" onClick="viewAsi('.$col["col_id"].')" title="Ver Planilla"><i class="far fa-eye"></i></button>'; 
        $r['pla_hweek'] = $nh;
        $r['pla_sweek'] = $r['pla_col_id']['col_sbase']/4;
        $r['pla_hextras'] =  ($r['pla_ndias']>4)?$nh-51:0; // pla_estado
        $r['pla_mhxtras'] =  0;
        if ($r['pla_hextras']>0) {
            $r['pla_mhxtras'] =  $r['pla_hextras']*(($r['pla_sweek']/6)/8);
        }
        if ($r['pla_hextras']<0) {
            $r['pla_mhxtras'] =  $r['pla_hextras']*(($r['pla_sweek']/6)/9);
        }
        $r['pla_sueldo'] = $r['pla_ndias']*($r['pla_sweek']/6);    //($r['pla_ndias'])*($r['pla_sweek']/6)+$r['pla_mhxtras'];
        $add = $this->ppagos->selectRegistros(array('ppa_col_id'=>$col["col_id"],'custom'=>'WEEKOFYEAR(ppa_fecha) = "'.$week.'"'));
        $pla_adelantos = 0;
        foreach ($add as $t => $d) {
            $pla_adelantos+=abs($d['ppa_caj_id']['caj_monto']);
        }
        $r['pla_adelantos'] = $pla_adelantos;
        $r['pla_tpagar'] = $r['pla_sweek']+$r['pla_mhxtras']-abs($r['pla_adelantos']);
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
        return $r;
    }
    public function saveColSaldos(){
        $rwcol = $this->colaboradores->selectRegistros();
        for ($i=0; $i < count($rwcol); $i++) { 
            $week = intval(explode('W',$_SESSION['asi']['asi_week'])[1]);
            $r1 = $this->getPlaCol($rwcol[$i],$week-1);
            $r = $this->getPlaCol($rwcol[$i],$week);
            $r['pla_saldo'] = $r1['pla_tpagar'];
            $r['pla_tpagar'] = $r['pla_saldo']+$r['pla_sueldo']+$r['pla_mhxtras']-$r['pla_adelantos'];
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
            $this->colaboradores->undateRegistro(array('pla_col_id'=>$rwcol[$i]['col_id'],'pla_ppagos'=>json_encode(array(),JSON_UNESCAPED_UNICODE)));
            array_push($rw,$r); 
        }
    }

    
}

?>