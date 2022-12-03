<?php 
@ob_start();
class Almacenes extends Controllers{
    public function __construct(){
        parent::__construct('almacenes');   
        getPermisos(4);
    }
    public function Almacenes(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Almacenes";
        $data['page_title'] = "Almacenes ";
        $data['page_name'] = "almacenes";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_almacenes.js");
        $this->views->getView($this,"almacenes",$data);
    }
}