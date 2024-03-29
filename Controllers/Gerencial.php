<?php 

@ob_start();
require_once 'Libraries/dompdf/vendor/autoload.php';
require_once 'Libraries/qr-code/vendor/autoload.php';
class Gerencial extends Controllers{
    public function __construct(){
        parent::__construct('mdetalles');
        $this->newModel('agentes');
        $this->newModel('t2identidades');
        $this->newModel('movimientos');
        $this->newModel('configuraciones');
        $this->newModel('rcomisiones');
        $this->newModel('cajas');
        $this->newModel('mdetalles');
        $this->newModel('nrcomisiones');
        $this->newController('Reportes');
        $this->newController('Liquidez');
        $this->newController('Cuentas');
    }
    public function Gerencial(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Reporte Mensual";
        $data['page_title'] = "Reporte Mensual";
        $data['page_name'] = "Reporte Mensual";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_gerencial.js","functions_sbienes.js","functions_liquidez.js","functions_cuentas.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"gerencial",$data);
    }
    public function Resultados(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Estado de Resultados";
        $data['page_title'] = "Estado de Resultados";
        $data['page_name'] = "Estado de Resultados";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_gerencial.js","functions_reportes.js");
        $this->views->getView($this,"resultados",$data);
    }
    public function Comisiones(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $_SESSION['mov']['mov_tipo']= 2;
        $data['page_tag'] = "Resumen y Comisiones";
        $data['page_title'] = "Resumen y Comisiones";
        $data['page_name'] = "Resumen y Comisiones";
        $data['page_data'] = array('periodo'=>$_SESSION['periodo'],'per'=>$_SESSION['perMod']['gtp_u'],'gus_id'=>$_SESSION['gus']['gus_id']);
        $data['page_functions_js'] = array("functions_gerencial.js","functions_movimientos.js");
        $this->views->getView($this,"comisiones",$data);
    }
    public function Exportaciones(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Exportaciones";
        $data['page_title'] = "Exportaciones";
        $data['page_name'] = "Exportaciones";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_gerencial.js","functions_movimientos.js");
        $this->views->getView($this,"exportaciones",$data);
    }
    public function Volumen(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Volumen de Ventas Nacionales";
        $data['page_title'] = "Volumen de Ventas Nacionales";
        $data['page_name'] = "Volumen de Ventas Nacionales";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_volumen.js","functions_movimientos.js");
        $this->views->getView($this,"detracciones",$data);
    }
    public function Vexportacion(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Volumen de Ventas Exportacion";
        $data['page_title'] = "Volumen de Ventas Exportacion";
        $data['page_name'] = "Volumen de Ventas Exportacion";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_volumen.js","functions_movimientos.js");
        $this->views->getView($this,"exportaciones",$data);
    }
    public function Detracciones(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Detracciones";
        $data['page_title'] = "Detracciones";
        $data['page_name'] = "Detracciones";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_gerencial.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"detracciones",$data);
    }
    public function Cventas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Reporte Mensual";
        $data['page_title'] = "Reporte Mensual";
        $data['page_name'] = "Reporte Mensual";
        $data['page_data'] = array('age_tipo'=>0,'periodo'=>$_SESSION['periodo']);
        $data['page_functions_js'] = array("functions_gerencial.js","functions_reportes.js","functions_movimientos.js");
        $this->views->getView($this,"cventas",$data);
    }
    public function pdf(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['res'] = $this->getGerencial(true);
        $data['cue'] = $this->Cuentas->getCuentas(2,true);
        $data['sbi'] = $this->Reportes->getHistorico(null,true);
        $data['liq'] = $this->Liquidez->getLiquidez('todo');
        $data['gas'] = $this->cajas->selectCustoms('caj_tga_id,SUM(caj_monto) as caj_monto',array('caj_tipo'=>3,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' GROUP BY caj_tga_id'));
        $data['cve'] = $this->Reportes->getCventas(true);
        //$this->views->getView($this,"pdf",$data);
    }
    public function getGerencial($out=false){
        $res = array();
        $res[0]['res_descripcion']='EFECTIVO';
        $res[0]['res_total'] = $this->cajas->searchRegistro(
            array('caj_cue_id'=>22,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),' SUM(caj_monto) AS saldo ')['saldo'];
        $res[0]['res_options']='<button class="btn btn-warning  btn-sm" onClick="resEfectivo()"><i class="far fa-eye"></i></button>';

        $res[1]['res_descripcion']='CUENTAS';

        $s = $this->cajas->searchRegistro(
            array('caj_gt4_id'=>1,'custom'=>'caj_cue_id != 22 AND caj_cue_id IS NOT NULL AND DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),' SUM(caj_monto) AS saldo ')['saldo'];
        $d = $this->cajas->searchRegistro(
            array('caj_gt4_id'=>2,'custom'=>'caj_cue_id != 22 AND caj_cue_id IS NOT NULL AND DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),' SUM(caj_monto) AS saldo ')['saldo'];

        $this->newController('Main');
        $tce = $this->Main->getTcambio(date('Y-m-d'),true);
        unset($this->Main);
        $res[1]['res_total'] = $s+($d*$tce['tce_gtc_id']['gtc_tcompra']);

        $res[1]['res_options']='<button class="btn btn-warning  btn-sm" onClick="resCuentas()"><i class="far fa-eye"></i></button>';

        $res[2]['res_descripcion']='INVENTARIO';
        $sal = $this->Reportes->getHistorico(null,true);
        $res[2]['res_total'] = array_sum(array_column($sal,'sbi_mts'));
        $res[2]['res_options']='<button class="btn btn-warning  btn-sm" onClick="resInventario()"><i class="far fa-eye"></i></button>';

        $liq = $this->Liquidez->getLiquidez('retornar');
        $res[3]['res_descripcion']='COBRAR';
        $res[3]['res_total'] = $liq['liq_cobrar'];
        $res[3]['res_options']='<button class="btn btn-warning  btn-sm" onClick="resCobrar()"><i class="far fa-eye"></i></button>';

        $res[4]['res_descripcion']='PAGAR';
        $res[4]['res_total'] = -$liq['liq_pagar'];
        $res[4]['res_options']='<button class="btn btn-warning  btn-sm" onClick="resPagar()"><i class="far fa-eye"></i></button>';

        // $res[5]['res_descripcion']='INGRESOS ADICIONALES';
        // $res[5]['res_total'] = $this->cajas->searchRegistro(array('caj_tipo'=>4,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']),'SUM(caj_monto) as total')['total'];
        // $res[5]['res_options']='<button class="btn btn-warning  btn-sm" onClick="resAdd()"><i class="far fa-eye"></i></button>';
        if ($out) {
            return $res;
        } else {
            echo json_encode($res,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function getResultados($out=false){
        $res = array();
        $res[0]['sfi_des']='Ingreso por Ventas';
        $res[0]['sfi_sum']=$this->Reportes->getCventas(true,true);
        $res[1]['sfi_des']='Merma de Materiales';
        $mer = $this->movimientos->selectRegistros(array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_t12_id'=>13,'mov_tipo'=>1,'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']));
        $res[1]['sfi_sum']=-array_sum(array_column($mer,'mov_total'));
        
        $res[2]['sfi_des']='Nota de Creditos';
        $cas = $this->cajas->selectRegistros(array('caj_tipo'=>6,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']));
        $res[2]['sfi_sum']=array_sum(array_column($cas,'caj_monto'));
        
        $res[3]['sfi_des']='Nota de Debitos';
        $cas = $this->cajas->selectRegistros(array('caj_tipo'=>7,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']));
        $res[3]['sfi_sum']=array_sum(array_column($cas,'caj_monto'));
        
        $res[4]['sfi_des']='Gastos General';
        $gas = $this->cajas->selectRegistros(array('caj_tipo'=>3,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo']));
        $res[4]['sfi_sum']=array_sum(array_column($gas,'caj_monto'));
        if ($out) {
            return $res;
        } else {
            echo json_encode($res,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function getPdf(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['res'] = $this->getGerencial(true);
        $data['cue'] = $this->Cuentas->getCuentas(2,true);
        $data['sbi'] = $this->Reportes->getHistorico(null,true);
        $data['liq'] = $this->Liquidez->getLiquidez('todo');

        $this->newController('Main');
        $tga = $this->Main->getTcambio(date('Y-m-d'),true)['tce_gtc_id']['gtc_tcompra'];
        unset($this->Main);
        $arrData = $this->cajas->selectCustoms('caj_tga_id,ABS(SUM(caj_monto)) as caj_monto',array('caj_tipo'=>3,'caj_gt4_id'=>1,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' GROUP BY caj_tga_id'));
        $arrUSD = $this->cajas->selectCustoms('caj_tga_id,ABS(SUM(caj_monto)) as caj_monto',array('caj_tipo'=>3,'caj_gt4_id'=>2,'custom'=>'DATE_FORMAT(caj_fecha, "%Y-%m") = '.$_SESSION['periodo'].' GROUP BY caj_tga_id'),array('caj_tga_id'));
        $arrUSD = array_column($arrUSD,'caj_monto','caj_tga_id');
        foreach ($arrData as $i => $r) {
            if (isset($arrUSD[$r['caj_tga_id']['tga_id']])) {
                $arrData[$i]['caj_monto'] += $arrUSD[$r['caj_tga_id']['tga_id']]*$tga;
            }
        }

        $data['gas'] = $arrData;
        $data['cve'] = $this->Reportes->getCventas(true);
        $dompdf = new Dompdf\Dompdf();
        ob_end_clean();
        $options = new Dompdf\Options();
        $options->set(array('isRemoteEnabled'=>true));
        $dompdf->setOptions($options);
        $html = getFile("Gerencial/pdf",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4');
        $dompdf->render();
        $dompdf->stream('my.pdf',array('Attachment'=>0));
        die();
    }
    public function prueba(){
        //$this->configuraciones->insertRegistro(array('con_clave'=>'cron','con_valor'=>'"'.date("H-i").'"'));
        // curl_core();
        $nm = date('Y-m-d',strtotime('next month '.strClean($_SESSION['periodo']).'-01'));
        dep($nm);
    }
    public function getExpDet($id){
        $arrData = $this->movimientos->selectRegistros(array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_tipo'=>1,'mov_t10_id'=>51,'mov_cue_id'=>$id,'custom'=>'mov_cue_id IS NOT NULL AND   DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']));
        for ($i=0; $i < count($arrData); $i++) {
            $btnEdit = '';
            $btnView = '';
            $btnDelete = '';
            $btnPdf = '';
            $arrData[$i]['mov_nro'] = $i+1;
            if (!is_null($arrData[$i]['mov_age_id'])) {
                $arrData[$i]['mov_age_ide'] = (!empty($arrData[$i]['mov_age_id']['age_gem_id'])) ? $arrData[$i]['mov_age_id']['age_gem_id']['gem_razonsocial'] : $arrData[$i]['mov_age_id']['age_gpe_id']['gpe_nombre'].', '.$arrData[$i]['mov_age_id']['age_gpe_id']['gpe_apellidos'] ;
            }else{
                $arrData[$i]['mov_age_ide'] = '<span class="badge badge-warning">nulo</span>';
            }
            $arrData[$i]['mov_serie'] = $arrData[$i]['mov_serie'].'-'.str_pad($arrData[$i]['mov_numero'],8,0,STR_PAD_LEFT);
            $arrData[$i]['mov_subtotal'] = formatMoney($arrData[$i]['mov_subtotal']);
            $arrData[$i]['mov_igv'] = formatMoney(json_decode($arrData[$i]['mov_igv_id'],true)['mov_igv']);
            $arrData[$i]['mov_total'] = $arrData[$i]['mov_total'];
            $arrData[$i]['mov_t12num'] = $arrData[$i]['mov_tipo'].'-'.date( "m", strtotime($arrData[$i]['mov_fechaE'])).str_pad($arrData[$i]['mov_t12num'],6,'0',STR_PAD_LEFT);
            $arrData[$i]['mov_mstatus'] = '<span class="badge badge-'.MSTATUS[$arrData[$i]['mov_mstatus']][1].'">'.MSTATUS[$arrData[$i]['mov_mstatus']][0].'</span>';
            if($_SESSION['perMod']['gtp_r']){	
                $btnView = '<button class="btn btn-info btn-sm" onclick="getViewMov('.$arrData[$i]['mov_id'].')" title="Ver '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" > <i class="far fa-eye"></i> </button>';
                $btnPdf = '<a class="btn btn-danger btn-sm" href="'.base_url().'/Movimientos/getPdf/'.$arrData[$i]['mov_id'].'" target="_blanck" title="Pdf '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" ><i class="far fa-file-pdf"></i></a>';
            }
            $arrData[$i]['mov_options'] = '<div class="text-center">'.$btnView.' '.$btnPdf.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getDetView($id){
        $trm = (isset($_GET['trim']))?$_GET['trim']:'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo'];
        $arrData = $this->movimientos->selectRegistros(array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_tipo'=>1,'mov_cue_id'=>$id,'custom'=>'mov_t10_id != 51 AND mov_cue_id IS NOT NULL AND  '.$trm));
        for ($i=0; $i < count($arrData); $i++) {
            $btnEdit = '';
            $btnView = '';
            $btnDelete = '';
            $btnPdf = '';
            $arrData[$i]['mov_nro'] = $i+1;
            if (!is_null($arrData[$i]['mov_age_id'])) {
                $arrData[$i]['mov_age_ide'] = (!empty($arrData[$i]['mov_age_id']['age_gem_id'])) ? $arrData[$i]['mov_age_id']['age_gem_id']['gem_razonsocial'] : $arrData[$i]['mov_age_id']['age_gpe_id']['gpe_nombre'].', '.$arrData[$i]['mov_age_id']['age_gpe_id']['gpe_apellidos'] ;
            }else{
                $arrData[$i]['mov_age_ide'] = '<span class="badge badge-warning">nulo</span>';
            }
            $arrData[$i]['mov_serie'] = $arrData[$i]['mov_serie'].'-'.str_pad($arrData[$i]['mov_numero'],8,0,STR_PAD_LEFT);
            $arrData[$i]['mov_subtotal'] = formatMoney($arrData[$i]['mov_subtotal']);
            $arrData[$i]['mov_igv'] = formatMoney(json_decode($arrData[$i]['mov_igv_id'],true)['mov_igv']);
            $arrData[$i]['mov_total'] = $arrData[$i]['mov_total'];
            $arrData[$i]['mov_t12num'] = $arrData[$i]['mov_tipo'].'-'.date( "m", strtotime($arrData[$i]['mov_fechaE'])).str_pad($arrData[$i]['mov_t12num'],6,'0',STR_PAD_LEFT);
            $arrData[$i]['mov_mstatus'] = '<span class="badge badge-'.MSTATUS[$arrData[$i]['mov_mstatus']][1].'">'.MSTATUS[$arrData[$i]['mov_mstatus']][0].'</span>';
            if($_SESSION['perMod']['gtp_r']){	
                $btnView = '<button class="btn btn-info btn-sm" onclick="getViewMov('.$arrData[$i]['mov_id'].')" title="Ver '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" > <i class="far fa-eye"></i> </button>';
                $btnPdf = '<a class="btn btn-danger btn-sm" href="'.base_url().'/Movimientos/getPdf/'.$arrData[$i]['mov_id'].'" target="_blanck" title="Pdf '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" ><i class="far fa-file-pdf"></i></a>';
            }
            $arrData[$i]['mov_options'] = '<div class="text-center">'.$btnView.' '.$btnPdf.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getComView($id){
        $trm = $_GET['trim'];
        $arrData = $this->movimientos->selectRegistros(array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_tipo'=>2,'mov_age_id'=>$id,'custom'=>$trm));
        for ($i=0; $i < count($arrData); $i++) {
            $btnEdit = '';
            $btnView = '';
            $btnDelete = '';
            $btnPdf = '';
            $arrData[$i]['mov_nro'] = $i+1;
            if (!is_null($arrData[$i]['mov_age_id'])) {
                $arrData[$i]['mov_age_ide'] = (!empty($arrData[$i]['mov_age_id']['age_gem_id'])) ? $arrData[$i]['mov_age_id']['age_gem_id']['gem_razonsocial'] : $arrData[$i]['mov_age_id']['age_gpe_id']['gpe_nombre'].', '.$arrData[$i]['mov_age_id']['age_gpe_id']['gpe_apellidos'] ;
            }else{
                $arrData[$i]['mov_age_ide'] = '<span class="badge badge-warning">nulo</span>';
            }
            $arrData[$i]['mov_serie'] = $arrData[$i]['mov_serie'].'-'.str_pad($arrData[$i]['mov_numero'],8,0,STR_PAD_LEFT);
            $arrData[$i]['mov_subtotal'] = formatMoney($arrData[$i]['mov_subtotal']);
            $arrData[$i]['mov_igv'] = formatMoney(json_decode($arrData[$i]['mov_igv_id'],true)['mov_igv']);
            $arrData[$i]['mov_total'] = $arrData[$i]['mov_total'];
            $arrData[$i]['mov_t12num'] = $arrData[$i]['mov_tipo'].'-'.date( "m", strtotime($arrData[$i]['mov_fechaE'])).str_pad($arrData[$i]['mov_t12num'],6,'0',STR_PAD_LEFT);
            $arrData[$i]['mov_mstatus'] = '<span class="badge badge-'.MSTATUS[$arrData[$i]['mov_mstatus']][1].'">'.MSTATUS[$arrData[$i]['mov_mstatus']][0].'</span>';
            if($_SESSION['perMod']['gtp_r']){	
                $btnView = '<button class="btn btn-info btn-sm" onclick="getViewMov('.$arrData[$i]['mov_id'].')" title="Ver '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" > <i class="far fa-eye"></i> </button>';
                $btnPdf = '<a class="btn btn-danger btn-sm" href="'.base_url().'/Movimientos/getPdf/'.$arrData[$i]['mov_id'].'" target="_blanck" title="Pdf '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" ><i class="far fa-file-pdf"></i></a>';
            }
            $arrData[$i]['mov_options'] = '<div class="text-center">'.$btnView.' '.$btnPdf.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getComisiones($age_id,$ret=false){
        $arrData = $this->movimientos->selectCustoms('mov_id',array('mov_age_id'=>$age_id,'mov_tipo'=>2,'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo'].' '),array());
        $mov = !empty(implode(',', array_column($arrData, 'mov_id')))?implode(',', array_column($arrData, 'mov_id')):0;
        $mde = $this->mdetalles->selectCustoms('mde_bie_id as rco_bie_id ,SUM(mde_q) AS rco_q,SUM(mde_importe) AS rco_st',array(
            'custom'=>'mde_mov_id in ('.$mov.') AND mde_bie_id in (6,8,5,4,11,23,24,19) GROUP BY mde_bie_id'),array('mde_bie_id','mde_mov_id','mde_t6m_id','mde_gta_id'));
        
        foreach ($mde as $i => $r) {
            $r['rco_fecha'] = str_replace('"','',$_SESSION['periodo']).'-01';
            $r['rco_age_id'] = $age_id;
            $rco = $this->rcomisiones->searchRegistro(array('rco_fecha'=>$r['rco_fecha'],'rco_bie_id'=>$r['rco_bie_id'],'rco_age_id'=>$r['rco_age_id']));
            if (!empty($rco)) {
                $r['rco_id']=$rco['rco_id'];
                $r['rco_porc']=$rco['rco_porc'];
                $rco = $this->rcomisiones->updateRegistro($r);
            } else {
                $rco = $this->rcomisiones->insertRegistro($r,array('rco_fecha','rco_bie_id','rco_age_id'));
            }
            // $mde[$i]['mde_opt'] = '<div class="text-center">'.'<button class="btn btn-info btn-sm" onclick="getComView('.$age_id.',`mov_id in ('.$mov.')`)" title="Ver Registro" > <i class="far fa-eye"></i> </button>'.'</div>';
        }
        $arrRco = array();
        if (intval($age_id)>0) {
            $arrRco = $this->rcomisiones->selectRegistros(array('rco_age_id'=>intval($age_id),'rco_fecha'=>str_replace('"','',$_SESSION['periodo']).'-01'));
        }
        foreach ($arrRco as $i => $r) {
            $arrRco[$i]['rco_pp'] = ($arrRco[$i]['rco_q']>0)?$arrRco[$i]['rco_st']/$arrRco[$i]['rco_q']:0;
            $arrRco[$i]['rco_pt'] = $arrRco[$i]['rco_st']*($arrRco[$i]['rco_porc']/100);
            $arrRco[$i]['rco_porc_b'] = $arrRco[$i]['rco_porc'];
            $arrRco[$i]['rco_porc'] = '<input type="text" value="'.number_format($arrRco[$i]['rco_porc'],2,'.',',').'" size="4" onChange="setPocRco('.$arrRco[$i]['rco_id'].',event)">'; 
            $arrRco[$i]['rco_opt'] = '<div class="text-center">'.'<button class="btn btn-info btn-sm" onclick="getComView('.$age_id.',`mov_id in ('.$mov.')`)" title="Ver Registro" > <i class="far fa-eye"></i> </button>'.'</div>';
        }
        if ($ret) {
            return $arrRco;
        } else {
            echo json_encode($arrRco,JSON_UNESCAPED_UNICODE); 
        }
        die();
    }
    public function getTriView($id){
        $arrData = $this->movimientos->selectCustoms('mov_id',array('mov_age_id'=>$id,'mov_tipo'=>2,'custom'=>"mov_fechaE BETWEEN '".$_GET['fecha_i']."' AND '".$_GET['fecha_f']."'"));
        $mov = !empty(implode(',', array_column($arrData, 'mov_id')))?implode(',', array_column($arrData, 'mov_id')):0;
        $mde = $this->mdetalles->selectCustoms('mde_bie_id,SUM(mde_q) AS rco_q,SUM(mde_importe) AS rco_st',array(
            'custom'=>'mde_mov_id in ('.$mov.') AND mde_bie_id in (6,8,5,4,11,23,24,19) GROUP BY mde_bie_id'),array('mde_mov_id','mde_t6m_id','mde_gta_id','bie_bbi_id','bie_t6m_id'));
        foreach ($mde as $i => $r) {
            $mde[$i]['rco_porc'] = 0;
            $mde[$i]['rco_opt'] = '<div class="text-center">'.'<button class="btn btn-info btn-sm" onclick="event.preventDefault();getComView('.$id.',`mov_id in ('.$mov.')`)" title="Ver Registro" > <i class="far fa-eye"></i> </button>'.'</div>';
            $mde[$i]['rco_pt'] = $mde[$i]['rco_st']*($mde[$i]['rco_porc']/100);
        }
        echo json_encode($mde,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getRcoPDF($age_id){
        // $_POST = json_decode(file_get_contents("php://input"),true);
        ob_end_clean();
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $data['rco'] =  $this->getComisiones($age_id,true);
        $data['age'] = $this->agentes->selectRegistro($age_id);
        $dompdf = new Dompdf\Dompdf();
        $options = new Dompdf\Options();
        $options->set(array('isRemoteEnabled'=>true));
        $dompdf->setOptions($options);
        $html = getFile("Gerencial/pdfRco",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('letter', 'potrait');
        $dompdf->render();
        $canvas = $dompdf->getCanvas(); 
        $fontMetrics = new Dompdf\FontMetrics($canvas, $options); 
        $w = $canvas->get_width(); 
        $h = $canvas->get_height(); 
        $font = $fontMetrics->getFont('times'); 
        $text = "CONFIDENTIAL"; 
        $txtHeight = $fontMetrics->getFontHeight($font, 75); 
        $textWidth = $fontMetrics->getTextWidth($text, $font, 75); 
        $canvas->set_opacity(.06); 
        $x = (($w-($textWidth-80))); 
        $y = (((2*$h/3)-$txtHeight)); 
        $canvas->text($x, $y, $text, $font, 75,array(0,0,0),0,0,315); 
        $dompdf->stream('my.pdf',array('Attachment'=>0));
        die();
    }
    public function getNrcPDF($id){
        ob_end_clean();
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $data['qr'] = Endroid\QrCode\Builder\Builder::create()
                        ->writer(new Endroid\QrCode\Writer\PngWriter())
                        ->writerOptions([])
                        ->data(BASE_URL.'/Assets/pdf/brochure.pdf')
                        ->encoding(new Endroid\QrCode\Encoding\Encoding('UTF-8'))
                        ->errorCorrectionLevel(new Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh())
                        ->size(100)
                        ->margin(1)
                        ->roundBlockSizeMode(new Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin())
                        ->labelText('Brochure')
                        ->labelFont(new Endroid\QrCode\Label\Font\NotoSans(11))
                        ->labelAlignment(new Endroid\QrCode\Label\Alignment\LabelAlignmentCenter())
                        ->validateResult(false)
                        ->build()
                        ->getDataUri();
        $data['nrc'] =  $this->nrcomisiones->selectRegistro($id);
        $dompdf = new Dompdf\Dompdf();
        $options = new Dompdf\Options();
        $options->set(array('isRemoteEnabled'=>true));
        $dompdf->setOptions($options);
        $html = getFile("Gerencial/pdfNrc",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('letter', 'potrait');
        $dompdf->render();
        $canvas = $dompdf->getCanvas(); 
        $fontMetrics = new Dompdf\FontMetrics($canvas, $options); 
        $w = $canvas->get_width(); 
        $h = $canvas->get_height(); 
        $font = $fontMetrics->getFont('times'); 
        $text = "CONFIDENTIAL"; 
        $txtHeight = $fontMetrics->getFontHeight($font, 75); 
        $textWidth = $fontMetrics->getTextWidth($text, $font, 75); 
        $canvas->set_opacity(.06); 
        $x = (($w-($textWidth-80))); 
        $y = (((2*$h/3)-$txtHeight)); 
        $canvas->text($x, $y, $text, $font, 75,array(0,0,0),0,0,315); 
        $dompdf->stream('my.pdf',array('Attachment'=>0));
        die();
    }
    public function getListComisiones(){
        $res = array();
        $age = $this->agentes->selectCustoms('age_id,age_gpe_id',array('custom'=>'age_gpe_id IS NOT NULL'),array('gpe_gt2_id','gpe_gdi_id'));
        foreach ($age as $i => $r) {
            $arrData = $this->movimientos->selectCustoms('mov_id',array('mov_age_id'=>$r['age_id'],'mov_tipo'=>2,'custom'=>"mov_fechaE BETWEEN '".$_GET['fi']."' AND '".$_GET['ff']."'"));
            $mov = !empty(implode(',', array_column($arrData, 'mov_id')))?implode(',', array_column($arrData, 'mov_id')):0;
            $mde = $this->mdetalles->selectCustoms('mde_bie_id,SUM(mde_q) AS mde_q',array(
                'custom'=>'mde_mov_id in ('.$mov.') AND mde_bie_id in (6,8,5,4,11,23,24,19) GROUP BY mde_bie_id'),array('mde_mov_id','mde_t6m_id','mde_gta_id','mde_bie_id'));
            $de = array_column($mde,'mde_q','mde_bie_id');
            if (!empty($de)) {
                $de['mde_age_id'] = $r;
                $de['age_id'] = $r['age_id'];
                array_push($res,$de);
            }
        }
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
        die();
    }
}

?>