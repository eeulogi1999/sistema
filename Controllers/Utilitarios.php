<?php 
@ob_start();
class Utilitarios extends Controllers{ 
    public function __construct(){
        parent::__construct('departamentos');
        $this->newModel('departamentos');
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
        $inv = $this->curlGet('https://es.investing.com/commodities/copper?cid=959211');
        libxml_use_internal_errors(true);
        $cu1 = $this->Html2array->getElemetByQuery($inv,'instrument-price-last');

        $lme = $this->curlGet('https://www.lme.com/api/trading-data/fifteen-minutes-metal-block?datasourceIds=48b1eb21-2c1c-4606-a031-2e0e48804557');
        $lme = json_decode($lme,true);
        $cu2 = $lme[0]['Data'][array_key_last($lme[0]['Data'])]['Value'];

        $exp = $this->curlGet('https://www.expansion.com/mercados/cotizaciones/materias/cobre(londres)_MCU.html');
        libxml_use_internal_errors(true);
        $cu3 = $this->Html2array->getElemetByQueryExp($exp);
        $bie = array('CO'=>'COBRE','BR'=>'BRONCE','PB'=>'PLOMO','AL'=>'ALUMINIO');
        $res[0] = array('ten_bie'=>'COBRE','ten_inv'=>$cu1 ,'ten_lme'=>$cu2,'ten_exp'=>$cu3,'ten_options'=>'');
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
        die();
    }

}
?>