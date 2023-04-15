<?php 
@ob_start();
class Planillas extends Controllers{
    public function __construct(){
        parent::__construct('asistencias');   
        $this->newModel('colaboradores'); 
        $this->newModel('ppagos'); 
        $this->newModel('sweeks'); 
    }
    public function Planillas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Planillas";
        $data['page_title'] = "Planillas ";
        $data['page_name'] = "Planillas";
        $data['page_data'] = array('asi'=>array('asi_week'=>$_SESSION['asi']['asi_week']));
        $data['page_functions_js'] = array("functions_planillas.js","functions_asistencias.js");
        $this->views->getView($this,"planillas",$data);
    }
    public function getPlanillas($res = false){
        $rwcol = $this->colaboradores->selectRegistros(array('col_status'=>1));
        $rw = array();
        for ($i=0; $i < count($rwcol); $i++) { 
            $week = intval(explode('W',$_SESSION['asi']['asi_week'])[1]);
            $r['pla_ndias'] = $this->asistencias->searchRegistro(array('asi_col_id'=>$rwcol[$i]["col_id"],
            'custom'=>'asi_ext IS NULL AND WEEKOFYEAR(asi_horaE) = "'.$week.'"'),
            "COUNT(DISTINCT(DATE_FORMAT(asi_horaE, '%Y-%m-%d'))) as 'nd'")['nd'];
            $r['pla_col_id'] = $rwcol[$i];
            $rwnh = $this->asistencias->selectRegistros(array('asi_col_id'=>$rwcol[$i]["col_id"],
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
            $r['pla_hweek'] = $nh;

            $r['pla_sweek'] = $r['pla_col_id']['col_sbase']/4;
            $hsbase = $r['pla_col_id']['col_hsbase']?json_decode($r['pla_col_id']['col_hsbase'],true):null;
            if (!empty($hsbase)) {
                foreach ($hsbase as $k => $hsb) {
                    if (intval((new DateTime($hsb['col_fecha']))->format('W'))>$week) {
                        $r['pla_sweek'] = floatval($hsb['col_sbase'])/4;
                    }
                }
            }
            $sat = date('Y-m-d',strtotime('saturday this week',strtotime($_SESSION['asi']['asi_week'])));
            $sab = $this->asistencias->searchRegistro(array('asi_col_id'=>$rwcol[$i]["col_id"],'custom'=>'DATE_FORMAT(asi_horaE, "%Y-%m-%d") = "'.$sat.'"'));
            $ht = 0;
            if ($r['pla_ndias']<6) {
                if (!empty($sab)) {
                    $ht = ($r['pla_ndias']*9)-3;
                } else {
                    $ht = ($r['pla_ndias']*9);
                }
            } else {
                $ht = 51;
            }
            // $r['sab'] = $sab;
            $r['pla_hextras'] =  ($r['pla_ndias']>0)?$r['pla_hweek']-$ht:0; // pla_estado
            $r['pla_mhxtras'] =  0;
            if ($r['pla_hextras']>0) {
                $r['pla_mhxtras'] =  $r['pla_hextras']*(($r['pla_sweek']/6)/8);
            }
            if ($r['pla_hextras']<0) {
                $r['pla_mhxtras'] =  $r['pla_hextras']*(($r['pla_sweek']/6)/9);
            }
            $r['pla_sueldo'] = $r['pla_ndias']*($r['pla_sweek']/6);    //($r['pla_ndias'])*($r['pla_sweek']/6)+$r['pla_mhxtras'];
            $add = $this->ppagos->selectRegistros(array('ppa_col_id'=>$rwcol[$i]["col_id"],'custom'=>'WEEKOFYEAR(ppa_fecha) = "'.$week.'"'));
            $pla_adelantos = 0;
            foreach ($add as $t => $d) {
                $pla_adelantos+=abs($d['ppa_caj_id']['caj_monto']);
            }
            $r['pla_adelantos'] = $pla_adelantos;
            $r['pla_saldo'] = 0;

            $swe = $this->sweeks->searchRegistro(array(
                'swe_col_id'=>$rwcol[$i]['col_id'],
                'swe_week'=>$week-1));

            if (!empty($swe)) {
                $r['pla_saldo'] = floatval($swe['swe_saldo']);
            }
            $r['pla_tpagar'] = $r['pla_saldo']-abs($r['pla_adelantos']);

            if ($r['pla_ndias']>0) {
                $r['pla_tpagar'] += $r['pla_sueldo']+$r['pla_mhxtras'];
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
            $view = '<button class="btn btn-success btn-sm" onClick="viewAsi('.$rwcol[$i]["col_id"].')" title="Asistencias"><i class="far fa-eye"></i></button>'; 
            $r['pla_options'] = '<div class="text-center">'.$view.'</div>';

            array_push($rw,$r); 
        }
        if ($res) {
            return $rw;
        } else {
            echo json_encode($rw,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function saveColSaldos(){
        $pla = $this->getPlanillas(true);
        $swe = array('status'=>false,'msg'=>'Error en el Proceso');
        for ($i=0; $i < count($pla); $i++) { 
            if (intval($pla[$i]['pla_tpagar'])!= 0) {
                $swe = $this->sweeks->searchRegistro(array(
                    'swe_col_id'=>$pla[$i]['pla_col_id']['col_id'],
                    'swe_week'=>intval(explode('W',$_SESSION['asi']['asi_week'])[1])));
                if (!empty($swe)) {
                    $swe = $this->sweeks->updateRegistro(array( 
                        'swe_id'=>$swe['swe_id'],
                        'swe_col_id'=>$pla[$i]['pla_col_id']['col_id'],
                        'swe_week'=>intval(explode('W',$_SESSION['asi']['asi_week'])[1]),
                        'swe_saldo'=>$pla[$i]['pla_tpagar']));
                } else {
                    $swe = $this->sweeks->insertRegistro(array(
                        'swe_col_id'=>$pla[$i]['pla_col_id']['col_id'],
                        'swe_week'=>intval(explode('W',$_SESSION['asi']['asi_week'])[1]),
                        'swe_saldo'=>$pla[$i]['pla_tpagar']),array('swe_col_id','swe_week'));
                }
            }

        }
        echo json_encode($swe,JSON_UNESCAPED_UNICODE);
        die();
    }

    
}

?>