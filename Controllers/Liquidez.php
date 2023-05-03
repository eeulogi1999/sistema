<?php 
@ob_start();
require_once 'Libraries/phpspreadsheet/vendor/autoload.php';
class Liquidez extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));
        $this->newModel('agentes');
        $this->newModel('t2identidades');
        $this->newModel('movimientos');
        $this->newModel('t4monedas');
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
        $ageData = $this->agentes->selectRegistros(null,array('gpe_gdi_id','gem_gdi_id'));
        $pre = 'liq'; $tabla = 'Liquidez';
        $this->newController('Main');
        $tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tcompra'];
        unset($this->Main);
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
                    $age['age_gt4_id'] =      $ageData[$i]['age_gt4_id'];
                } else {
                    $age['age_id'] = $ageData[$i]['age_id'];
                    $age['age_ide'] =         $ageData[$i]['age_gpe_id']['gpe_identificacion'];
                    $age['age_nombre'] =      $ageData[$i]['age_gpe_id']['gpe_nombre'].', '.$ageData[$i]['age_gpe_id']['gpe_apellidos'];
                    $age['age_direccion'] =   $ageData[$i]['age_gpe_id']['gpe_direccion'];
                    $age['age_email'] =       $ageData[$i]['age_gpe_id']['gpe_email'];
                    $age['age_gt4_id'] =       $ageData[$i]['age_gt4_id'];
                }
                $id = $this->liquidez->searchRegistro(array('liq_age_id'=>$ageData[$i]['age_id'],'custom'=>'DATE_FORMAT(liq_fecha, "%Y-%m") = '.$_SESSION['periodo']));
                $id = (!empty($id)) ? $id['liq_id'] : 0 ;
                $liqData[$i][$pre.'_nro'] = $i+1;
                $liqData[$i][$pre.'_age_id']=$age;
                $si =$this->liquidez->searchRegistro(
                    array('liq_age_id'=>$ageData[$i]['age_id'],'custom'=>'DATE_FORMAT(liq_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'liq_age_id,IFNULL(SUM(liq_monto), 0) AS liq_total_sum',
                    array('liq_age_id'))['liq_total_sum'];
                $liqData[$i][$pre.'_si']= ($ageData[$i]['age_gt4_id']['gt4_id']==2)?$si*floatval($tga):$si;
                $liqData[$i][$pre.'_sin'] = $si;
                $mtc=$this->movimientos->searchRegistro(
                    array('mov_age_id'=>$ageData[$i]['age_id'],'mov_mstatus'=>1,'mov_tipo'=>2,'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']),
                    'mov_age_id,IFNULL(SUM(mov_total), 0) AS mov_total_sum',
                    array('mov_age_id'))['mov_total_sum'];
                $liqData[$i][$pre.'_mtc']=($ageData[$i]['age_gt4_id']['gt4_id']==2)?$mtc*floatval($tga):$mtc;
                $liqData[$i][$pre.'_mtcn'] = $mtc;
    
                $mtv =  $this->movimientos->searchRegistro(
                    array('mov_age_id'=>$ageData[$i]['age_id'],'mov_mstatus'=>1,'mov_tipo'=>1,'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']),
                    'mov_age_id,IFNULL(SUM(CAST(JSON_EXTRACT(mov_igv_id, "$.mov_neto")  AS DECIMAL(12,3))), 0) AS mov_total_sum')['mov_total_sum'];

                $liqData[$i][$pre.'_mtv']=($ageData[$i]['age_gt4_id']['gt4_id']==2)?$mtv*floatval($tga):$mtv;
                $liqData[$i][$pre.'_mtvn'] = $mtv; 

                if ($liqData[$i][$pre.'_age_id']['age_id'] == 2 || $liqData[$i][$pre.'_age_id']['age_id'] == 5) {
                    $liqData[$i][$pre.'_age_id']['age_nombre'] = '<span class="badge badge-success">'.$liqData[$i][$pre.'_age_id']['age_nombre'].'</span>';
                    if ($liqData[$i][$pre.'_age_id']['age_id'] == 2) {
                        $rpt1 = $this->getDetracciones(true);
                        $liqData[$i][$pre.'_mtv'] = array_sum(array_column($rpt1,'mov_dscg'));
                        $liqData[$i][$pre.'_mtvn'] = array_sum(array_column($rpt1,'mov_dscg'));
                    }
                    if ($liqData[$i][$pre.'_age_id']['age_id'] == 5) {
                        $rpt2 = $this->getExportaciones(true);
                        $liqData[$i][$pre.'_mtv'] = array_sum(array_column($rpt2,'mov_dscg'));
                    }

                }
                $mti=$this->cajas->searchRegistro(
                    array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>1,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                    array('caj_age_id'))['caj_total_sum'];
                $liqData[$i][$pre.'_mti']=($ageData[$i]['age_gt4_id']['gt4_id']==2)?$mti*floatval($tga):$mti;
                $liqData[$i][$pre.'_mtin'] = $mti;

                $mte=-$this->cajas->searchRegistro(
                    array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>2,'caj_gt4_id'=>1,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                    array('caj_age_id'))['caj_total_sum'];
                $mte_d=-$this->cajas->searchRegistro(
                    array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>2,'caj_gt4_id'=>2,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                    'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                    array('caj_age_id'))['caj_total_sum'];

                
                $liqData[$i][$pre.'_mte']=($ageData[$i]['age_gt4_id']['gt4_id']==2)?$mte_d*floatval($tga)+$mte:$mte;
                $liqData[$i][$pre.'_mten'] = ($ageData[$i]['age_gt4_id']['gt4_id']==2)?$mte_d+$mte/floatval($tga):$mte;
    
                $castigo=$this->cajas->searchRegistro(
                        array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>6,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                        'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                        array('caj_age_id'))['caj_total_sum'];
                $liqData[$i][$pre.'_castigo']=($ageData[$i]['age_gt4_id']['gt4_id']==2)?$castigo*floatval($tga):$castigo;
                $liqData[$i][$pre.'_castigon'] = $castigo;
        
                $premio=$this->cajas->searchRegistro(
                        array('caj_age_id'=>$ageData[$i]['age_id'],'caj_tipo'=>7,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),
                        'caj_age_id,IFNULL(SUM(caj_monto), 0) AS caj_total_sum',
                        array('caj_age_id'))['caj_total_sum'];
                $liqData[$i][$pre.'_premio']=($ageData[$i]['age_gt4_id']['gt4_id']==2)?$premio*floatval($tga):$premio;
                $liqData[$i][$pre.'_premion'] = $premio;

                $liqData[$i][$pre.'_actual']=$liqData[$i][$pre.'_si']-$liqData[$i][$pre.'_mtc']+$liqData[$i][$pre.'_mtv']-$liqData[$i][$pre.'_mti']+$liqData[$i][$pre.'_mte']+$liqData[$i][$pre.'_castigo']+$liqData[$i][$pre.'_premio'];
                $liqData[$i][$pre.'_actualn']=$liqData[$i][$pre.'_sin']-$liqData[$i][$pre.'_mtcn']+$liqData[$i][$pre.'_mtvn']-$liqData[$i][$pre.'_mtin']+$liqData[$i][$pre.'_mten']+$liqData[$i][$pre.'_castigon']+$liqData[$i][$pre.'_premion'];
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
                $btnDet = '<button class="btn btn-warning  btn-sm" onClick="viewLiq('.$ageData[$i]['age_id'].','.$liqData[$i][$pre.'_actual'].','.$liqData[$i][$pre.'_actualn'].','.floatval($tga).')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>'; 
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
        $age = $this->agentes->selectRegistro($age_id);
        $ing = array();
        if (!empty($sl)) {
            if ($sl['liq_monto']<=0) {
                $r = array();
                $r['ing_gt4_id'] = $age['age_gt4_id'];
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
            $r['ing_gt4_id'] = $arrMov[$i]['mov_gt4_id'];
            $r['ing_fecha'] = $arrMov[$i]['mov_fechaE'];
            $r['ing_tipo'] = $arrMov[$i]['mov_t12_id']['t12_descripcion'];
            $r['ing_cuenta'] = (!empty($arrMov[$i]['mov_cue_id']))?$arrMov[$i]['mov_cue_id']['cue_nombre']:''; 
            $r['ing_descripcion'] = '<a href="#" onclick="getViewMov('.$arrMov[$i]['mov_id'].')">'.$arrMov[$i]['mov_serie'].'-'.str_pad($arrMov[$i]['mov_numero'],8,0,STR_PAD_LEFT).'</a>' ; 
            $r['ing_monto'] = $arrMov[$i]['mov_total'];
            array_push($ing,$r);
        }
        for ($i=0; $i < count($arrCaj); $i++) {
            $r = array();
            $r['ing_gt4_id'] = $arrCaj[$i]['caj_gt4_id'];
            $r['ing_fecha'] = $arrCaj[$i]['caj_fecha'];
            $r['ing_tipo'] = CAJ[$arrCaj[$i]['caj_tipo']];
            $r['ing_cuenta'] = $arrCaj[$i]['caj_cue_id']['cue_nombre'];
            $r['ing_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj[$i]['caj_id'].','.$arrCaj[$i]['caj_tipo'].')">'.$arrCaj[$i]['caj_observaciones'].'</a>' ; 
            $r['ing_monto'] = abs($arrCaj[$i]['caj_monto']);
            array_push($ing,$r);
        }
        for ($i=0; $i < count($nd); $i++) {
            $r = array();
            $r['ing_gt4_id'] = $nd[$i]['caj_gt4_id'];
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
        $this->newController('Main');
        $tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tcompra'];
        unset($this->Main);
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
        $arrCaj = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>2,'caj_gt4_id'=>1,'custom'=>$str_caj));
        $arrCaj_d = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>2,'caj_gt4_id'=>2,'custom'=>$str_caj));
        $nc = $this->cajas->selectRegistros(array('caj_age_id'=>$age_id,'caj_tipo'=>7,'custom'=>$str_caj));
        $sl = $this->liquidez->searchRegistro(array('liq_age_id'=>$age_id,'custom'=>$str_liq));
        $age = $this->agentes->selectRegistro($age_id);
        $egr = array();
        if (!empty($sl)) {
            if ($sl['liq_monto']>0) {
                $r = array();
                $r['egr_gt4_id'] = $age['age_gt4_id'];
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
            $r['egr_gt4_id'] = $arrMov[$i]['mov_gt4_id'];
            $r['egr_fecha'] = $arrMov[$i]['mov_fechaE'];
            $r['egr_tipo'] = $arrMov[$i]['mov_t12_id']['t12_descripcion'];
            $r['egr_cuenta'] = (!empty($arrMov[$i]['mov_cue_id']))?$arrMov[$i]['mov_cue_id']['cue_nombre']:''; 
            $r['egr_descripcion'] = '<a href="#" onclick="getViewMov('.$arrMov[$i]['mov_id'].')">'.$arrMov[$i]['mov_serie'].'-'.str_pad($arrMov[$i]['mov_numero'],8,0,STR_PAD_LEFT).'</a>' ; 
            $r['egr_monto'] =  floatval(json_decode($arrMov[$i]['mov_igv_id'],true)['mov_neto']);
            array_push($egr,$r);
        }

        if ($age['age_gt4_id']['gt4_id']==2) {
            $usd = $this->t4monedas->selectRegistro(2);
            for ($i=0; $i < count($arrCaj); $i++) {
                $r = array();
                $r['egr_gt4_id'] = $usd;
                $r['egr_fecha'] = $arrCaj[$i]['caj_fecha'];
                $r['egr_tipo'] = CAJ[$arrCaj[$i]['caj_tipo']];
                $r['egr_cuenta'] = $arrCaj[$i]['caj_cue_id']['cue_nombre'];
                $r['egr_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj[$i]['caj_id'].','.$arrCaj[$i]['caj_tipo'].')">'.$arrCaj[$i]['caj_observaciones'].'</a>' ; 
                $r['egr_monto'] = abs($arrCaj[$i]['caj_monto'])/floatval($tga);
                array_push($egr,$r);
            }
            for ($i=0; $i < count($arrCaj_d); $i++) {
                $r = array();
                $r['egr_gt4_id'] = $arrCaj_d[$i]['caj_gt4_id'];
                $r['egr_fecha'] = $arrCaj_d[$i]['caj_fecha'];
                $r['egr_tipo'] = CAJ[$arrCaj_d[$i]['caj_tipo']];
                $r['egr_cuenta'] = $arrCaj_d[$i]['caj_cue_id']['cue_nombre'];
                $r['egr_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj_d[$i]['caj_id'].','.$arrCaj_d[$i]['caj_tipo'].')">'.$arrCaj_d[$i]['caj_observaciones'].'</a>' ; 
                $r['egr_monto'] = abs($arrCaj_d[$i]['caj_monto']);
                array_push($egr,$r);
            }
        } 
        if ($age['age_gt4_id']['gt4_id']==1) {
            for ($i=0; $i < count($arrCaj); $i++) {
                $r = array();
                $r['egr_gt4_id'] = $arrCaj[$i]['caj_gt4_id'];
                $r['egr_fecha'] = $arrCaj[$i]['caj_fecha'];
                $r['egr_tipo'] = CAJ[$arrCaj[$i]['caj_tipo']];
                $r['egr_cuenta'] = $arrCaj[$i]['caj_cue_id']['cue_nombre'];
                $r['egr_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj[$i]['caj_id'].','.$arrCaj[$i]['caj_tipo'].')">'.$arrCaj[$i]['caj_observaciones'].'</a>' ; 
                $r['egr_monto'] = abs($arrCaj[$i]['caj_monto']);
                array_push($egr,$r);
            }
            for ($i=0; $i < count($arrCaj_d); $i++) {
                $r = array();
                $r['egr_gt4_id'] = $arrCaj_d[$i]['caj_gt4_id'];
                $r['egr_fecha'] = $arrCaj_d[$i]['caj_fecha'];
                $r['egr_tipo'] = CAJ[$arrCaj_d[$i]['caj_tipo']];
                $r['egr_cuenta'] = $arrCaj_d[$i]['caj_cue_id']['cue_nombre'];
                $r['egr_descripcion'] = '<a href="#" onclick="viewCaj('.$arrCaj_d[$i]['caj_id'].','.$arrCaj_d[$i]['caj_tipo'].')">'.$arrCaj_d[$i]['caj_observaciones'].'</a>' ; 
                $r['egr_monto'] = abs($arrCaj_d[$i]['caj_monto']);
                array_push($egr,$r);
            }
        } 


        for ($i=0; $i < count($nc); $i++) {
            $r = array();
            $r['egr_gt4_id'] = $nc[$i]['caj_gt4_id'];
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
            $liq['liq_monto'] = $sal[$i]['liq_actualn'];
            $nm = date('Y-m-d',strtotime('next month '.strClean($_SESSION['periodo']).'-01'));
            $liq['liq_fecha'] = $nm;
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
        $writer->save('Assets/excel/format.xlsx');
        echo json_encode(array('name'=>'format.xlsx'),JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getDetracciones($out=false){
        $trim = "DATE_FORMAT(mov_fechaE, '%Y-%m') = '".str_replace('"','',$_SESSION['periodo'])."'";
        $_POST['where'] = json_decode($_POST['where'],true);
        if (isset($_POST['where']['trim'])) {
            $trim = 'mov_fechaE BETWEEN '.$_POST['where']['trim'];
            $out = false;
        }
        
        $res = $this->movimientos->selectCustoms('mov_cue_id,SUM(mov_subtotal) as mov_sum',array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_tipo'=>1,'custom'=>'mov_t10_id != 51 AND mov_cue_id IS NOT NULL AND '.$trim.'  GROUP BY mov_cue_id'));
        $this->newController('Main');
        $tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tcompra'];
        unset($this->Main);
        foreach ($res as $i => $d) {
            if ($d['mov_cue_id']['cue_gt4_id']['gt4_id']==2) {
                $d['mov_sum'] = $d['mov_sum']*floatval($tga);
                $res[$i]['mov_sum'] = $d['mov_sum']*floatval($tga);
            }
            $res[$i]['mov_detraccion'] = $d['mov_sum']*0.177;
            $res[$i]['mov_impuesto'] = $d['mov_sum']*0.025; //($res[$i]['mov_cue_id']['cue_porcentaje']/100)
            $res[$i]['mov_det_liq'] = $res[$i]['mov_detraccion']-$res[$i]['mov_impuesto'];
            $res[$i]['mov_porc'] = '<input type="text" value="'.$res[$i]['mov_cue_id']['cue_porcentaje'].'" name="det" size="4" onChange="setPorcentaje('.$res[$i]['mov_cue_id']['cue_id'].',event)">'; 
            $res[$i]['mov_dscg'] = $res[$i]['mov_det_liq']*($res[$i]['mov_cue_id']['cue_porcentaje']/100);
            $res[$i]['mov_sald'] = $res[$i]['mov_det_liq']-$res[$i]['mov_dscg'];
            $btnView = '<button class="btn btn-info btn-sm" onclick="getDetView('.$d['mov_cue_id']['cue_id'].',`'.$trim.'`)" title="Ver Registro" > <i class="far fa-eye"></i> </button>';
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
        $this->newController('Main');
        $tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tcompra'];
        unset($this->Main);
        foreach ($res as $i => $r) {
            if ($r['mov_cue_id']['cue_gt4_id']['gt4_id']==2) {
                $res[$i]['mov_sum'] = $r['mov_sum']*floatval($tga);
                $r['mov_sum'] = $r['mov_sum']*floatval($tga);
            }
            $res[$i]['mov_porc'] = '<input type="text" value="'.$r['mov_cue_id']['cue_por_exp'].'" size="4" onChange="setPorExp('.$r['mov_cue_id']['cue_id'].',event)">'; 
            $res[$i]['mov_base'] = $r['mov_sum']*$r['mov_cue_id']['cue_por_exp'];
            $res[$i]['mov_cigv'] = $res[$i]['mov_base']*0.18;
            $res[$i]['mov_impuesto'] =  $r['mov_sum']*0.035;
            $res[$i]['mov_retorno'] = $res[$i]['mov_cigv']-$res[$i]['mov_impuesto'];
            $res[$i]['mov_porc_ret'] = '<input type="text" value="'.$r['mov_cue_id']['cue_porcentaje'].'" size="4" name="exp" onChange="setPorcentaje('.$r['mov_cue_id']['cue_id'].',event)">';
            $res[$i]['mov_dscg'] = $res[$i]['mov_retorno']*($res[$i]['mov_cue_id']['cue_porcentaje']/100);
            $res[$i]['mov_sald'] = $res[$i]['mov_retorno']-$res[$i]['mov_dscg']; 
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