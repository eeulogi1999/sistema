<?php 
@ob_start();
class Ppagos extends Controllers{
    public function __construct(){
        parent::__construct('ppagos');   
        $this->newModel('colaboradores'); 
        $this->newModel('personas'); 
        getPermisos(4);
    }
    public function Ppagos(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Pago Planillas";
        $data['page_title'] = "Pago Planillas ";
        $data['page_name'] = "Pago Planillas";
        $data['page_data'] = array('ppa_tipo'=>PPA_TIPO,
        'ppa'=>array('ppa_gus_id'=>$_SESSION['gus']['gus_id']),
        'caj'=>array('caj_tipo'=>3,'caj_numero'=>6,'caj_tga_id'=>10),
        'asi'=>array('asi_week'=>$_SESSION['asi']['asi_week']));
        $data['page_functions_js'] = array("functions_ppagos.js");
        $this->views->getView($this,"ppagos",$data);
    }
}