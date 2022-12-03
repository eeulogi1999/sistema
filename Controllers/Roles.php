<?php 
@ob_start();
class Roles extends Controllers{
    public function __construct(){
        parent::__construct('roles');   
        if(empty($_SESSION['login'])){
            header('Location: '.base_url().'/login');
            die();
        }
        getPermisos(1);
    }
    public function Roles(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Roles";
        $data['page_title'] = "Roles ";
        $data['page_name'] = "Roles";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_roles.js");
        $this->views->getView($this,"roles",$data);
    }
}