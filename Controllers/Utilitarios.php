<?php 
@ob_start();
class Utilitarios extends Controllers{ 
    public function __construct(){
        parent::__construct('departamentos');
        $this->newModel('departamentos');
        $this->newModel('tendencias');
        $this->newModel('bienes');
        $this->customModel('Html2array');
    }
    public function Utilitarios(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Utilitarios";
        $data['page_title'] = "Utilitarios";
        $data['page_name'] = "Utilitarios";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_utilitarios.js");
        $this->views->getView($this,"utilitarios",$data);
    }
    public function Tendencias(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Tendencias";
        $data['page_title'] = "Tendencias";
        $data['page_name'] = "Tendencias";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_tendencias.js");
        $this->views->getView($this,"tendencias",$data);
    }
    public function Tbienes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Materiales";
        $data['page_title'] = "Materiales";
        $data['page_name'] = "Materiales";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_tendencias.js");
        $this->views->getView($this,"tbienes",$data);
    }
    public function curlGet($url){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }
    public function getTendencias(){
        $bie_ = array('CO'=>'COBRE','PB'=>'PLOMO','AL'=>'ALUMINIO');
        libxml_use_internal_errors(true);
        $inv_ = array('PRE'=>'https://es.investing.com/commodities/','CO'=>'copper?cid=959211','PB'=>'lead?cid=959207','AL'=>'aluminum');
        $lme_ = array('PRE'=>'https://www.lme.com/api/trading-data/metal-block?datasourceIds=','CO'=>'fc09fcde-6438-4834-9221-98da9ed54eea','PB'=>null,'AL'=>'1b72897c-6a30-480c-a74a-cfc2faaaff16');
        $exp_ = array('PRE'=>'https://www.expansion.com/mercados/cotizaciones/materias/','CO'=>'cobre(londres)_MCU.html','PB'=>'plomo(londres)_MPB.html','AL'=>'aluminio(londres)_MAL.html');
        $response = array();
        foreach ($bie_ as $i => $d) {
            $res['ten_bie'] = $d;
            $inv = $this->curlGet($inv_['PRE'].$inv_[$i]);
            $cu1 = $this->Html2array->getElemetByQuery($inv,'instrument-price-last');
            $res['ten_inv'] = floatval(str_replace(',', '.', str_replace('.', '', $cu1)));
            if (!empty($lme_[$i])) {
                $lme = $this->curlGet($lme_['PRE'].$lme_[$i]);
                $lme = json_decode($lme,true);
                $res['ten_lme'] =  $lme[0]['Value'];
            }else {
                $res['ten_lme'] = 0;
            }

            $exp = $this->curlGet($exp_['PRE'].$exp_[$i]);
            $cu3 = $this->Html2array->getElemetByQueryExp($exp);
            $res['ten_exp'] = floatval(str_replace(',', '.', str_replace('.', '', $cu3)));

            $res['ten_opt'] = '';
            array_push($response,$res);
            
        }
        echo json_encode($response,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setTendencias(){
        $bie_ = array('CO'=>'COBRE','PB'=>'PLOMO','AL'=>'ALUMINIO');
        libxml_use_internal_errors(true);
        $inv_ = array('PRE'=>'https://es.investing.com/commodities/','CO'=>'copper?cid=959211','PB'=>'lead?cid=959207','AL'=>'aluminum');
        $lme_ = array('PRE'=>'https://www.lme.com/api/trading-data/metal-block?datasourceIds=','CO'=>'fc09fcde-6438-4834-9221-98da9ed54eea','PB'=>null,'AL'=>'1b72897c-6a30-480c-a74a-cfc2faaaff16');
        $exp_ = array('PRE'=>'https://www.expansion.com/mercados/cotizaciones/materias/','CO'=>'cobre(londres)_MCU.html','PB'=>'plomo(londres)_MPB.html','AL'=>'aluminio(londres)_MAL.html');
        foreach ($bie_ as $i => $d) {
            $res['ten_bie'] = $d;
            $inv = $this->curlGet($inv_['PRE'].$inv_[$i]);
            $cu1 = $this->Html2array->getElemetByQuery($inv,'instrument-price-last');
            $cu1 = floatval(str_replace(',', '.', str_replace('.', '', $cu1)));
            if (!empty($lme_[$i])) {
                $lme = $this->curlGet($lme_['PRE'].$lme_[$i]);
                $lme = json_decode($lme,true);
                $cu2 =  $lme[0]['Value'];
            }
            $exp = $this->curlGet($exp_['PRE'].$exp_[$i]);
            $cu3 = $this->Html2array->getElemetByQueryExp($exp);
            $cu3 = floatval(str_replace(',', '.', str_replace('.', '', $cu3)));
            $this->tendencias->insertRegistro(array('ten_cbien'=>$i,'ten_fecha'=>date('Y-m-d H:i:s'),'ten_origen'=>1,'ten_valor'=>$cu1));
            if (!empty($lme_[$i])) {
                $this->tendencias->insertRegistro(array('ten_cbien'=>$i,'ten_fecha'=>date('Y-m-d H:i:s'),'ten_origen'=>2,'ten_valor'=>$cu2));
            }
            $this->tendencias->insertRegistro(array('ten_cbien'=>$i,'ten_fecha'=>date('Y-m-d H:i:s'),'ten_origen'=>3,'ten_valor'=>$cu3));
        }
        return true;
    }
    public function getBienesPorc(){
        $bie_ = array('CO'=>'COBRE','PB'=>'PLOMO','AL'=>'ALUMINIO');
        libxml_use_internal_errors(true);
        $inv_ = array('PRE'=>'https://es.investing.com/commodities/','CO'=>'copper?cid=959211','PB'=>'lead?cid=959207','AL'=>'aluminum');
        $lme_ = array('PRE'=>'https://www.lme.com/api/trading-data/metal-block?datasourceIds=','CO'=>'fc09fcde-6438-4834-9221-98da9ed54eea','PB'=>null,'AL'=>'1b72897c-6a30-480c-a74a-cfc2faaaff16');
        $exp_ = array('PRE'=>'https://www.expansion.com/mercados/cotizaciones/materias/','CO'=>'cobre(londres)_MCU.html','PB'=>'plomo(londres)_MPB.html','AL'=>'aluminio(londres)_MAL.html');
        $ten = array();
        foreach ($bie_ as $i => $d) {
            $res['ten_bie'] = $d;
            $inv = $this->curlGet($inv_['PRE'].$inv_[$i]);
            $cu1 = $this->Html2array->getElemetByQuery($inv,'instrument-price-last');
            $cu1 = floatval(str_replace(',', '.', str_replace('.', '', $cu1)));

            $exp = $this->curlGet($exp_['PRE'].$exp_[$i]);
            $cu3 = $this->Html2array->getElemetByQueryExp($exp);
            $cu3 = floatval(str_replace(',', '.', str_replace('.', '', $cu3)));

            if (!empty($lme_[$i])) {
                $lme = $this->curlGet($lme_['PRE'].$lme_[$i]);
                $lme = json_decode($lme,true);
                $cu2 =  floatval($lme[0]['Value']);
                $ten[$i] = ($cu1+$cu2+$cu3)/3;
            }else{
                $ten[$i] = ($cu1+$cu3)/2;
            }

        }
        $arrData = $this->bienes->selectRegistros();
        foreach ($arrData as $i => $d) {
            $arrData[$i]['bie_ten'] =  isset($ten[substr($d['bie_codigo'],0,2)])?$ten[substr($d['bie_codigo'],0,2)]:0;
            // $arrData[$i]['bie_ten'] =  isset($ten[substr($d['bie_codigo'],0,2)])?$ten[substr($d['bie_codigo'],0,2)]:0;
            $arrData[$i]['bie_porc'] =  '<input type="text" value="'.$d['bie_porc'].'" size="4" onChange="setPor('.$d['bie_porc'].',event)">';
            $arrData[$i]['bie_base'] =  ($arrData[$i]['bie_ten']>0)?$arrData[$i]['bie_ten']*($d['bie_porc']/100):0;
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }

}
?>