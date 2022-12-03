<?php 
@ob_start();
require 'Libraries/html2pdf/vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;
require 'Libraries/numero2letras/vendor/autoload.php';
use Luecano\NumeroALetras\NumeroALetras;
require 'Libraries/qr-code/vendor/autoload.php';
use Endroid\QrCode\QrCode;
class Comprobantes extends Controllers{ 
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));  //tabla de la BD con el cual iniciara! 
        $this->newModel('mespecificaciones');   //nombre de la tabla
        $this->newModel('cdetalles');           //nombre de la tabla
        $this->newModel('agentes');
        $this->newModel('empresas');
        $this->newModel('personas');
        $this->newModel('preliminares');
        $this->newModel('cespecificaciones');
        $this->newModel('tcambios');
        $this->newModel('establecimientos');
        $this->newModel('t12operaciones');
        $this->newModel('t10comprobantes');
        $this->newModel('t2identidades');
        $this->customModel('TcambiosModel');    //modelo perzonalizado!
        $this->formatter = new NumeroALetras();
        getPermisos(1);  
    }

    public function Comprobantes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        switch ($_GET['url']) {
            case 'facturas':
                $_SESSION['com']['t10'] = $this->t10comprobantes->selectRegistro(2); 
                $_SESSION['com']['t10']['l_serie'] = 'F'; 
                break;
            case 'boletas':
                $_SESSION['com']['t10'] = $this->t10comprobantes->selectRegistro(4); 
                $_SESSION['com']['t10']['l_serie'] = 'B'; 
                break; 
            case 'creditos':
                $_SESSION['com']['t10'] = $this->t10comprobantes->selectRegistro(8); 
                $_SESSION['com']['t10']['l_serie'] = 'C'; 
                break;  
            case 'debitos':
                $_SESSION['com']['t10'] = $this->t10comprobantes->selectRegistro(9); 
                $_SESSION['com']['t10']['l_serie'] = 'D'; 
                break;
            default:
                header("Location:".base_url().'/dashboard');
                break;
        }
        $_SESSION['com']['t12'] = $this->t12operaciones->selectRegistro(1);
        $data['estData'] = $this->establecimientos->selectRegistros();  
        $data['com'] = $_SESSION['com'];
        $data['gcl'] = $_SESSION['gcl'];
        $data['est'] = $_SESSION['est'];
        $data['page_tag'] = ucfirst($_SESSION['com']['t10']['t10_descripcion']);
        $data['page_title'] = ucfirst($_SESSION['com']['t10']['t10_descripcion']);
        $data['page_name'] = $_SESSION['com']['t10']['t10_descripcion'];
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_comprobantes.js","functions_bienes.js");
        $this->views->getView($this,"comprobantes",$data); 
    }

    public function getNumComprobante(){
        $com_serie = $_SESSION['com']['t10']['l_serie'].str_pad($_SESSION['est']['est_serie'],3,0,STR_PAD_LEFT);
        $com = array();
        $com['com_est_id'] = $_SESSION['est']['est_id'];
        $com['com_t12_id'] = $_SESSION['com']['t12']['t12_id'];
        $com['com_t10_id'] = $_SESSION['com']['t10']['t10_id'];
        $com_numero = $this->comprobantes->searchRegistro($com,"MAX(com_numero) as 'next'")['next'];
        $arrData = array('com_serie'=>$com_serie,'com_numero'=>str_pad($com_numero+1,8,0,STR_PAD_LEFT));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }

    public function getComprobantes(){
        $arrData = $this->comprobantes->selectRegistros(array('com_est_id'=>$_SESSION['est']['est_id'],'com_t10_id'=>$_SESSION['com']['t10']['t10_id']));
        for ($i=0; $i < count($arrData); $i++) {
            $btnEdit = '';
            $btnDelete = '';
            $btnView = '';
            $btnPdf = '';
            $btnSend = '';
            $arrData[$i]['com_num'] = $i+1;
            $arrData[$i]['com_age_ide'] = (!empty($arrData[$i]['com_age_id']['age_gem_id'])) ? $arrData[$i]['com_age_id']['age_gem_id']['gem_ruc'] : $arrData[$i]['com_age_id']['age_gpe_id']['gpe_identificacion'] ;;
            $arrData[$i]['com_serie'] = $arrData[$i]['com_serie'].'-'.str_pad($arrData[$i]['com_numero'],8,0,STR_PAD_LEFT);
            $arrData[$i]['com_subtotal'] = formatMoney($arrData[$i]['com_subtotal']);
            $arrData[$i]['com_igv'] = formatMoney(json_decode($arrData[$i]['com_igv_id'],true)['com_igv']);
            $arrData[$i]['com_total'] = formatMoney($arrData[$i]['com_total']);
            $disabled = ($arrData[$i]['com_cstatus']!= 1) ? 'disabled' : '' ;
            $arrData[$i]['com_cstatus'] = '<span class="badge badge-'.CSTATUS[$arrData[$i]['com_cstatus']][1].'">'.CSTATUS[$arrData[$i]['com_cstatus']][0].'</span>';
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary btn-sm" onClick="fntEditInfo('.$arrData[$i]['com_id']['pre_id'].')" title="Editar '.$_SESSION['com']['t10']['t10_descripcion'].'"><i class="fas fa-pencil-alt"></i></button>';
                $btnSend = '<button class="btn btn-success btn-sm" onClick="fntSendInfo('.$arrData[$i]['com_id']['pre_id'].')" title="Emitir '.$_SESSION['com']['t10']['t10_descripcion'].'" '.$disabled.'><i class="far fa-paper-plane"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="fntDelInfo('.$arrData[$i]['com_id']['pre_id'].')" title="Eliminar '.$_SESSION['com']['t10']['t10_descripcion'].'"><i class="far fa-trash-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_r']){	
                $btnView = '<a class="btn btn-info btn-sm" href="'.base_url().'/Comprobantes/getView/'.$arrData[$i]['com_id']['pre_id'].'" title="Ver '.$_SESSION['com']['t10']['t10_descripcion'].'" > <i class="far fa-eye"></i> </a>';
                $btnPdf = '<a class="btn btn-danger btn-sm" href="'.base_url().'/Comprobantes/getPdf/'.$arrData[$i]['com_id']['pre_id'].'" target="_blanck" title="Pdf '.$_SESSION['com']['t10']['t10_descripcion'].'" ><i class="far fa-file-pdf"></i></a>';
            }
            $arrData[$i]['com_options'] = '<div class="text-center">'.$btnView.' '.$btnPdf.' '.$btnSend.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }

    public function setComprobante(){
        if ($_POST) { 
            foreach ($_POST as $i => $value) {
                if (is_json($value) && $i != 'com_igv_id' && $i != 'com_ncr_id'){
                    $_POST[$i] = json_decode($value,true);
                }
            }
            if (!isset($_POST['com_age_id']['age_gem_id']['gem_ruc'])) {
                $gem = $this->empresas->insertRegistro($_POST['com_age_id'],array('gem_ruc'));
                $age = $this->agentes->insertRegistro(array('age_gem_id'=>$gem['gem_id'],'age_monto'=>$_POST['com_total']),array('age_gem_id'));
            }else {
                $gpe = $this->personas->insertRegistro($_POST['com_age_id'],array('gpe_identificacion'));
                $age = $this->agentes->insertRegistro(array('age_gpe_id'=>$gpe['gpe_id'],'age_monto'=>$_POST['com_total']),array('age_gpe_id'));
            }
            $gtc_id = $this->TcambiosModel->searchTcambio($_POST['com_fechaE']);
            $pre = $this->preliminares->insertRegistro(array('pre_transaccion' =>0,'pre_exportacion' =>0,'pre_anticipo'=>0));
            $arrCde = $_POST['com_cde_id'];
            unset($_POST['com_cde_id']);
            $com = $_POST;
            $com['com_id'] = $pre['pre_id'];
            $com['com_age_id'] = $age['age_id'];
            $com['com_gtc_id'] = $gtc_id;
            $com['com_est_id'] = $_SESSION['est']['est_id'];
            $com['com_t12_id'] = $_SESSION['com']['t12']['t12_id'];
            $com['com_t10_id'] = $_SESSION['com']['t10']['t10_id'];
            $com['com_t1m_id'] = 9;     //contado
            $com['com_fechaR'] = $_POST['com_fechaE'];
            $com['com_fechaV'] = $_POST['com_fechaE'];
            $com['com_acr_id'] = null;
            $com = $this->comprobantes->insertRegistro($com);   
            foreach ($arrCde as $i => $detalle){ 
                unset($detalle['cde_obj']);
                $detalle['cde_t6m_id'] = $detalle['cde_t6m_id']['t6m_id'];
                $detalle['cde_afectacion'] = $detalle['cde_afectacion']['mde_afectacion_id'];
                $detalle['cde_com_id'] = $com['com_id'];
                $detalle['cde_igv'] = (isset($detalle['cde_conigv'])) ? $detalle['cde_conigv'] : 0 ;
                unset($detalle['com_conigv']);
                $cde = $this->cdetalles->insertRegistro($detalle); 
                foreach ($arrCde[$i]['cde_obj'] as $j => $ces) {
                    unset($ces['tob_id']);
                    $ces['ces_cde_id'] = $cde['cde_id'];
                    $ces['ces_q'] = $detalle['cde_q'];
                    if ($arrCde[$i]['cde_obj'][$j]['tob_id'] == 1) {
                        //unset($ces['ser_nombre']);
                        $ces = $this->cespecificaciones->insertRegistro($ces);
                    } else if ($arrCde[$i]['cde_obj'][$j]['tob_id'] == 2){
                        //unset($ces['ser_nombre']);
                            $ces = $this->cespecificaciones->insertRegistro($ces);
                    }else{
                        unset($ces['ser_id']);
                        $ces['ces_descripcion'] = $ces['ser_nombre'];
                        unset($ces['ser_nombre']);
                        $ces = $this->cespecificaciones->insertRegistro($ces);
                        
                    }
                }
            } 
            echo json_encode($ces,JSON_UNESCAPED_UNICODE); 
        }
        die();
    }
    public function getComprobante($com_id,$return = false) {      
        $com = $this->comprobantes->selectRegistro($com_id);
        $com['com_cde'] = $this->cdetalles->selectRegistros(array('cde_com_id'=>$com_id),array('cde_com_id')); 
        $age = $com['com_age_id'];
        if (!empty($com['com_age_id']['age_gem_id'])) {
            $com['com_age_id']['age_ide'] =         $age['age_gem_id']['gem_ruc'];
            $com['com_age_id']['age_nombre'] =      $age['age_gem_id']['gem_razonsocial'];
            $com['com_age_id']['age_direccion'] =   $age['age_gem_id']['gem_direccion'];
            $com['com_age_id']['age_email'] =       $age['age_gem_id']['gem_email'];
            $com['com_age_id']['age_gdi_id'] =      $age['age_gem_id']['gem_gdi_id'];
            $com['com_age_id']['age_gt2_id'] =      $this->t2identidades->selectRegistro(4);
        } else {
            $com['com_age_id']['age_ide'] =         $age['age_gpe_id']['gpe_identificacion'];
            $com['com_age_id']['age_nombre'] =      $age['age_gpe_id']['gpe_nombre'];
            $com['com_age_id']['age_apellidos'] =   $age['age_gpe_id']['gpe_apellidos'];
            $com['com_age_id']['age_direccion'] =   $age['age_gpe_id']['gpe_direccion'];
            $com['com_age_id']['age_email'] =       $age['age_gpe_id']['gpe_email'];
            $com['com_age_id']['age_gdi_id'] =      $age['age_gpe_id']['gpe_gdi_id'];
            $com['com_age_id']['age_gt2_id'] =      $age['age_gpe_id']['gpe_gt2_id'];
        }
        foreach ($com['com_cde'] as $i => $row) {
            $com['com_cde'][$i]['cde_afectacion'] = TIP[array_search($row['cde_afectacion'], array_column(TIP,'tip_codigo'))];
            $com['com_cde'][$i]['cde_ces_id'] = $this->cespecificaciones->selectRegistros(array('ces_cde_id'=>$row['cde_id']),array('ces_cde_id'));
        }
        if (!empty($com)) {
            $response = array('status'=>true,'msg'=>'ok','data'=>$com);
        } else {
            $response = array('status'=>false,'msg'=>'Comprobante no Encontrado','data'=>$com);
        }
        if ($return) {
            return $response;
        }else{
            echo json_encode($response,JSON_UNESCAPED_UNICODE);
            die();
        }
    }

    public function searchComprobante(){
        $dataTP = explode("-",$_POST['com_serienum']); 
        $where = array();
        $where['com_serie'] = strclean($dataTP[0]); 
        $where['com_numero'] = intval($dataTP[1]);
        $where['com_est_id'] = $_SESSION['est']['est_id'];
        $where['com_t12_id'] = $_SESSION['com']['t12']['t12_id'];
        $arrData = $this->comprobantes->searchRegistro($where);   
        if (!empty($arrData)) {
            $arrResponse = $this->getComprobante($arrData['com_id']['pre_id']);
        } else {
            $arrResponse = array('status' => false, 'msg' => 'No se pudo encontrar datos');
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
        
    }
    public function getView($com_id){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['gcl'] = $_SESSION['gcl'];
        $data['alm'] = $_SESSION['alm'];
        $data['est'] = $_SESSION['est'];
        $data['page_tag'] = "Formato";
        $data['page_title'] = "Formato ";
        $data['page_name'] = "Formato";
        $data['page_data'] = array();
        $arrData = $this->getComprobante($com_id,true);
        $data['com'] = ($arrData['status']) ? $arrData['data'] : null;
        $this->views->getView($this,"view",$data);
    }

    public function getPdf($com_id){
        if(is_numeric($com_id)){
            $arrData = $this->getComprobante($com_id,true);
            if(!$arrData['status']){
                echo "Datos no encontrados";
            }else{
                ob_end_clean();
                $data['gcl'] = $_SESSION['gcl'];
                $data['est'] = $_SESSION['est'];
                $data['com'] = $arrData['data'];
                $data['com']['com_letras_pen'] = $this->formatter->toInvoice($data['com']['com_total'], 2, "SOLES");
                $html = getFile("Comprobantes/comprobantePDF",$data);
                $html2pdf = new Html2Pdf('p','A4','es','true','UTF-8');
                $html2pdf->writeHTML($html);
                $html2pdf->output('factura-'.$com_id.'.pdf');   
            }
        }else{
            echo "Dato no válido";
        }
    }
    public function setEmitir($id){
        
        $bd['gcl'] = $_SESSION['gcl'];
        $bd['alm'] = $_SESSION['alm'];
        $bd['est'] = $_SESSION['est'];
        $bd['com'] = $this->model->selectComprobante($id);      
        $content = file_get_contents(media().'/json/20605347232-01-F001-00000000.json');
        $data = json_decode($content, true);

        $data['Invoice'][0]['ID'][0]['_'] = $bd['com']['com_serie'].'-'.str_pad($bd['com']['com_numero'],8,0,STR_PAD_LEFT); 
        
        $data['Invoice'][0]['IssueDate'][0]['_'] = $bd['com']['com_fechaE'];
        $data['Invoice'][0]['InvoiceTypeCode'][0]['_'] = $bd['com']['com_t10_id']['t10_codigo'];
        $data['Invoice'][0]['InvoiceTypeCode'][0]['listID'] = "0101";
        
        $data['Invoice'][0]['Note'][0]['_'] = $this->formatter->toInvoice($bd['com']['com_total'], 2, "SOLES");
        $data['Invoice'][0]['DocumentCurrencyCode'][0]['_'] = $bd['com']['com_gt4_id']['gt4_sunat'];
        $data['Invoice'][0]['LineCountNumeric'][0]['_'] = count($bd['com']['com_cde']);

        $data['Invoice'][0]['Signature'][0]['SignatoryParty'][0]['PartyIdentification'][0]['ID'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_ruc'];
        $data['Invoice'][0]['Signature'][0]['SignatoryParty'][0]['PartyName'][0]['Name'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_razonsocial'];
        
        $SParty = $data['Invoice'][0]['AccountingSupplierParty'][0]['Party'][0];//
        $SParty['PartyIdentification'][0]['ID'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_ruc'];
        $SParty['PartyIdentification'][0]['ID'][0]['schemeID'] = "6"; //ojo 
        
        $SParty['PartyName'][0]['Name'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_razonsocial'];
        
        $SParty['PartyLegalEntity'][0]['RegistrationName'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_razonsocial'];
        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['ID'][0]['_'] = "".str_pad($bd['gcl']['gcl_gem_id']['gem_gdi_id']['gdi_id'],6,0,STR_PAD_LEFT);

        //$SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CitySubdivisionName'][0]['_'] = "Urbanizacion colocar"; //ubanizacion pendiente 5

        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['AddressTypeCode'][0]['_'] = "0000";
        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CityName'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_gdi_id']['gpr_provincia'];
        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CountrySubentity'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_gdi_id']['gde_departamento'];
        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['District'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_gdi_id']['gdi_distrito'];
        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['AddressLine'][0]['Line'][0]['_'] = $bd['gcl']['gcl_gem_id']['gem_direccion'];
        $SParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['Country'][0]['IdentificationCode'][0]['_']="PE"; //Codigo de pais pendiente
        /* $CParty = $data['Invoice'][0]['AccountingCustomerParty'][0]['Party'][0];// */

        if ($_SESSION['com']['t10']['t10_id']==2 || ($_SESSION['com']['t10']['t10_id']==8 AND $bd['com']['com_serie'][0]=='F')) {
            $CParty = $data['Invoice'][0]['AccountingCustomerParty'][0]['Party'][0];//
            $CParty['PartyIdentification'][0]['ID'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_ruc'];
            $CParty['PartyIdentification'][0]['ID'][0]['schemeID'] = "6";
            $CParty['PartyName'][0]['Name'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_razonsocial'];

            $CParty['PartyLegalEntity'][0]['RegistrationName'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_razonsocial'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['ID'][0]['_'] = "".str_pad($bd['com']['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_id'],6,0,STR_PAD_LEFT);
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['AddressLine'][0]['Line'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_direccion'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CityName'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_gdi_id']['gpr_provincia'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['District'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_gdi_id']['gdi_distrito'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CountrySubentity'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_gdi_id']['gde_departamento'];
            $CParty['Contact'][0]['ElectronicMail'][0]['_'] = $bd['com']['com_age_id']['age_gem_id']['gem_email'];
        }
        if ($_SESSION['com']['t10']['t10_id']==4 || ($_SESSION['com']['t10']['t10_id']==8 AND $bd['com']['com_serie'][0]=='B')) {
            $CParty = $data['Invoice'][0]['AccountingCustomerParty'][0]['Party'][0];//
            $CParty['PartyIdentification'][0]['ID'][0]['_'] = $bd['com']['com_age_id']['age_gpe_id']['gpe_identificacion']; //Pendiente dirigirse a la tabla persona gpe_identificacion
            
            

            $CParty['PartyIdentification'][0]['ID'][0]['schemeID'] = "1"; //DNI catalogo 06 
            $CParty['PartyName'][0]['Name'][0]['_'] = "".$bd['com']['com_age_id']['age_gpe_id']['gpe_nombre']." ".$bd['com']['com_age_id']['age_gpe_id']['gpe_apellidos'];

            $CParty['PartyLegalEntity'][0]['RegistrationName'][0]['_'] = "".$bd['com']['com_age_id']['age_gpe_id']['gpe_nombre']." ".$bd['com']['com_age_id']['age_gpe_id']['gpe_apellidos'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['ID'][0]['_'] = "".str_pad($bd['com']['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_id'],6,0,STR_PAD_LEFT);
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CityName'][0]['_'] = $bd['com']['com_age_id']['age_gpe_id']['gpe_gdi_id']['gpr_provincia'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['CountrySubentity'][0]['_'] = $bd['com']['com_age_id']['age_gpe_id']['gpe_gdi_id']['gde_departamento'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['District'][0]['_'] = $bd['com']['com_age_id']['age_gpe_id']['gpe_gdi_id']['gdi_distrito'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['AddressLine'][0]['Line'][0]['_'] = $bd['com']['com_age_id']['age_gpe_id']['gpe_direccion'];
            $CParty['PartyLegalEntity'][0]['RegistrationAddress'][0]['Country'][0]['IdentificationCode'][0]['_'] = "PE";
            
            $CParty['Contact'][0]['ElectronicMail'][0]['_'] = $bd['com']['com_age_id']['age_gpe_id']['gpe_email']; //Correo de la persona no de la empresa ruta revisar
        }
        
        $InvoiceLine = $data['Invoice'][0]['InvoiceLine'][0];

        for ($i = 0; $i < count($bd['com']['com_cde']);$i++) {
            $cde = $bd['com']['com_cde'][$i];
            $InvoiceLine['ID'][0]['_'] = strval($i+1);
            $InvoiceLine['InvoicedQuantity'][0]['_'] = "".number_format($cde['cde_q'], 2,'.','');
            $InvoiceLine['InvoicedQuantity'][0]['unitCode'] = $cde['cde_t6m_id']['t6m_sunat'];
            $InvoiceLine['Item'][0]['SellersItemIdentification'][0]['ID'][0]['_'] = 'C'.str_pad($InvoiceLine['ID'][0]['_'],3,0,STR_PAD_LEFT);
            $InvoiceLine['Item'][0]['Description'][0]['_'] = $cde['cde_ces'][0]['ces_descripcion'];
            $InvoiceLine['Price'][0]['PriceAmount'][0]['_'] = "".number_format($cde['cde_vu'], 2,'.','') ;
            $InvoiceLine['PricingReference'][0]['AlternativeConditionPrice'][0]['PriceAmount'][0]['_'] =  "".number_format($cde['cde_vu']*1.18,2,'.','');
            $InvoiceLine['TaxTotal'][0]['TaxAmount'][0]['_'] = "".number_format($cde['cde_importe']*0.18, 2,'.','') ;
            $InvoiceLine['TaxTotal'][0]['TaxSubtotal'][0]['TaxableAmount'][0]['_'] = "".number_format($cde['cde_importe'], 2,'.','') ;
            $InvoiceLine['TaxTotal'][0]['TaxSubtotal'][0]['TaxAmount'][0]['_'] = "".number_format($cde['cde_importe']*0.18, 2,'.','') ;
            $InvoiceLine['TaxTotal'][0]['TaxSubtotal'][0]['TaxCategory'][0]['Percent'][0]['_'] = 18;
            $InvoiceLine['TaxTotal'][0]['TaxSubtotal'][0]['TaxCategory'][0]['TaxExemptionReasonCode'][0]['_'] = '10';
            $InvoiceLine['TaxTotal'][0]['TaxSubtotal'][0]['TaxCategory'][0]['TaxScheme'][0]['ID'][0]['_'] = '1000';
            $InvoiceLine['LineExtensionAmount'][0]['_'] =  "".number_format($cde['cde_importe'], 2,'.','') ;
            $InvoiceLine['LineExtensionAmount'][0]['currencyID'] = 'PEN';
            $data['Invoice'][0]['InvoiceLine'][$i] =  $InvoiceLine;
        }
        $data['Invoice'][0]['TaxTotal'][0]['TaxAmount'][0]['_'] = "".number_format($bd['com']['com_igv_id']['com_igv'], 2,'.','') ;
        $data['Invoice'][0]['TaxTotal'][0]['TaxSubtotal'][0]['TaxableAmount'][0]['_'] = "".number_format($bd['com']['com_igv_id']['com_gravada'],2,'.','');
        $data['Invoice'][0]['TaxTotal'][0]['TaxSubtotal'][0]['TaxAmount'][0]['_'] = "".number_format($bd['com']['com_igv_id']['com_igv'], 2,'.','') ;
        $data['Invoice'][0]['TaxTotal'][0]['TaxSubtotal'][0]['TaxCategory'][0]['TaxScheme'][0]['ID'][0]['_'] = '1000';
        $data['Invoice'][0]['TaxTotal'][0]['TaxSubtotal'][0]['TaxCategory'][0]['TaxScheme'][0]['Name'][0]['_'] = 'IGV';
        $data['Invoice'][0]['TaxTotal'][0]['TaxSubtotal'][0]['TaxCategory'][0]['TaxScheme'][0]['TaxTypeCode'][0]['_'] = 'VAT';
        
        $LegalMonetaryTotal = $data['Invoice'][0]['LegalMonetaryTotal'][0];//
         
        $LegalMonetaryTotal['LineExtensionAmount'][0]['_'] = "".number_format($bd['com']['com_subtotal'], 2,'.','');
        $LegalMonetaryTotal['TaxInclusiveAmount'][0]['_'] = "".number_format($bd['com']['com_total'], 2,'.','');
        $LegalMonetaryTotal['PayableAmount'][0]['_'] = "".number_format($bd['com']['com_total'], 2,'.','');
        if($_SESSION['com']['t10']['t10_id']==2){
            $PaymentTerms = $data['Invoice'][0]['PaymentTerms'][0];//
            $PaymentTerms['ID'][0]['_'] = 'FormaPago';
            $PaymentTerms['PaymentMeansID'][0]['_'] = 'Contado';
        }
        $data['Invoice'][0]['AccountingSupplierParty'][0]['Party'][0] = $SParty;
        $data['Invoice'][0]['AccountingCustomerParty'][0]['Party'][0] = $CParty;
            
        $data['Invoice'][0]['LegalMonetaryTotal'][0] = $LegalMonetaryTotal;
        if($_SESSION['com']['t10']['t10_id']==2){
            $data['Invoice'][0]['PaymentTerms'][0] = $PaymentTerms;
        }
        
        $dataf = json_encode($data,true);
        
        $arrToken = gettokens();
        sleep(1);
        $arrDoc = document($arrToken['access_token'],'20605347232-'.$_SESSION['com']['t10']['t10_codigo'].'-'.$data['Invoice'][0]['ID'][0]['_'].'.json',$dataf);
        sleep(1);
        if ($arrDoc['code']=='0') {
            $arrCDR = curlEfactGet(URLEFACT['cdr'],$arrToken['access_token'],$arrDoc['description']);
            if ($arrCDR['status']) {
                $this->model->updateCStatus($bd['com']['com_id'],5);
            }else {
                $this->model->updateCStatus($bd['com']['com_id'],4);
            }
            $arrCDR['com_comprobante'] = $data['Invoice'][0]['ID'][0]['_'];
            $arrResponse = $arrCDR;
        }else {
            $this->model->updateCStatus($bd['com']['com_id'],4);
            $arrResponse = $arrDoc;
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE); 
        die();
    }
    

}
?>