<?php 

@ob_start();
class Personas extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this)));
    }
    public function Personas(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Personas";
        $data['page_title'] = "Personas";
        $data['page_name'] = "personas";
        $data['page_data'] = array();
        $data['page_functions_js'] = "funtions_personas.js";
        $this->views->getView($this,"personas",$data);
    }
    public function getNumPersona(){
        $gpe_num = $this->personas->searchRegistro($_POST,"MAX(gpe_identificacion) as 'next'")['next'];
        $arrData = array('age_num'=>str_pad($gpe_num+1,8,0,STR_PAD_LEFT));
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
}

?>