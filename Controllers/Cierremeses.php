<?php 
@ob_start();
class Cierremeses extends Controllers{
    public function __construct(){
        parent::__construct('cierremeses');   
        $this->customModel('ReportesModel');
        $this->newModel('bienes'); 
    }
    public function Cierremeses(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Saldos Iniciales";
        $data['page_title'] = "Saldos Iniciales";
        $data['page_name'] = "Saldos Iniciales";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_cierremeses.js");
        $this->views->getView($this,"cierremeses",$data);
    }
    public function Siniciales(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Saldos Iniciales";
        $data['page_title'] = "Saldos Iniciales";
        $data['page_name'] = "Saldos Iniciales";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_siniciales.js","functions_bienes.js");
        $this->views->getView($this,"siniciales",$data);
    }
    public function getSiniciales($fecha){
        $arrData = $this->cierremeses->selectRegistros();
        $pre = 'cie'; $tabla = 'Cierremeses';
        for ($i=0; $i < count($arrData); $i++) { 
            $btnView = '';
            $btnEdit = '';
            $btnDelete = '';
            $arrData[$i][$pre.'_nro'] = $i+1;
            $arrData[$i]['cie_p'] = round($arrData[$i]['cie_mts']/$arrData[$i]['cie_qs'], 2);
            if($_SESSION['perMod']['gtp_r']){
                $btnView = '<button class="btn btn-info btn-sm" onClick="view('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
            }
            if($_SESSION['perMod']['gtp_u']){
                $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
            }
            if($_SESSION['perMod']['gtp_d']){	
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
            }
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getSaldosPeriodos(){
        $arrData = $this->ReportesModel->selectSaldosPeriodos();
        for ($i=0; $i < count($arrData) ; $i++) { 
            $btnView = '';
            $arrData[$i]['cie_nro'] = $i+1;
            $arrData[$i]['cie_periodo'] = substr($arrData[$i]['cie_periodo'],0,7);
            $btnView1 = '<a class="btn btn-info btn-sm" href="'.base_url().'/Cierremeses/productosMes/'.$arrData[$i]['cie_periodo'].'" title="Ver Saldo Mensual"><i class="far fa-eye"></i></a>';
            $btnView2 = '<a class="btn btn-primary btn-sm" href="'.base_url().'/Cierremeses/costoVenta/'.$arrData[$i]['cie_periodo'].'" title="Ver Costo de Venta"><i class="far fa-eye"></i></a>';
            $arrData[$i]['cie_options'] = '<div class="text-center">'.$btnView1.' '.$btnView2.'</div>';
        }
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function productosMes($periodo){
        $newPeriodo = date( "Y-m", strtotime($periodo. " first day of next month"));
        if (is_fecha($periodo)) {
            $data['arrData'] = $this->ReportesModel->selectProductosPeriodo($periodo);
            $data['periodo'] = $periodo;
            for ($i=0; $i < count($data['arrData']); $i++) { 
                $data['arrData'][$i]['cie_nro'] = $i+1;
                $data['arrData'][$i]['cie_bie_id'] = $this->bienes->selectRegistro(intval($data['arrData'][$i]['cie_bie_id']));
            }
        }
        $data['status'] = (is_fecha($periodo)) ? true : false ;
        $data['periodo'] = $periodo;
        $data['page_tag'] = "Saldos Mes";
        $data['page_title'] = "Saldos Mes";
        $data['page_name'] = "Saldos Mes";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_productosmes.js");
        $this->views->getView($this,"productosmes",$data);
    }
    public function setCierreMes(){
        $mesPeriodo = strval($_POST['mesPeriodo']);
        //$mesPeriodo = strval($mesPeriodo);
        if (is_fecha($mesPeriodo)) {
            $exist_saldo = $this->ReportesModel->selectSaldoProducto($mesPeriodo);
            $exist_data = $this->ReportesModel->selectCostosBien($mesPeriodo);
            if (!empty($exist_data) || !empty($exist_saldo)) {
                $arrBienes = $this->bienes->selectRegistros();    
                for ($j=0; $j <count($arrBienes);$j++) { 
                    $si = $this->ReportesModel->selectCierreMesProducto($mesPeriodo,$arrBienes[$j]['bie_id']); 
                    $mdetalles = $this->ReportesModel->selectCostosBien($mesPeriodo,$arrBienes[$j]['bie_id']);
                    $qsi=(isset($si['cie_qs'])) ? $si['cie_qs']+$si['cie_qc']-$si['cie_qv'] : 0 ;
                    $mtsi=(isset($si['cie_mts'])) ? $si['cie_mts']+$si['cie_mtc']-$si['cie_mtv'] : 0 ;
                    $qs=(isset($si['cie_qs'])) ? $si['cie_qs']+$si['cie_qc']-$si['cie_qv'] : 0 ;
                    $mts=(isset($si['cie_mts'])) ? $si['cie_mts']+$si['cie_mtc']-$si['cie_mtv'] : 0 ;
                    $qcv = 0;
                    $mtcv = 0;
                    $qc = 0;
                    $mtc = 0;
                    foreach ($mdetalles as $i => $d) {
                        if ($d['mde_mov_id']['mov_tipo'] == 1) {
                            $qc += $d['mde_q'];
                            $mtc += $d['mde_importe'];
                            $qs += $d['mde_q'];
                            $mts += $d['mde_importe'];
                        }
                        if ($d['mde_mov_id']['mov_tipo'] == 2) {
                            $qcv += $d['mde_q'];
                            $mtcv += $d['mde_q']*($mts/$qs);
                            $mts -= $d['mde_q']*($mts/$qs);
                            $qs -= $d['mde_q'];
                        } 
                    }
                    $nextPeriodo = date( "Y-m-d", strtotime($mesPeriodo. " first day of next month"));
                    $this->cierremeses->insertRegistro(array(
                        'cie_periodo'=>$nextPeriodo,
                        'cie_alm_id' =>1,
                        'cie_bie_id' =>$arrBienes[$j]['bie_id'],
                        'cie_qs'=>$qsi,
                        'cie_mts'=>$mtsi,
                        'cie_qc'=>$qc,
                        'cie_mtc'=>$mtc,
                        'cie_qv'=>$qcv,
                        'cie_mtv'=>$mtcv));
                }
                $arrResponse = array('status' => true, 'msg' => 'Datos Procesados Exitosamente');
            } else {
                $arrResponse = array('status' => false, 'msg' => 'No se encontro ningun registro');
            }
        } else {
            $arrResponse = array('status' => false, 'msg' => 'Ingrese un Periodo Valido');
        }
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function productoHistorico($params){
        $arrParams = explode(',',$params);
        if (!empty($arrParams[0])) {
            if ($arrParams[0] != 'all') {
                $codigo = $arrParams[0];
                $arrParams[0] = $this->bienes->searchRegistro(array('bie_cod'=>$codigo))['id_articulo'];
            }
        }
        $data['status'] = 0 ;
        if (is_numeric($arrParams[0])) {
            if (is_numeric($arrParams[0]) && is_fecha($arrParams[1]) && is_fecha($arrParams[2])) {
                $data['arrData'] = $this->model->selectArticuloHistorico($arrParams[0],$arrParams[1],$arrParams[2]);
            }else if(is_numeric($arrParams[0]) && is_fecha($arrParams[1])){
                $data['arrData'] = $this->model->selectArticuloHistorico($arrParams[0],$arrParams[1]);
            }else{
                $data['arrData'] = $this->model->selectArticuloHistorico($arrParams[0]);
            }
            $data['articulo'] = $this->ArticulosModel->selectArticulo($arrParams[0]);
            $data['articulo']['existencia_id'] = $this->TablasModel->selectTabla($data['articulo']['existencia_id']);
            $data['articulo']['um_id'] = $this->TablasModel->selectTabla($data['articulo']['um_id']);
            $data['articulo']['saldo'] = $this->CierreMesModel->selectSaldoProducto('2021-01-01',$arrParams[0]);

            for ($i=0; $i < count($data['arrData']); $i++) { 
                $data['arrData'][$i]['i'] = $i+1;
                $data['arrData'][$i]['registro_id'] = $this->RegistrosModel->selectRegistroNew(intval($data['arrData'][$i]['registro_id'])); 
                $data['arrData'][$i]['registro_id']['operacion_id'] = $this->TablasModel->selectTabla(intval($data['arrData'][$i]['registro_id']['operacion_id']));
                $data['arrData'][$i]['registro_id']['documento_id'] = $this->TablasModel->selectTabla(intval($data['arrData'][$i]['registro_id']['documento_id']));
                $data['arrData'][$i]['registro_id']['comprobante_id'] = $this->TablasModel->selectTabla(intval($data['arrData'][$i]['registro_id']['comprobante_id']));
                $data['arrData'][$i]['um_id'] = $this->TablasModel->selectTabla(intval($data['arrData'][$i]['um_id']));
            }
            $data['status'] = 1 ;
            $data['arrParams'] = $arrParams;
            $data['arrParams'][0] = $codigo;
        }else{
            if ($arrParams[0]=='all') {
                $data['status'] = $arrParams[0];
                $arrBienes = $this->ArticulosModel->selectArticulos();
                for ($j=0; $j <count($arrBienes);$j++) { 
                    $data['arrBienes'][$j]['articulo'] = $this->ArticulosModel->selectArticulo($arrBienes[$j]['id_articulo']);
                    $data['arrBienes'][$j]['articulo']['existencia_id'] = $this->TablasModel->selectTabla($data['arrBienes'][$j]['articulo']['existencia_id']);
                    $data['arrBienes'][$j]['articulo']['um_id'] = $this->TablasModel->selectTabla($data['arrBienes'][$j]['articulo']['um_id']);
                    if (is_fecha($arrParams[1])) {
                        $data['arrBienes'][$j]['arrData'] = $this->model->selectArticuloHistorico($arrBienes[$j]['id_articulo'],$arrParams[1]);
                        $data['arrBienes'][$j]['articulo']['saldo'] = $this->CierreMesModel->selectSaldoProducto($arrParams[1],$arrBienes[$j]['id_articulo']);
                    } else {
                        $data['arrBienes'][$j]['arrData'] = $this->model->selectArticuloHistorico($arrBienes[$j]['id_articulo']);
                        $data['arrBienes'][$j]['articulo']['saldo'] = $this->CierreMesModel->selectSaldoProducto('2021-01-01',$arrBienes[$j]['id_articulo']);
                    }
                    for ($i=0; $i < count($data['arrBienes'][$j]['arrData']); $i++) { 
                        $data['arrBienes'][$j]['arrData'][$i]['i'] = $i+1;
                        $data['arrBienes'][$j]['arrData'][$i]['registro_id'] = $this->RegistrosModel->selectRegistroNew(intval($data['arrBienes'][$j]['arrData'][$i]['registro_id'])); 
                        $data['arrBienes'][$j]['arrData'][$i]['registro_id']['operacion_id'] = $this->TablasModel->selectTabla(intval($data['arrBienes'][$j]['arrData'][$i]['registro_id']['operacion_id']));
                        $data['arrBienes'][$j]['arrData'][$i]['registro_id']['documento_id'] = $this->TablasModel->selectTabla(intval($data['arrBienes'][$j]['arrData'][$i]['registro_id']['documento_id']));
                        $data['arrBienes'][$j]['arrData'][$i]['registro_id']['comprobante_id'] = $this->TablasModel->selectTabla(intval($data['arrBienes'][$j]['arrData'][$i]['registro_id']['comprobante_id']));
                        $data['arrBienes'][$j]['arrData'][$i]['um_id'] = $this->TablasModel->selectTabla(intval($data['arrBienes'][$j]['arrData'][$i]['um_id']));
                    }
                }
            }
        }
        $data['page_tag'] = "Producto Historico";
        $data['page_title'] = "Producto Historico";
        $data['page_name'] = "Producto Historico";
        $data['page_functions_js'] = "functions_productosHistorico.js";
        $this->views->getView($this,"productohistorico",$data);
    }
    

}
?>