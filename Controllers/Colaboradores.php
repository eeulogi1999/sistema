<?php 
@ob_start();
class Colaboradores extends Controllers{
    public function __construct(){
        parent::__construct(strtolower(get_class($this))); 
    }
    public function Colaboradores(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        } 
        $data['page_tag'] = 'Personales';
        $data['page_title'] = 'Personales';
        $data['page_name'] = 'Personales';
        $data['page_data'] = array('col'=>array());
        $data['page_functions_js'] = array("functions_colaboradores.js","functions_personas.js","functions_areas.js");
        $this->views->getView($this,strtolower(get_class($this)),$data);
    }
    public function getColaboradores(){
        $arrData = $this->{strtolower(get_class($this))}->selectRegistros();
        for ($i=0; $i < count($arrData); $i++) {
                $btnView = '';
                $btnEdit = '';
                $btnDelete = '';
                $arrData[$i]['col_nro'] = $i+1;
                $arrData[$i]['col_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i]['col_status']]].'">'.array_keys(STATUS)[$arrData[$i]['col_status']].'</span>';
                if($_SESSION['perMod']['gtp_r']){
                    $btnView = '<button class="btn btn-info btn-sm" onClick="view('."'col',".$arrData[$i]['col_id'].')" title="Ver '.get_class($this).'"><i class="far fa-eye"></i></button>';
                }
                if($_SESSION['perMod']['gtp_u']){
                    $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'col',".$arrData[$i]['col_id'].')" title="Editar '.get_class($this).'"><i class="fas fa-pencil-alt"></i></button>';
                }
                if($_SESSION['perMod']['gtp_d']){	
                    $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'col',".$arrData[$i]['col_id'].')" title="Eliminar '.get_class($this).'"><i class="far fa-trash-alt"></i></button>';
                }
                $arrData[$i]['col_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }    
}
?>