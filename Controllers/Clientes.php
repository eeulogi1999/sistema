<?php 
@ob_start();
class Clientes extends Controllers{
    public function __construct(){
        parent::__construct('clientes');   

    }
    public function Clientes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Clientes";
        $data['page_title'] = "Clientes ";
        $data['page_name'] = "Clientes";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_clientes.js","functions_empresas.js");
        $this->views->getView($this,"clientes",$data);
    }
}
?>