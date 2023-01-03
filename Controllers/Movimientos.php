<?php 
@ob_start();
require 'Libraries/html2pdf/vendor/autoload.php';
require 'Libraries/numero2letras/vendor/autoload.php';
require_once 'Libraries/dompdf/vendor/autoload.php';
require_once 'Libraries/qr-code/vendor/autoload.php';
use Luecano\NumeroALetras\NumeroALetras;
class Movimientos extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));   
        getPermisos(1);
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
        $this->formatter = new NumeroALetras();
    }
    public function Movimientos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = ucfirst($_GET['url']);
        $data['page_title'] = ucfirst($_GET['url']);
        $data['page_name'] = $_GET['url'];
        switch ($_GET['url']) {
            case 'sbienes':
                $_SESSION['mov']['mov_tipo'] = '02';
                $data['page_data']['mov_t12_id'] = 16;
                $data['page_title'] = 'Saldos Inicial';
                break; 
            case 'entradas':
                $_SESSION['mov']['mov_tipo'] = '02';
                $data['page_data']['mov_t12_id'] = 2;
                break; 
            case 'salidas':
                $_SESSION['mov']['mov_tipo'] = '01';
                $data['page_data']['mov_t12_id'] = 1;
                break; 
            case 'mermas':
                $_SESSION['mov']['mov_tipo'] = '01';
                $data['page_data']['mov_t12_id'] = 13;
                break; 
            case 'transferencias':
                $_SESSION['mov']['mov_tipo'] = '01';
                $data['page_data']['mov_t12_id'] = 18;
                break;
            default:
                header("Location:".base_url().'/dashboard');
                break;
        }
        $data['estData'] = $this->establecimientos->selectRegistros();  
        $data['page_data']['periodo'] = $_SESSION['periodo'];
        $data['page_data']['mov_tipo'] = $_SESSION['mov']['mov_tipo'];
        $data['page_functions_js'] = array("functions_movimientos.js","functions_sbienes.js","functions_agentes.js","functions_empresas.js","functions_personas.js");
        $this->views->getView($this,"movimientos",$data);
    }
    public function getMovimientos($mov_t12_id){
        $arrData = $this->movimientos->selectRegistros(array('mov_alm_id'=>$_SESSION['alm']['alm_id'],'mov_t12_id'=>$mov_t12_id,'mov_tipo'=>$_SESSION['mov']['mov_tipo'],'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = '.$_SESSION['periodo']));
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
            if ($mov_t12_id == 18) {
                $mov_mov_id = $this->movimientos->selectRegistro($arrData[$i]['mov_id']);
                $arrData[$i]['mov_serie2'] = $mov_mov_id['mov_serie'].'-'.str_pad($mov_mov_id['mov_numero'],8,0,STR_PAD_LEFT);
            }
            $arrData[$i]['mov_subtotal'] = formatMoney($arrData[$i]['mov_subtotal']);
            $arrData[$i]['mov_igv'] = formatMoney(json_decode($arrData[$i]['mov_igv_id'],true)['mov_igv']);
            $arrData[$i]['mov_total'] = $arrData[$i]['mov_total'];
            $arrData[$i]['mov_t12num'] = $arrData[$i]['mov_tipo'].'-'.date( "m", strtotime($arrData[$i]['mov_fechaE'])).str_pad($arrData[$i]['mov_t12num'],6,'0',STR_PAD_LEFT);
            $arrData[$i]['mov_mstatus'] = '<span class="badge badge-'.MSTATUS[$arrData[$i]['mov_mstatus']][1].'">'.MSTATUS[$arrData[$i]['mov_mstatus']][0].'</span>';
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary btn-sm" onClick="editMov('.$arrData[$i]['mov_id'].')" title="Editar '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'"><i class="fas fa-pencil-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="fntDelMov('.$arrData[$i]['mov_id'].')" title="Eliminar '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'"><i class="far fa-trash-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_r']){	
                $btnView = '<button class="btn btn-info btn-sm" onclick="getViewMov('.$arrData[$i]['mov_id'].')" title="Ver '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" > <i class="far fa-eye"></i> </button>';
                $btnPdf = '<a class="btn btn-danger btn-sm" href="'.base_url().'/Movimientos/getPdf/'.$arrData[$i]['mov_id'].'" target="_blanck" title="Pdf '.$arrData[$i]['mov_t10_id']['t10_descripcion'].'" ><i class="far fa-file-pdf"></i></a>';
            }
            $arrData[$i]['mov_options'] = '<div class="text-center">'.$btnView.' '.$btnPdf.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getNumMovimiento(){
        $_POST['mov_alm_id'] = $_SESSION['alm']['alm_id'];
        $_POST['custom'] = 'DATE_FORMAT(mov_fechaE, "%Y") = '.date('Y',strtotime($_SESSION['periodo']));
        if ($_POST['mov_t10_id']==50 || $_POST['mov_t10_id']==2) {
            $_POST['mov_t10_id'] = 50;
            $mun_n = $this->movimientos->searchRegistro($_POST,"MAX(mov_numero) as 'next'")['next'];
            $_POST['mov_t10_id'] = 2;
            $num_f= $this->movimientos->searchRegistro($_POST,"MAX(mov_numero) as 'next'")['next'];
            $mov_numero = max($mun_n,$num_f);
        } else {
            $mov_numero = $this->movimientos->searchRegistro($_POST,"MAX(mov_numero) as 'next'")['next'];
        }
        $arrData = array('mov_numero'=>str_pad($mov_numero+1,8,0,STR_PAD_LEFT));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setMovimiento($data = null){
        if ($_POST) { 
            if (!empty($data)) {
                $_POST = $data;
            }
            foreach($_POST as $i => $value) {
                if (is_json($value) && $i != 'mov_igv_id' && $i != 'mov_ncr_id'){
                    $_POST[$i] = json_decode($value,true);
                }
            }
            $tce = $this->tcespeciales->selectRegistro($_POST['mov_gtc_id']);
            $arrMde = $_POST['mov_mde_id'];
            unset($_POST['mov_mde_id']);
            unset($_POST['gtc_compra']);
            unset($_POST['gtc_venta']);
            unset($_POST['mov_gtc_id']);
            if (empty($_POST['mov_ncr_id'])) {
                unset($_POST['mov_ncr_id']);
            }
            if (intval($_POST['mov_id'])==0) {
                $t12num =  $this->movimientos->searchRegistro(
                                array('mov_alm_id'=>(isset($mov['mov_alm_id']))?$mov['mov_alm_id']:$_SESSION['alm']['alm_id'],
                                        'mov_tipo'=>$_SESSION['mov']['mov_tipo'],
                                        'custom'=>'DATE_FORMAT(mov_fechaE, "%Y-%m") = "'.date( "Y-m", strtotime($_POST['mov_fechaE'])).'"',
                                        'mov_t12_id'=>$_POST['mov_t12_id']),' MAX(mov_t12num) AS num ');
                $mov = $_POST;
                $mov['mov_tce_id'] = $tce['tce_id'];
                $mov['mov_t12num'] = intval($t12num['num'])+1;
                $mov['mov_alm_id'] =  (isset($mov['mov_alm_id']))?$mov['mov_alm_id']:$_SESSION['alm']['alm_id'];
                $mov['mov_tipo'] = (isset($mov['mov_tipo']))?$mov['mov_tipo']:$_SESSION['mov']['mov_tipo'];
                $mov['mov_fechaR'] = $_POST['mov_fechaE'];
                $mov['mov_fechaV'] = $_POST['mov_fechaE'];
                $mov['mov_gus_id'] = $_SESSION['gus']['gus_id'];
                $mov_id = $this->movimientos->insertRegistro($mov,array('mov_serie','mov_numero','mov_alm_id','mov_tipo','mov_fechaE')); 
                if (isset($mov_id['exist'])) {
                    if ($mov_id['exist']) {
                        $mov_id['status'] = false;
                        echo json_encode($mov_id,JSON_UNESCAPED_UNICODE); 
                        die();
                    }
                }
                foreach ($arrMde as $i => $mde){ 
                    unset($mde['mde_mes']);
                    $mde['mde_bie_id'] = $mde['mde_bie_id']['bie_id'];
                    $mde['mde_t6m_id'] = $mde['mde_t6m_id']['t6m_id'];
                    $mde['mde_gta_id'] = $mde['mde_gta_id']['gta_id'];
                    $mde['mde_mov_id'] = $mov_id['mov_id'];
                    $mde['mde_igv'] = (isset($mde['mde_igv'])) ? $mde['mde_igv'] : 0 ;
                    unset($mde['mov_conigv']);
                    $mde = $this->mdetalles->insertRegistro($mde); 
                    $mov_id['data']['mov_t12num'] = $mov['mov_tipo'].'-'.date( "m", strtotime($_POST['mov_fechaE'])).str_pad($mov['mov_t12num'],6,'0',STR_PAD_LEFT);
                    
                } 
            } else {
                $b_mov =  $this->movimientos->selectRegistro($_POST['mov_id']);
                $mov = $_POST;
                $mov['mov_tce_id'] = $tce;
                $mov['mov_t12num'] = $b_mov['mov_t12num'];
                $mov['mov_id'] = $b_mov['mov_id'];
                $mov['mov_alm_id'] = $_SESSION['alm']['alm_id'];
                $mov['mov_tipo'] = (isset($mov['mov_tipo']))?$mov['mov_tipo']:$_SESSION['mov']['mov_tipo'];
                $mov['mov_fechaR'] = $_POST['mov_fechaE'];
                $mov['mov_fechaV'] = $_POST['mov_fechaE'];
                $mov['mov_gus_id'] = $_SESSION['gus']['gus_id'];
                $mov_id = $this->movimientos->updateRegistro($mov,array('mov_serie','mov_numero','mov_alm_id','mov_tipo')); 

                $b_mde = $this->mdetalles->selectRegistros(array('mde_mov_id'=>$_POST['mov_id']),array('mde_mov_id'));
                foreach ($b_mde as $i => $b_md) {
                    $status = true;
                    foreach ($arrMde as $i => $md) {
                        if (isset($md['mov_id'])) {
                            if($md['mov_id']==$b_md['mov_id']) {
                                $status = false;
                            }
                        }
                    }
                    if($status){
                        $del = $this->mdetalles->deleteRegistro($b_md['mde_id']);
                    }
                }
                foreach ($arrMde as $i => $mde){ 
                    if (!is_null($mde)) {
                        unset($mde['mde_mes']);
                        unset($mde['mde_f_bie_id']);
                        $mde['mde_bie_id'] = $mde['mde_bie_id']['bie_id'];
                        $mde['mde_t6m_id'] = $mde['mde_t6m_id']['t6m_id'];
                        $mde['mde_gta_id'] = $mde['mde_gta_id']['gta_id'];
                        $mde['mde_mov_id'] = $mov['mov_id'];
                        $mde['mde_igv'] = (isset($mde['mde_igv'])) ? $mde['mde_igv'] : 0 ;
                        if (!isset($mde['aat_id'])) {
                            $mde = $this->mdetalles->insertRegistro($mde);
                        } else {
                            $mde = $this->mdetalles->updateRegistro($mde);
                        }
                    }
                    $mov_id['data']['mov_t12num'] = $mov['mov_tipo'].'-'.date( "m", strtotime($_POST['mov_fechaE'])).str_pad($mov['mov_t12num'],6,'0',STR_PAD_LEFT);
                    
                } 
            }
            if (!empty($data)) {
                return $mov_id;
            }else{
                echo json_encode($mov_id,JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function setMovimientoTI(){
        if ($_POST) {
            $base = $_POST;
            $base2 = $_POST;
            if (intval($_POST['mov_id'])==0) {
                $base['mov_mde_id'] = json_decode($base['mov_mde_id'],true);
                foreach ($base['mov_mde_id'] as $i => $mde) {
                    $base['mov_mde_id'][$i]['mde_bie_id']['bie_id'] = $mde['mde_f_bie_id']['bie_id'];
                }
                $base['mov_mde_id'] = json_encode($base['mov_mde_id'],JSON_UNESCAPED_UNICODE);
                $base['mov_tipo'] = 2;
                $base['mov_alm_id'] = $_SESSION['alm']['alm_id'];
                $base['mov_t12_id'] = 18;
                $base['mov_t10_id'] = 1;
                $mov2= $this->setMovimiento($base);
                $base2['mov_mov_id'] = $mov2['mov_id'];
                $mov1 = $this->setMovimiento($base2);
            } else {  //update
                $base['mov_mde_id'] = json_decode($base['mov_mde_id'],true);
                foreach ($base['mov_mde_id'] as $i => $mde) {
                    $base['mov_mde_id'][$i]['mde_bie_id']['bie_id'] = $mde['mde_f_bie_id']['bie_id'];
                }
                $set = $this->movimientos->searchRegistro(array('mov_id'=>$base['mov_id']),'mov_mov_id')['mov_mov_id'];
                $base['mov_id'] = $set;
                $base['mov_mde_id'] = json_encode($base['mov_mde_id'],JSON_UNESCAPED_UNICODE);
                $base['mov_tipo'] = 2;
                $base['mov_alm_id'] = $_SESSION['alm']['alm_id'];
                $base['mov_t12_id'] = 18;
                $base['mov_t10_id'] = 1;
                $mov2= $this->setMovimiento($base);
                $base2['mov_mov_id'] = $set; 
                $mov1 = $this->setMovimiento($base2);
            }
            

        }
        echo json_encode($mov1,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setMovimientoTA(){
        if ($_POST) {
            $base = $_POST;
            unset($_POST['mov_d_alm_id']);
            $mov1 = $this->setMovimiento($_POST);
            $base['mov_tipo'] = 2;
            $base['mov_mov_id'] = $mov1['mov_id'];
            $base['mov_alm_id'] = $base['mov_d_alm_id'];
            unset($base['mov_d_alm_id']);
            $mov2= $this->setMovimiento($base);
        }
        echo json_encode($mov2,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function delMovimiento(){
        if (!empty($_POST['mov_id'])) {
            $mov = $this->movimientos->deleteRegistro($_POST['mov_id']);
            if ($mov) {
                $arrResponse = array('status'=>true,'msg'=>'ok','data'=>$mov);
            } else {
                $arrResponse = array('status'=>false,'msg'=>'No se pudo eliminar el Movimiento');
            }
        }else {
            $arrResponse = array('status'=>true,'msg'=>'No se puede procesar el ID');
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getMovimiento($mov_id,$return = false) {     
        $mov = $this->movimientos->selectRegistro($mov_id);
        $mov['mov_mde_id'] = $this->mdetalles->selectRegistros(array('mde_mov_id'=>$mov_id),array('mde_mov_id')); 
        if (!empty($mov['mov_age_id'])) {
            $age = $mov['mov_age_id'];
            if (!empty($mov['mov_age_id']['age_gem_id'])) {
                $mov['mov_age_id']['age_ide'] =         $age['age_gem_id']['gem_ruc'];
                $mov['mov_age_id']['age_nombre'] =      $age['age_gem_id']['gem_razonsocial'];
                $mov['mov_age_id']['age_direccion'] =   $age['age_gem_id']['gem_direccion'];
                $mov['mov_age_id']['age_email'] =       $age['age_gem_id']['gem_email'];
                $mov['mov_age_id']['age_gdi_id'] =      $age['age_gem_id']['gem_gdi_id'];
                $mov['mov_age_id']['age_gt2_id'] =      $this->t2identidades->selectRegistro(4);
            } else {
                $mov['mov_age_id']['age_ide'] =         $age['age_gpe_id']['gpe_identificacion'];
                $mov['mov_age_id']['age_nombre'] =      $age['age_gpe_id']['gpe_nombre'].' - '.$age['age_gpe_id']['gpe_apellidos'];
                $mov['mov_age_id']['age_apellidos'] =   $age['age_gpe_id']['gpe_apellidos'];
                $mov['mov_age_id']['age_direccion'] =   $age['age_gpe_id']['gpe_direccion'];
                $mov['mov_age_id']['age_email'] =       $age['age_gpe_id']['gpe_email'];
                $mov['mov_age_id']['age_gdi_id'] =      $age['age_gpe_id']['gpe_gdi_id'];
                $mov['mov_age_id']['age_gt2_id'] =      $age['age_gpe_id']['gpe_gt2_id'];
            }
        }
        if (!empty($mov)) {
            if ($mov['mov_t12_id']['t12_id'] == 18 && $mov['mov_tipo'] == 1) { 
                $mov_mov_id = $this->getMovimiento(intval($mov['mov_mov_id']),true);
                foreach ($mov_mov_id['data']['mov_mde_id'] as $i => $mde) {
                    $mov['mov_mde_id'][$i]['mde_f_bie_id'] = $mde['mde_bie_id'];
                }
            }
            $response = array('status'=>true,'msg'=>'ok','data'=>$mov);
        } else {
            $response = array('status'=>false,'msg'=>'Movimiento no Encontrado','data'=>$mov);
        }
        if ($return) {
            return $response;
        }else{
            echo json_encode($response,JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function getView($mov_id){
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $mov = $this->getMovimiento($mov_id,true);
        $data['mov'] = ($mov['status']) ? $mov['data'] : null;
        ob_end_clean();   //
        if ($_SESSION['gcl']['gcl_gem_id']['gem_ruc'] == '20605355570' && ($data['mov']['mov_t10_id']['t10_id'] == 49 || $data['mov']['mov_t10_id']['t10_id'] == 50)) {
            $html = getFile("Movimientos/formatoNotasES",$data);
        } else {
            $html = getFile("Movimientos/view",$data);
        }
        if ($data['mov']['mov_tipo']=='02') {
            $title = 'DOC. ENTRADA     -     '.$data['mov']['mov_t12_id']['t12_descripcion'].'     -     '.strtoupper($data['mov']['mov_t10_id']['t10_descripcion']);
        }
        if ($data['mov']['mov_tipo']=='01') {
            $title = 'DOC. SALIDA     -      '.$data['mov']['mov_t12_id']['t12_descripcion'].'     -       '.strtoupper($data['mov']['mov_t10_id']['t10_descripcion']);
        }
        $arrResponse = array("status" => true, "title"=>$title ,"data" => $html);
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getPdf($mov_id){
        ob_end_clean();
        $result = Endroid\QrCode\Builder\Builder::create()
            ->writer(new Endroid\QrCode\Writer\PngWriter())
            ->writerOptions([])
            ->data(base_url().'/Movimientos/getPdf/'.$mov_id.'?gcl_id='.$_SESSION['gcl']['gcl_id'])
            ->encoding(new Endroid\QrCode\Encoding\Encoding('UTF-8'))
            ->errorCorrectionLevel(new Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh())
            ->size(100)
            ->margin(1)
            ->roundBlockSizeMode(new Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin())
            ->labelText('DOC. Vitual')
            ->labelFont(new Endroid\QrCode\Label\Font\NotoSans(11))
            ->labelAlignment(new Endroid\QrCode\Label\Alignment\LabelAlignmentCenter())
            ->validateResult(false)
            ->build();
        $web = Endroid\QrCode\Builder\Builder::create()
            ->writer(new Endroid\QrCode\Writer\PngWriter())
            ->writerOptions([])
            ->data('https://companycacel.com/')
            ->encoding(new Endroid\QrCode\Encoding\Encoding('UTF-8'))
            ->errorCorrectionLevel(new Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh())
            ->size(100)
            ->margin(1)
            ->roundBlockSizeMode(new Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin())
            ->labelText('Pagina Web')
            ->labelFont(new Endroid\QrCode\Label\Font\NotoSans(11))
            ->labelAlignment(new Endroid\QrCode\Label\Alignment\LabelAlignmentCenter())
            ->validateResult(false)
            ->build();
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $data['mov'] = $this->getMovimiento($mov_id,true)['data'];
        $data['mov']['mov_letras_pen'] = $this->formatter->toInvoice($data['mov']['mov_total'], 2, "SOLES");
        $data['mov']['mov_qr'] = $result->getDataUri();
        $data['mov']['mov_qr_web'] = $web->getDataUri();
        $html = getFile("Movimientos/pdf",$data);
        $html2pdf = new Spipu\Html2Pdf\Html2Pdf('p','A4','es','true','UTF-8');
        $html2pdf->pdf->setTitle($data['mov']['mov_serie'].'-'.str_pad($data['mov']['mov_numero'],8,0,STR_PAD_LEFT));
        $html2pdf->writeHTML($html);
        $html2pdf->output('comprobante-'.$mov_id.'.pdf');   

        // $dompdf = new Dompdf\Dompdf();
        // ob_end_clean();
        // $options = new Dompdf\Options();
        // $options->set(array('isRemoteEnabled'=>true));
        // $dompdf->setOptions($options);
        // $html = getFile("Movimientos/view",$data);
        // $dompdf->loadHtml($html);
        // $dompdf->setPaper('A4');
        // $dompdf->render();
        // $dompdf->stream('my.pdf',array('Attachment'=>0));
        die();
    }

}