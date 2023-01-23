<?php 

@ob_start();
require_once 'Libraries/phpspreadsheet/vendor/autoload.php';
class Liquidez extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));
        $this->newModel('agentes');
        $this->newModel('t2identidades');
        $this->newModel('movimientos');
        $this->newModel('cajas');
        $this->newController('Reportes');
    }
    public function Liquidez(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Liquidez";
        $data['page_title'] = "Liquidez";
        $data['page_name'] = "Liquidez";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo'],'t'=>$_GET['t']);
        $data['page_functions_js'] = array("functions_liquidez.js","functions_agentes.js","functions_empresas.js","functions_personas.js","functions_movimientos.js","functions_cajas.js");
        $this->views->getView($this,"liquidez",$data);
    }
    public function Castigos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Notas de Credito";
        $data['page_title'] = "Notas de Credito";
        $data['page_name'] = "Notas de Credito";

        $num = $this->cajas->searchRegistro(array('caj_tipo'=>5),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('caj'=>array('caj_tipo'=>6,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 

        $data['page_functions_js'] = array("functions_cajas.js","functions_agentes.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function Premios(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Notas de Debito";
        $data['page_title'] = "Notas de Debito";
        $data['page_name'] = "Notas de Debito";

        $num = $this->cajas->searchRegistro(array('caj_tipo'=>5),' MAX(caj_numero) AS num ')['num']+1;
        $data['page_data'] = array('caj'=>array('caj_tipo'=>7,'caj_numero'=>$num,'caj_gus_id'=>$_SESSION['gus']['gus_id']),
        'periodo'=>$_SESSION['periodo']); 

        $data['page_functions_js'] = array("functions_cajas.js","functions_agentes.js");
        $this->views->getView($this,"cajas",$data);
    }
    public function getLiquidez($res=null){
        $ageData = $this->agentes->selectRegistros();
        $pre = 'liq'; $tabla = 'Liquidez';
        $liqData = array();
        $liqCobrar = array();
        $liqPagar = array();
        $liq_ncuadre = array();
        $liq_sum = array('liq_cobrar'=>0,'liq_pagar'=>0);
        for ($i=0; $i < count($ageData); $i++) { 
                $btnView = '';
                $btnEdit = '';
                $age = array();
                if ($_SESSION['gus']['gus_id']==6) {
                    if ($ageData[$i]['age_id']!= 143 ) {
                        continue;
                    }
                }
                if (!empty($ageData[$i]['age_gem_id'])) {
                    $age['age_id'] = $ageData[$i]['age_id'];
                    $age['age_ide'] =         $ageData[$i]['age_gem_id']['gem_ruc'];
                    $age['age_nombre'] =      $ageData[$i]['age_gem_id']['gem_razonsocial'];
                    $age['age_direccion'] =   $ageData[$i]['age_gem_id']['gem_direccion'];
                    $age['age_email'] =       $ageData[$i]['age_gem_id']['gem_email'];
                    $age['age_gdi_id'] =      $ageData[$i]['age_gem_id']['gem_gdi_id'];
                    $age['age_gt2_id'] =      $this->t2identidades->selectRegistro(4);
                } else {
                    $age['age_id'] = $ageData[$i]['age_id'];
                    $age['age_ide'] =         $ageData[$i]['age_gpe_id']['gpe_identificacion'];
                    $age['age_nombre'] =      $ageData[$i]['age_gpe_id']['gpe_nombre'].', '.$ageData[$i]['age_gpe_id']['gpe_apellidos'];
                    $age['age_direccion'] =   $ageData[$i]['age_gpe_id']['gpe_direccion'];
                    $age['age_email'] =       $ageData[$i]['age_gpe_id']['gpe_email'];
                    $age['age_gdi_id'] =      $ageData[$i]['age_gpe_id']['gpe_gdi_id'];
                    $age['age_gt2_id'] =      $ageData[$i]['age_gpe_id']['gpe_gt2_id'];
                }
                $id = $this->liquidez->searchRegistro(array('liq_age_id'=>$ageData[$i]['age_id'],'custom'=>'DATE_FORMAT(liq_fecha, "%Y-%m") = '.$_SESSION['periodo']));
                $id = (!empty($id)) ? $id['liq_id'] : 0 ;
                $liqData[$i][$pre.'_nro'] = $i+1;
                $liqData[$i][$pre.'_age_id']=$age;
                $liqData[$i][$pre.'_si']=$this->liquidez->searchRegistro(
                    array('liq_age_id'=>$ageData[$i]['age_id'],'custom'=>'DATE_FORMAT(liq_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'liq_age_id,IFNULL(SUM(liq_monto), 0) AS liq_total_sum',
                    array('liq_age_id'))['liq_total_sum'];
    
                $liqData[$i][$pre.'_mtc']=$this->movimientos->searchRegistro(
                    array('mov_age_id'=>$ageData[$i]['age_id'],'mov_mstatus'=>1,'mov_tipo'=>2,'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']),
                    'mov_age_id,IFNULL(SUM(mov_total), 0) AS mov_total_sum',
                    array('mov_age_id'))['mov_total_sum'];
    
                $detr =  $this->movimientos->selectRegistros(
                    array('mov_age_id'=>$ageData[$i]['age_id'],'mov_mstatus'=>1,'mov_tipo'=>1,'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']),
                    array('mov_age_id','mov_alm_id','mov_tce_id'));
    
                $liqData[$i][$pre.'_mtv'] = 0;
                if ($liqData[$i][$pre.'_age_id']['age_id'] == 2) {
                    $rpt = $this->getDetracciones(true);
                    $liqData[$i][$pre.'_mtv'] = array_sum(array_column($rpt,'mov_dscg'));
                } else {
                    for ($j=0; $j < count($detr) ; $j++) { 
                        $liqData[$i][$pre.'_mtv'] = $liqData[$i][$pre.'_mtv']+floatval(json_decode($detr[$j]['mov_igv_id'],true)['mov_neto']);
                    }
                }
                $liqData[$i][$pre.'_mti']=$this->cajas->searchRegistro(
                    array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>1,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                    array('caj_age_id'))['caj_total_sum'];
    
                $liqData[$i][$pre.'_mte']=-$this->cajas->searchRegistro(
                    array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>2,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                    array('caj_age_id'))['caj_total_sum'];
    
                $liqData[$i][$pre.'_castigo']=$this->cajas->searchRegistro(
                        array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>6,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                        'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                        array('caj_age_id'))['caj_total_sum'];
        
                $liqData[$i][$pre.'_premio']=$this->cajas->searchRegistro(
                        array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>7,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                        'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                        array('caj_age_id'))['caj_total_sum'];
                $liqData[$i][$pre.'_actual']=$liqData[$i][$pre.'_si']-$liqData[$i][$pre.'_mtc']+$liqData[$i][$pre.'_mtv']-$liqData[$i][$pre.'_mti']+$liqData[$i][$pre.'_mte']+$liqData[$i][$pre.'_castigo']+$liqData[$i][$pre.'_premio'];
                $text = '';
                switch (true) {
                    case $liqData[$i][$pre.'_actual']<-0.5:
                        $text = '<span class="badge badge-danger">POR PAGAR</span>';
                        break;
                    case $liqData[$i][$pre.'_actual']>0.5:
                        $text = '<span class="badge badge-warning">POR COBRAR</span>';
                        break;
                    default:
                        $text = '<span class="badge badge-success">CUADRE</span>';
                        break;
                }
                $liqData[$i][$pre.'_estado']= $text;
                if($_SESSION['perMod']['gtp_u']){
                    if ($id>0) {
                        $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="editLiq('.$id.')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
                    }    
                }
                $btnDet = '<button class="btn btn-warning  btn-sm" onClick="viewLiq('.$ageData[$i]['age_id'].','.$liqData[$i][$pre.'_actual'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>'; 
                $liqData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDet.'</div>';
                switch (true) {
                    case $liqData[$i][$pre.'_actual']<-0.5:
                        array_push($liq_ncuadre,$liqData[$i]);
                        array_push($liqPagar,$liqData[$i]);
                        $liq_sum['liq_pagar'] += abs($liqData[$i][$pre.'_actual']);
                        break;
                    case $liqData[$i][$pre.'_actual']>0.5:
                        array_push($liq_ncuadre,$liqData[$i]);
                        array_push($liqCobrar,$liqData[$i]);
                        $liq_sum['liq_cobrar'] += abs($liqData[$i][$pre.'_actual']);
                        break;
                    default:
                        break;
                }
        }
        switch ($res) {
            case 'cobrar':
                echo json_encode($liqCobrar,JSON_UNESCAPED_UNICODE);
                break;
            case 'pagar':
                echo json_encode($liqPagar,JSON_UNESCAPED_UNICODE);
                break;
            case 'retornar':
                return $liq_sum;
                break;
            case 'ncuadre':
                echo json_encode($liq_ncuadre,JSON_UNESCAPED_UNICODE);
                break;
            case 'todo':
                return $liqData;
                break;
            default:
                echo json_encode($liqData,JSON_UNESCAPED_UNICODE);
                break;
        }
        die();
    }
    public function getIng($age_id,$res=false){
        $str_caj = '';
        $str_mov = '';
        $str_liq = '';
        if (!empty($_GET['f_start'])&&!empty($_GET['f_end'])) {
            $str_mov = 'mov_fechaE BETWEEN "'.$_GET['f_start'].'" AND "'.$_GET['f_end'].'"';
            $str_caj = 'caj_fecha  BETWEEN "'.$_GET['f_start'].'" AND "'.$_GET['f_end'].'"';
            $str_liq = 'liq_fecha  BETWEEN "'.$_GET['f_start'].'" AND "'.$_GET['f_end'].'"';
        } else {
            $str_mov = 'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo'];
            $str_caj = 'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'];
            $str_liq = 'DATE_FORMAT(liq_fecha, "%Y-%m") = '.$_SESSION['periodo'];
        }
        $arrMov = $this->movimientos->selectRegistros(array('mov_mstatus'=>1,'mov_tipo'=>2,'mov_age_id'=>$age_id,'custom'=>$str_mov));
        $arrCaj = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>1,'custom'=>$str_caj));
        $nd = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>6,'custom'=>$str_caj));
        $sl = $this->liquidez->searchRegistro(array('liq_age_id'=>$age_id,'custom'=>$str_liq));
        $ing = array();
        if (!empty($sl)) {
            if ($sl['liq_monto']<=0) {
                $r = array();
                $r['ing_fecha'] = $sl['liq_fecha'];
                $r['ing_tipo'] = 'SALDO INICIAL'; 
                $r['ing_cuenta'] = ''; 
                $r['ing_descripcion'] = 'POR PAGAR'; 
                $r['ing_monto'] = abs($sl['liq_monto']);
                array_push($ing,$r);
            }
        }
        for ($i=0; $i < count($arrMov); $i++) {
            $r = array();
            $r['ing_fecha'] = $arrMov[$i]['mov_fechaE'];
            $r['ing_tipo'] = $arrMov[$i]['mov_t12_id']['t12_descripcion'];
            $r['ing_cuenta'] = (!empty($arrMov[$i]['mov_cue_id']))?$arrMov[$i]['mov_cue_id']['cue_nombre']:''; 
            $r['ing_descripcion'] = '<a href="#" onclick="getViewMov('.$arrMov[$i]['mov_id'].')">'.$arrMov[$i]['mov_serie'].'-'.str_pad($arrMov[$i]['mov_numero'],8,0,STR_PAD_LEFT).'</a>' ; 
            $r['ing_monto'] = $arrMov[$i]['mov_total'];
            array_push($ing,$r);
        }
        for ($i=0; $i < count($arrCaj); $i++) {
            $r = array();
            $r['ing_fecha'] = $arrCaj[$i]['caj_fecha'];
            $r['ing_tipo'] = CAJ[$arrCaj[$i]['caj_tipo']];
            $r['ing_cuenta'] = $arrCaj[$i]['caj_cue_id']['cue_nombre'];
            $r['ing_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj[$i]['caj_id'].','.$arrCaj[$i]['caj_tipo'].')">'.$arrCaj[$i]['caj_observaciones'].'</a>' ; 
            $r['ing_monto'] = abs($arrCaj[$i]['caj_monto']);
            array_push($ing,$r);
        }
        for ($i=0; $i < count($nd); $i++) {
            $r = array();
            $r['ing_fecha'] = $nd[$i]['caj_fecha'];
            $r['ing_tipo'] = CAJ[$nd[$i]['caj_tipo']];
            $r['ing_cuenta'] = (!empty($nd[$i]['caj_cue_id']))?$nd[$i]['caj_cue_id']['cue_nombre']:'';
            $r['ing_descripcion'] = '<a href="#" onclick="viewCaj('.$nd[$i]['caj_id'].','.$nd[$i]['caj_tipo'].')">'.$nd[$i]['caj_observaciones'].'</a>' ; 
            $r['ing_monto'] = abs($nd[$i]['caj_monto']);
            array_push($ing,$r);
        }
        usort($ing, function($a, $b) {
            return $a['ing_fecha'] <=> $b['ing_fecha'];
        });
        if ($res) {
            return $ing;
        } else {
            echo json_encode($ing,JSON_UNESCAPED_UNICODE);
        }
        die();
    }
    public function getEgr($age_id,$res=false){
        $str_caj = '';
        $str_mov = '';
        $str_liq = '';
        if (!empty($_GET['f_start'])&&!empty($_GET['f_end'])) {
            $str_mov = 'mov_fechaE BETWEEN "'.$_GET['f_start'].'" AND "'.$_GET['f_end'].'"';
            $str_caj = 'caj_fecha  BETWEEN "'.$_GET['f_start'].'" AND "'.$_GET['f_end'].'"';
            $str_liq = 'liq_fecha  BETWEEN "'.$_GET['f_start'].'" AND "'.$_GET['f_end'].'"';
        } else {
            $str_mov = 'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo'];
            $str_caj = 'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'];
            $str_liq = 'DATE_FORMAT(liq_fecha, "%Y-%m") = '.$_SESSION['periodo'];
        }
        $arrMov = $this->movimientos->selectRegistros(array('mov_mstatus'=>1,'mov_tipo'=>1,'mov_age_id'=>$age_id,'custom'=>$str_mov));
        $arrCaj = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>2,'custom'=>$str_caj));
        $nc = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>7,'custom'=>$str_caj));
        $sl = $this->liquidez->searchRegistro(array('liq_age_id'=>$age_id,'custom'=>$str_liq));
        $egr = array();
        if (!empty($sl)) {
            if ($sl['liq_monto']>0) {
                $r = array();
                $r['egr_fecha'] = $sl['liq_fecha'];
                $r['egr_tipo'] = 'SALDO INICIAL' ; 
                $r['egr_cuenta'] = ''; 
                $r['egr_descripcion'] = 'POR COBRAR' ; 
                $r['egr_monto'] = abs($sl['liq_monto']);
                array_push($egr,$r);
            }
        }
        for ($i=0; $i < count($arrMov); $i++) {
            $r = array();
            $r['egr_fecha'] = $arrMov[$i]['mov_fechaE'];
            $r['egr_tipo'] = $arrMov[$i]['mov_t12_id']['t12_descripcion'];
            $r['egr_cuenta'] = (!empty($arrMov[$i]['mov_cue_id']))?$arrMov[$i]['mov_cue_id']['cue_nombre']:''; 
            $r['egr_descripcion'] = '<a href="#" onclick="getViewMov('.$arrMov[$i]['mov_id'].')">'.$arrMov[$i]['mov_serie'].'-'.str_pad($arrMov[$i]['mov_numero'],8,0,STR_PAD_LEFT).'</a>' ; 
            $r['egr_monto'] =  floatval(json_decode($arrMov[$i]['mov_igv_id'],true)['mov_neto']);
            array_push($egr,$r);
        }
        for ($i=0; $i < count($arrCaj); $i++) {
            $r = array();
            $r['egr_fecha'] = $arrCaj[$i]['caj_fecha'];
            $r['egr_tipo'] = CAJ[$arrCaj[$i]['caj_tipo']];
            $r['egr_cuenta'] = $arrCaj[$i]['caj_cue_id']['cue_nombre'];
            $r['egr_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj[$i]['caj_id'].','.$arrCaj[$i]['caj_tipo'].')">'.$arrCaj[$i]['caj_observaciones'].'</a>' ; 
            $r['egr_monto'] = abs($arrCaj[$i]['caj_monto']);
            array_push($egr,$r);
        }
        for ($i=0; $i < count($nc); $i++) {
            $r = array();
            $r['egr_fecha'] = $nc[$i]['caj_fecha'];
            $r['egr_tipo'] = CAJ[$nc[$i]['caj_tipo']];
            $r['egr_cuenta'] = (!empty($nc[$i]['caj_cue_id']))?$nc[$i]['caj_cue_id']['cue_nombre']:'';
            $r['egr_descripcion'] = '<a href="#" onclick="viewCaj('.$nc[$i]['caj_id'].','.$nc[$i]['caj_tipo'].')">'.$nc[$i]['caj_observaciones'].'</a>' ; 
            $r['egr_monto'] = abs($nc[$i]['caj_monto']);
            array_push($egr,$r);
        }
        usort($egr, function($a, $b) {
            return $a['egr_fecha'] <=> $b['egr_fecha'];
        });
        if ($res) {
            return $egr;
        } else {
            echo json_encode($egr,JSON_UNESCAPED_UNICODE);
        }
        die();
    }
    public function cierre(){
        $sal = $this->getLiquidez('todo');
        $r = array('status' => false,'msg' => "No procesado");
        for ($i=0; $i < count($sal); $i++) { 
            $liq = array();
            $liq['liq_age_id'] = $sal[$i]['liq_age_id']['age_id'];
            $liq['liq_monto'] = $sal[$i]['liq_actual'];
            $liq['liq_fecha'] = '2023-01-01';
            $d = $this->liquidez->insertRegistro($liq);
            $r = array('status' => true,'msg' => "Procesado Correctamente");
        }
        echo json_encode($r,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getPdf($age_id){
        ob_end_clean();
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $data['age'] = $this->agentes->selectRegistro($age_id);
        $data['liq_egr'] = $this->getEgr($age_id,true);
        $data['liq_ing'] = $this->getIng($age_id,true);
        $dompdf = new Dompdf\Dompdf();
        $options = new Dompdf\Options();
        $options->set(array('isRemoteEnabled'=>true));
        $dompdf->setOptions($options);
        $html = getFile("Liquidez/pdf",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('letter', 'landscape');
        $dompdf->render();
        $dompdf->stream('my.pdf',array('Attachment'=>0));
        die();
    }
    public function getXlsx($age_id){
        ob_end_clean();
        $age = $this->agentes->selectRegistro($age_id);
        $ing['data'] = $this->getIng($age_id,true);
        $ing['columns'] = array(array('data'=>'ing_fecha'),array('data'=>'ing_tipo'),array('data'=>'ing_cuenta'),array('data'=>'ing_descripcion'),array('data'=>'ing_monto'));
        $spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $egr['data'] = $this->getEgr($age_id,true);
        $egr['columns'] = array(array('data'=>'egr_fecha'),array('data'=>'egr_tipo'),array('data'=>'egr_cuenta'),array('data'=>'egr_descripcion'),array('data'=>'egr_monto'));
        $o = $ing;
        for ($j=1; $j < count($o['columns'])+1; $j++) { 
            $spreadsheet->getActiveSheet()->getColumnDimensionByColumn($j)->setAutoSize(true);
            $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow($j,1,$o['columns'][$j-1]['data']);
        }
        for ($i=2; $i < count($o['data'])+2 ; $i++) {
            $r = $o['data'][$i-2];
            for ($j=1; $j < count($o['columns'])+1; $j++) { 
                $ne = explode('.',$o['columns'][$j-1]['data']);
                $d = $r;
                for ($n = 0; $n < count($ne); $n++) {  
                    $d = $d[$ne[$n]];
                }
                $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow($j, $i, $d);
            }
        }
        $o = $egr;
        for ($j=7; $j < count($o['columns'])+7; $j++) { 
            $spreadsheet->getActiveSheet()->getColumnDimensionByColumn($j)->setAutoSize(true);
            $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow($j,1,$o['columns'][$j-7]['data']);
        }
        for ($i=2; $i < count($o['data'])+2 ; $i++) {
            $r = $o['data'][$i-2];
            for ($j=7; $j < count($o['columns'])+7; $j++) { 
                $ne = explode('.',$o['columns'][$j-7]['data']);
                $d = $r;
                for ($n = 0; $n < count($ne); $n++) {  
                    $d = $d[$ne[$n]];
                }
                $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow($j, $i, $d);
            }
        }
        $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="export.xlsx"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header('Cache-Control: cache, must-revalidate');
        header('Pragma: public');
        $writer->save('php://output');
        die();
    }
    public function getDetracciones($out=false){
        $res = $this->movimientos->selectCustoms('mov_cue_id,SUM(mov_subtotal) as mov_sum',array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_tipo'=>1,'custom'=>'mov_t10_id != 51 AND mov_cue_id IS NOT NULL AND   DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo'].'  GROUP BY mov_cue_id'));
        foreach ($res as $i => $d) {
            $res[$i]['mov_detraccion'] = $d['mov_sum']*0.177;
            $res[$i]['mov_impuesto'] = $d['mov_sum']*0.025; //($res[$i]['mov_cue_id']['cue_porcentaje']/100)
            $res[$i]['mov_det_liq'] = $res[$i]['mov_detraccion']-$res[$i]['mov_impuesto'];
            $res[$i]['mov_porc'] = '<input type="text" value="'.$res[$i]['mov_cue_id']['cue_porcentaje'].'" size="4" onChange="setPorcentaje('.$res[$i]['mov_cue_id']['cue_id'].',event)">'; 
            $res[$i]['mov_dscg'] = $res[$i]['mov_det_liq']*($res[$i]['mov_cue_id']['cue_porcentaje']/100);
            $res[$i]['mov_sald'] = $res[$i]['mov_det_liq']-$res[$i]['mov_dscg'];
            $btnView = '<button class="btn btn-info btn-sm" onclick="getDetView('.$d['mov_cue_id']['cue_id'].')" title="Ver Registro" > <i class="far fa-eye"></i> </button>';
            $res[$i]['mov_options'] = '<div class="text-center">'.$btnView.'</div>';
        }
        if ($out) {
            return $res;
        } else {
            echo json_encode($res,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function getExportaciones($out=false){
        $res = $this->movimientos->selectCustoms('mov_cue_id,SUM(mov_subtotal) as mov_sum',array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_tipo'=>1,'mov_t10_id'=>51,'custom'=>'mov_cue_id IS NOT NULL AND   DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo'].'  GROUP BY mov_cue_id'));
        foreach ($res as $i => $r) {
            $res[$i]['mov_porc'] = '<input type="text" value="'.$r['mov_cue_id']['cue_por_exp'].'" size="4" onChange="setPorExp('.$r['mov_cue_id']['cue_id'].',event)">'; 
            $res[$i]['mov_base'] = $r['mov_sum']*$r['mov_cue_id']['cue_por_exp'];
            $res[$i]['mov_cigv'] = $res[$i]['mov_base']*0.18;
            $res[$i]['mov_impuesto'] =  $res[$i]['mov_base']*0.025;
            $res[$i]['mov_retorno'] = $res[$i]['mov_cigv']-$res[$i]['mov_impuesto'];
            $btnView = '<button class="btn btn-info btn-sm" onclick="getExpDet('.$r['mov_cue_id']['cue_id'].')" title="Ver Registro" > <i class="far fa-eye"></i> </button>';
            $res[$i]['mov_options'] = '<div class="text-center">'.$btnView.'</div>';
        }  
        if ($out) {
            return $res;
        } else {
            echo json_encode($res,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
}

?>