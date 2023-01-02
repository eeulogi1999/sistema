<?php 
@ob_start();
require_once 'Libraries/dompdf/vendor/autoload.php';
class Reportes extends Controllers{ 
    public function __construct(){
        parent::__construct('bienes');  
        $this->newModel('cierremeses');
        $this->newModel('movimientos');
        $this->newModel('mdetalles');
        $this->newModel('t12operaciones');
        $this->newModel('batributos');
        $this->customModel('ReportesModel');
    }
    public function Reportes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Reportes";
        $data['page_title'] = "Reportes";
        $data['page_name'] = "Reportes";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"reportes",$data);
    }                                                                                                   //0->saldos 1->kardex 2->cve
    public function getCostoBien(int $bie_id, $f_inicio = null, $f_fin = null,int $tipo = 0){ //tipo false=kardex true=cierre
        $arrMde = $this->ReportesModel->selectCostoBie(intval($bie_id),$f_inicio,$f_fin);        //data de detalles
        $qs=0;               //saldo cantidad continua             
        $mts=0;             //saldo monto continuo
        $qcv = 0;       //cantidad venta
        $mtcv = 0;      // costo de venta
        $mtv = 0; 
        $qc = 0;
        $qv = 0;
        $mtc = 0;
        $kar = array();
        foreach ($arrMde as $i => $mde) {
            $item = $this->movimientos->selectRegistro($mde['mde_mov_id']);
            $item['mov_serie'] = '<a href="#" onclick="getViewMov('.$item['mov_id'].')">'.$item['mov_serie'].'-'.str_pad($item['mov_numero'],8,0,STR_PAD_LEFT).'</a>' ;
            $item['mov_nro'] = $i+1;
            $c_mde = array('c_q'=>'','c_vu'=>'','c_importe'=>'');
            $v_mde = array('v_q'=>'','v_vu'=>'','v_importe'=>'');
            if ($mde['mde_tipo'] == 2) {
                $qc += $mde['mde_q'];
                $mtc += $mde['mde_importe'];
                $qs += $mde['mde_q'];
                $mts += $mde['mde_importe'];
                $c_mde = array('c_q'=>$mde['mde_q'],'c_vu'=>$mde['mde_vu'],'c_importe'=>$mde['mde_importe']);
            }
            if ($mde['mde_tipo'] == 1) {
                $qv += $mde['mde_q'];
                $qcv += $mde['mde_q'];
                $prom = ($qs==0)?0:$mts/$qs;
                $v_mde = array('v_q'=>$mde['mde_q'],'v_vu'=>$prom,'v_importe'=>$mde['mde_q']*$prom);
                $mtcv += $mde['mde_q']*$prom;
                $mtv += $mde['mde_importe'];
                $mts -= $mde['mde_q']*$prom;
                $qs -= $mde['mde_q'];
            }
            $prom = ($qs==0)?0:$mts/$qs;
            $s_mde = array('s_q'=>$qs,'s_vu'=>$prom,'s_importe'=>$mts);
            $item = array_merge_recursive($item,$c_mde,$v_mde,$s_mde);
            array_push($kar,$item);
        }
        switch ($tipo) {
            case 0:
                $text='';
                $bat = $this->batributos->selectRegistros(array("bat_bie_id"=>$bie_id),array('bat_bie_id','bat_pro_id'));
                foreach ($bat as $i => $d) {
                    $text .= '{'.$d['bat_val_id']['val_pro_id']['pro_nombre'].':'.$d['bat_val_id']['val_valor'].'}, ';
                }
                $sbi = array('sbi_periodo'=>$f_inicio,
                'sbi_id'=>$bie_id,
                'sbi_alm_id'=>$_SESSION['alm']['alm_id'],
                'sbi_bie_id'=>$bie_id,
                'sbi_bat'=>$text,
                'sbi_qc'=>$qc,
                'sbi_mtc'=>$mtc,
                'sbi_qv'=>$qv,
                'sbi_mtcv'=>$mtcv,
                'sbi_qs'=>$qs,
                'sbi_p'=>($qs!=0) ? $mts/$qs : 0,
                'sbi_mts'=>$mts);
                return $sbi;
                break;
            case 1:
                return $kar;
                break;
            case 2:
                $cve = array(
                'cve_bie_id'=>$bie_id,
                'cve_qcv'=>$qcv,
                'cve_p'=>($qcv!=0) ? $mtcv/$qcv : 0,
                'cve_mtcv'=>$mtcv,
                'cve_mtv'=>$mtv,
                'cve_margen'=>$mtv-$mtcv);
                return $cve;
                break;
            default:
                return false;
                break;
        }
    }
    public function getHistorico($par,$out = false){ 
        $par = explode(",",$par);
        if (empty($par[0])) {
            $arrBie = $this->bienes->selectRegistros(null,array('bie_bbi_id'));
            $arrbi=array();
            foreach ($arrBie as $i => $bie) {
                $res = $this->getCostoBien($bie['bie_id'],$_SESSION['periodo'],null,0);
                $res['sbi_nro']= $i+1;
                $res['sbi_bie_id']= $bie;
                $btnHis = '<button class="btn btn-warning btn-sm" onClick="openModalHis('.$bie['bie_id'].')" title="Registros"><i class="far fa-eye"></i></button>';
                $res['sbi_options'] = '<div class="text-center">'.$btnHis.'</div>';
                array_push($arrbi,$res);
            }
            if ($out) {
                return $arrbi;
            } else {
                echo json_encode($arrbi,JSON_UNESCAPED_UNICODE);
            }
        }else{
            $bie = $this->getCostoBien(intval($par[0]),$_SESSION['periodo'],null,1);
            if ($out) {
                return $bie;
            } else {
                echo json_encode($bie,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function ventas(){
        $bie = $this->bienes->selectRegistros(null,array('bie_bbi_id'));
        for ($i=0; $i < count($bie) ; $i++) { 
            $mde = $this->mdetalles->selectRegistros(array('mde_bie_id'=>$bie[0]['bie_id'],'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
            array('mde_bie_id','mov_age_id','mov_alm_id','mov_tce_id'));
            for ($j=0; $j < count($mde) ; $j++) { 
                if ($mde[$j]['mde_mov_id']['mov_tipo']==1) {
                    dep($mde[$j]);
                    die();
                }
            }
        }
        
    }
    public function getCventas($res=false,$sum=false){
        $arrBie = $this->bienes->selectRegistros(null,array('bie_bbi_id'));
        $arr=array();
        $mar = 0;
        foreach ($arrBie as $i => $bie) {
            $cve = $this->getCostoBien(intval($bie['bie_id']),$_SESSION['periodo'],null,2);
            $mar += $cve['cve_margen'];
            $cve['cve_bie_id'] = $bie;
            $btnDet = '<button class="btn btn-warning btn-sm" onClick="openModalHis('.$bie['bie_id'].')" title="Registros"><i class="far fa-eye"></i></button>';
            $cve['cve_options'] = '<div class="text-center">'.$btnDet.'</div>';
            if ($cve['cve_qcv']>0) {
                array_push($arr,$cve);
            }
        }
        if ($res) {
            return ($sum) ? $mar : $arr;
        } else {
            echo json_encode($arr,JSON_UNESCAPED_UNICODE);
        }
        die();
    }
    public function resumenPDF(){
        $dompdf = new Dompdf\Dompdf();
        ob_end_clean();
        $data['res_table'] = file_get_contents($_FILES['res_table']['tmp_name']);
        $data['cue_table'] = file_get_contents($_FILES['cue_table']['tmp_name']);
        $data['sbi_table'] = file_get_contents($_FILES['sbi_table']['tmp_name']);
        $data['liq_cobrar'] = file_get_contents($_FILES['liq_cobrar']['tmp_name']);
        $data['liq_pagar'] = file_get_contents($_FILES['liq_pagar']['tmp_name']);
        $html = getFile("Liquidez/gerencial",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4','landscape');
        $dompdf->render();
        file_put_contents('Assets/pdf/file.pdf', $dompdf->output());
        echo json_encode(array('name'=>'file.pdf'),JSON_UNESCAPED_UNICODE);
        die();
    }
    public function Pdf(){
        $dompdf = new Dompdf\Dompdf();
        ob_end_clean();
        $data['res_table'] = file_get_contents($_FILES['res_table']['tmp_name']);
        $data['cue_table'] = file_get_contents($_FILES['cue_table']['tmp_name']);
        $data['sbi_table'] = file_get_contents($_FILES['sbi_table']['tmp_name']);
        $data['liq_cobrar'] = file_get_contents($_FILES['liq_cobrar']['tmp_name']);
        $data['liq_pagar'] = file_get_contents($_FILES['liq_pagar']['tmp_name']);
        $html = getFile("Liquidez/gerencial",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4');
        $dompdf->render();
        file_put_contents('Assets/pdf/file.pdf', $dompdf->output());
        echo json_encode(array('name'=>'file.pdf'),JSON_UNESCAPED_UNICODE);
        die();
    }
    public function cierre(){
        $bie = $this->bienes->selectRegistros();
        $si = array();
        $r = array('status' => false,'msg' => "No procesado");
        $si['mov_alm_id'] = 1;
        $si['mov_serie'] = 'SI01';
        $si['mov_numero'] = 1;
        $si['mov_t12num'] = 1;
        $si['mov_gt4_id'] = 1;
        $si['mov_t12_id'] = 16;
        $si['mov_t10_id'] = 1;
        $si['mov_tce_id'] = 1;
        $si['mov_fechaE'] = '2023-01-01';
        $si['mov_fechaR'] = '2023-01-01';
        $si['mov_fechaV'] = '2023-01-01';
        $si['mov_tipo'] = 2;
        $si['mov_subtotal'] = 1;
        $si['mov_igv_id'] = '{"mov_igv": "0.00", "mov_neto": "1.00", "mov_gravada": "0.00", "mov_inafecta": "0.00", "mov_exonerada": "1.00"}';
        $si['mov_total'] = 1;
        $s = $this->movimientos->insertRegistro($si,array('mov_fechaE'));
        foreach ($bie as $i => $d) {
            $m = array();
            $r = $this->getCostoBien($d['bie_id'],$_SESSION['periodo'],null,0);
            $m['mde_bie_id'] = $d['bie_id'];
            $m['mde_t6m_id'] = 23;
            $m['mde_gta_id'] = 9;
            $m['mde_mov_id'] = $s['mov_id'];
            $m['mde_q'] = floatval($r['sbi_qs']);
            $m['mde_vu'] = floatval($r['sbi_p']);
            $m['mde_igv'] = 0;
            $m['mde_importe'] = floatval($r['sbi_mts']);
            $m['mde_detraccion'] = 0;
            if(floatval($r['sbi_qs'])>0){
                $f = $this->mdetalles->insertRegistro($m);
                $r = array('status' => true,'msg' => "Procesado Correctamente");
            }
        }
        echo json_encode($r,JSON_UNESCAPED_UNICODE);
        die();
    }
}
?>