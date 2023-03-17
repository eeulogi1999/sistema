<?php
// @ob_start();
require 'Libraries/phpspreadsheet/vendor/autoload.php';
require_once 'Libraries/dompdf/vendor/autoload.php';
class Main extends Controllers{
    public function __construct(){
        parent::__construct('distritos');
        $this->newModel('tcambios');
        $this->newModel('tcespeciales');
        $this->newModel('establecimientos');
        $this->newModel('almacenes');
        $this->newModel('tafectaciones' );
    }
    public function getSelect(){
        $this->newModel(''.$_POST['tabla']);
        $_POST['descripcion'] = (is_json($_POST['descripcion'])) ? json_decode($_POST['descripcion'],true) : null;
        $_POST['where'] = (is_json($_POST['where'])) ? json_decode($_POST['where'],true) : null;
        $li = explode('_',$_POST['id']);
        $id = (count($li)>=3) ? $li[count($li)-2].'_'.$li[count($li)-1] : $_POST['id'];
        if (!empty($_POST['where'])){
            $arrData = $this->{$_POST['tabla']}->selectRegistros($_POST['where']);
        }else{
            $arrData = $this->{$_POST['tabla']}->selectRegistros();
        }
        $htmlOptions = "";
        if(count($arrData) > 0 ){
            for ($i=0; $i < count($arrData); $i++) {
                $val = '';
                foreach ($_POST['descripcion'] as $k => $des) {
                    $arrDes = explode('.',$des);
                    $res = $arrData[$i];
                    foreach ($arrDes as $j => $d) {
                        $res = $res[$d];
                    }
                    $val .= ($k === array_key_last($_POST['descripcion'])) ? $res :$res." - ";
                }
                $htmlOptions .= '<option value="'.$arrData[$i][$id].'">'.$val.'</option>';
            }
        }
        unset($this->{$_POST['tabla']});
        echo $htmlOptions;
        die();
    }
    public function getApiSelect(){
        if (!$_POST) {
            $_POST = json_decode(file_get_contents("php://input"),true);
        }
        $this->newModel(''.$_POST['tabla']);
        if (!empty($_POST['where'])){
            $arrData = $this->{$_POST['tabla']}->selectRegistros($_POST['where']);
        }else{
            $arrData = $this->{$_POST['tabla']}->selectRegistros();
        }
        $array = array();
        if(count($arrData) > 0 ){
            for ($i=0; $i < count($arrData); $i++) {
                $val = '';
                foreach ($_POST['descripcion'] as $k => $des) {
                    $arrDes = explode('.',$des);
                    $res = $arrData[$i];
                    foreach ($arrDes as $j => $d) {
                        $res = $res[$d];
                    }
                    $val .= ($k === array_key_last($_POST['descripcion'])) ? $res :$res." - ";
                }
                array_push($array,array('value'=>$arrData[$i][$_POST['id']],'label'=>$val));
            }
        }
        unset($this->{$_POST['tabla']});
        echo json_encode($array,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setNav(){
        if ($_POST) {
            $_SESSION['tree'] = $_POST['tree'];
        }else{
            echo json_encode(array('tree'=>$_SESSION['tree']),JSON_UNESCAPED_UNICODE);
        }
        die();
    }
    public function getTreeSelect($c){
        $this->newModel('t9plancontables');
        $n = strlen(strval($c))+1;
        $arrData = $this->t9plancontables->selectRegistros(array('custom'=>"t9p_codigo like '".$c."%' AND LENGTH(t9p_codigo) = ".$n));
        $response = array();
        for ($i=0; $i < count($arrData) ; $i++) {
            $response[$i]['id'] = $arrData[$i]['t9p_id'];
            $response[$i]['value'] = $arrData[$i]['t9p_codigo'].' '.$arrData[$i]['t9p_descripcion'];
            $response[$i]['data'] = $this->getTreeSelect($arrData[$i]['t9p_codigo']);
        }
        return $response;
    }
    public function getT9pSelect($c){
        $this->newModel('t9plancontables');
        echo json_encode($this->getTreeSelect($c),JSON_UNESCAPED_UNICODE);
        unset($this->t9plancontables);
        die();
    }
    public function setChangeEst($est_id){
        if (is_numeric($est_id)) {
            $_SESSION['est'] = $this->establecimientos->selectRegistro($est_id);
            $alm = $this->almacenes->selectRegistros(array('alm_est_id'=>$est_id));
            $_SESSION['alm'] = $this->almacenes->selectRegistro($alm[0]['alm_id']);
            header('Location: '.$_SERVER['HTTP_REFERER']);
        }
        die();
    }
    public function getConsultaRuc($ruc){
        $data = file_get_contents("https://dniruc.apisperu.com/api/v1/ruc/".$ruc."?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InNpc3RlbWFzQGdycmVwcmVzZW50YWNpb25lcy5jb20ifQ.pBHyVRial8sRjCI0MHKbuXNMTXEEpTvkJZaHTzYe3Xg");
        echo $data;
        die();
    }
    public function getConsultaDNI($dni){
        $data = file_get_contents("https://dniruc.apisperu.com/api/v1/dni/".$dni."?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InNpc3RlbWFzQGdycmVwcmVzZW50YWNpb25lcy5jb20ifQ.pBHyVRial8sRjCI0MHKbuXNMTXEEpTvkJZaHTzYe3Xg");
        echo $data;
        die();
    }
    public function getTcambio($fecha,$res=false){
        $gt = $this->tcambios->searchRegistro(array('gtc_fecha'=>$fecha));
        $arrData = null;
        if (!empty($gt)) {
            $arrData = $this->tcespeciales->searchRegistro(array('tce_gtc_id'=>$gt['gtc_id']));
        }
        if (empty($arrData)) {
            $tc = CurlConnectionGet('https://api.apis.net.pe/v1/tipo-cambio-sunat?fecha='.$fecha,null,'apis-token-1.aTSI1U7KEuT-6bbbCguH-4Y8TI6KS73N');
            $itc = $this->tcambios->insertRegistro(array('gtc_fecha'=>$tc['fecha'],'gtc_gt4_id'=>2,'gtc_tcompra'=>$tc['compra'],'gtc_tventa'=>$tc['venta']));
            $tce = $this->tcespeciales->insertRegistro(array('tce_gtc_id'=>$itc['gtc_id']));
            $arrData = $this->tcespeciales->selectRegistro($tce['tce_id']);
        }
        if ($res) {
            return $arrData;
        } else {
            echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        }        
        die();
    }
    public function getAll($pre){
        if (!$_POST) {
            $_POST = json_decode(file_get_contents("php://input"),true);
            if (!empty($_POST)) {
                $_POST['where'] = json_encode($_POST['where'],JSON_UNESCAPED_UNICODE);
            }
        }
        $tabla = $this->getTable($pre);
        $this->newModel($tabla);
        $arrData = $this->{$tabla}->selectRegistros((isset($_POST['where']))?json_decode($_POST['where'],true):array());
        for ($i=0; $i < count($arrData); $i++) {
            $btnView = '';
            $btnEdit = '';
            $btnDelete = '';
            if (isset($arrData[$i][$pre.'_status'])) {
                $arrData[$i][$pre.'_status'] = '<span class="badge badge-'.STATUS[array_keys(STATUS)[$arrData[$i][$pre.'_status']]].'">'.array_keys(STATUS)[$arrData[$i][$pre.'_status']].'</span>';
            }
            if((isset($_SESSION['perMod']['gtp_r']))?$_SESSION['perMod']['gtp_r']:0){
                $btnView = '<button class="btn btn-info btn-sm" onClick="view('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Ver '.$tabla.'"><i class="far fa-eye"></i></button>';
            }
            if((isset($_SESSION['perMod']['gtp_u']))?$_SESSION['perMod']['gtp_r']:0){
                $btnEdit = '<button class="btn btn-primary  btn-sm" onClick="edit('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Editar '.$tabla.'"><i class="fas fa-pencil-alt"></i></button>';
            }
            if((isset($_SESSION['perMod']['gtp_d']))?$_SESSION['perMod']['gtp_r']:0){
                $btnDelete = '<button class="btn btn-danger btn-sm" onClick="del('."'".$pre."',".$arrData[$i][$pre.'_id'].')" title="Eliminar '.$tabla.'"><i class="far fa-trash-alt"></i></button>';
            }
            $arrData[$i][$pre.'_options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
        }
        unset($this->{$tabla});
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function del(){
        $tabla = $this->getTable($_POST['prefijo']);
        $this->newModel($tabla);
        $arrData = $this->{$tabla}->deleteRegistro($_POST['id']);
        if($arrData){
            $arrResponse = array('status' => true, 'msg' => 'Se ha eliminado el '.$tabla);
        }else{
            $arrResponse = array('status' => false, 'msg' => 'Error al eliminar el '.$tabla);
        }
        unset($this->{$tabla});
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function set(){
        $prefijo = $_POST['prefijo'];
        $where = (is_json($_POST['where'])) ? json_decode($_POST['where'],true) : null;
        unset($_POST['prefijo']);
        unset($_POST['where']);
        $tabla = $this->getTable($prefijo);
        if (isset($where['php'])) {
            unset($where['php']);
            $this->newController(ucfirst($tabla));
            $_POST = $this->{ucfirst($tabla)}->{'set'.ucfirst($tabla)}($_POST,true);
            unset($this->{ucfirst($tabla)});
        }
        $this->newModel($tabla);
        if ($_POST) {
            if ((isset($_POST[$prefijo.'_id']))?intval($_POST[$prefijo.'_id'])==0:true) {
                $arrData = $this->{$tabla}->insertRegistro($_POST,$where);
            }else{
                $arrData = $this->{$tabla}->updateRegistro($_POST);
            }
        }
        unset($this->{$tabla});
        echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function get($param){
        $data = explode(',',$param);
        $prefijo = $data[0];
        $id = $data[1];
        $tabla = $this->getTable($prefijo);
        $this->newModel($tabla);
        if (is_numeric($id)) {
            $arrData = $this->{$tabla}->selectRegistro($id);
            if (!empty($arrData)) {
                $res = array('status' => true, 'msg' => 'OK','data'=>$arrData);
                if (isset($data[2]) && $data[2]=='php' ) {
                    $this->newController(ucfirst($tabla));
                    $res['data'] = $this->{ucfirst($tabla)}->{'get'.ucfirst($prefijo)}($arrData,true);
                    unset($this->{ucfirst($tabla)});
                }
            } else {
                $res = array('status' => false, 'msg' => 'Error al recuperar los datos de '.$tabla);
            }
        }
        unset($this->{$tabla});
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setPeriodo(){
        $_SESSION['periodo'] = '"'.$_POST['periodo'].'"';
        $arrResponse = array('status' => true);
        echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function toExcel(){
        $data = file_get_contents($_FILES['objects']['tmp_name']);
        $spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $o = json_decode(urldecode($data),true);
        for ($j=1; $j < count($o['columns']); $j++) { 
            $spreadsheet->getActiveSheet()->getColumnDimensionByColumn($j)->setAutoSize(true);
            $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow($j,1,$o['columns'][$j-1]['data']);
        }
        for ($i=2; $i < count($o['data'])+2 ; $i++) {
            $r = $o['data'][$i-2];
            for ($j=1; $j < count($o['columns']); $j++) { 
                $ne = explode('.',$o['columns'][$j-1]['data']);
                // $ix = $ne[count($ne)-1];
                $d = $r;
                for ($n = 0; $n < count($ne); $n++) {  
                    $d = $d[$ne[$n]];
                }
                $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow($j, $i, $d);
            }
        }
        $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
        $writer->save('Assets/excel/export.xlsx');
        echo json_encode(array('name'=>'export.xlsx'),JSON_UNESCAPED_UNICODE);
        die();
    }
    public function Prueba(){
        $reader = new PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        $reader->setReadDataOnly(true);
        $spreadsheet = $reader->load('Assets/excel/ventas-2022-08.xlsx');
        $sheet = $spreadsheet->getSheet($spreadsheet->getFirstSheetIndex());
        $de = $sheet->toArray();

        $do = array();
        for ($i=1; $i <count($de); $i++) { 
            $tot = array();
            $igv = array();
            $bas = array();
            $glosa='';
            if (strlen($de[$i][14])>13) {
                $glosa = substr($de[$i][14],0,12).',08'.$de[$i][17];
            } else {
                if (strlen($de[$i][14])<1) {
                    $glosa = 'Clientes Varios,08'.$de[$i][17];
                } else {
                    $glosa = $de[$i][14].',08'.$de[$i][17];
                }
            }
            $tot[0] = '';
            $tot[1] = '05';
            $tot[2] = '08'.substr($de[$i][2],-4,strlen($de[$i][2]));
            $tot[3] = $de[$i][9];
            $tot[4] = 'MN';
            $tot[5] = $glosa;
            $tot[6] = '';
            $tot[7] = 'V';
            $tot[8] = 'S';
            $tot[9] = '';
            $tot[10] = '121201';
            $tot[11] = (empty($de[$i][15]))?'00000001':$de[$i][15];
            $tot[12] = '';
            $tot[13] = 'D';
            $tot[14] = $de[$i][6];
            $tot[15] = '';
            $tot[16] = '';
            $tot[17] = 'FT';
            $tot[18] = $de[$i][1].'-'.$de[$i][1];
            $tot[19] = $de[$i][9];
            $tot[20] = $de[$i][10];
            $tot[21] = '';
            $tot[22] = $glosa;
            array_push($do,$tot);
            $igv[0] = '';
            $igv[1] = '05';
            $igv[2] = '08'.substr($de[$i][2],-4,strlen($de[$i][2]));
            $igv[3] = $de[$i][9];
            $igv[4] = 'MN';
            $igv[5] = $glosa;
            $igv[6] = '';
            $igv[7] = 'V';
            $igv[8] = 'S';
            $igv[9] = '';
            $igv[10] = '401111';
            $igv[11] = (empty($de[$i][15]))?'00000001':$de[$i][15];
            $igv[12] = '';
            $igv[13] = 'H';
            $igv[14] = $de[$i][5];
            $igv[15] = '';
            $igv[16] = '';
            $igv[17] = 'FT';
            $igv[18] = $de[$i][1].'-'.$de[$i][1];
            $igv[19] = $de[$i][9];
            $igv[20] = $de[$i][10];
            $igv[21] = '';
            $igv[22] = $glosa;
            array_push($do,$igv);
            $bas[0] = '';
            $bas[1] = '05';
            $bas[2] = '08'.substr($de[$i][2],-4,strlen($de[$i][2]));
            $bas[3] = $de[$i][9];
            $bas[4] = 'MN';
            $bas[5] = $glosa;
            $bas[6] = '';
            $bas[7] = 'V';
            $bas[8] = 'S';
            $bas[9] = '';
            $bas[10] = '701211';
            $bas[11] = (empty($de[$i][15]))?'00000001':$de[$i][15];
            $bas[12] = '';
            $bas[13] = 'H';
            $bas[14] = $de[$i][4];
            $bas[15] = '';
            $bas[16] = '';
            $bas[17] = 'FT';
            $bas[18] = $de[$i][1].'-'.$de[$i][1];
            $bas[19] = $de[$i][9];
            $bas[20] = $de[$i][10];
            $bas[21] = '';
            $bas[22] = $glosa;
            array_push($do,$bas);
        }
        // $head = new PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        // $head->setReadDataOnly(true);
        // $sx_head = $head->load('Assets/excel/ventas-2022-08.xlsx');

        $spx_out = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        for ($i=1; $i < count($do)+1 ; $i++) {
            for ($j=1; $j < count($do[$i-1])+1; $j++) { 
                $spx_out->getActiveSheet()->setCellValueByColumnAndRow($j, $i, $do[$i-1][$j-1]);
            }
        }
        $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spx_out);
        $writer->save('Assets/excel/v_08_concar.xlsx');
        die(); 
    }
    public function Inv24Jun(){
        $t10 = array('FAE'=>'FT','BOE'=>'BV','NCE'=>'NC','NDE'=>'ND','1'=>'FT','3'=>'BV','7'=>'NC');
        $reader = new PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        $reader->setReadDataOnly(true);
        $spreadsheet = $reader->load('Assets/excel/reporte-ventas.xlsx');
        $sheet = $spreadsheet->getSheet($spreadsheet->getFirstSheetIndex());
        $de = $sheet->toArray();  
        $spreadsheet = $reader->load('Assets/excel/rventas.xlsx');
        $sheet = $spreadsheet->getSheet($spreadsheet->getFirstSheetIndex());
        $ve = $sheet->toArray();
        $do = array();
        $bas = array_unique(array_column($de,8));
        foreach ($bas as $p => $d) {//count($bas)
            if ($p != array_key_first($bas) ) {
                $re = array();
                for ($j=1; $j < count($de); $j++) { 
                    if ($de[$j][8] == $d) {
                        array_push($re,$de[$j]);
                    }
                }
                if ($re[0][17]!= 'NP') {    
                    $iv = $ve[array_search($re[0][18],array_column($ve,3))];
                    $glosa='';
                    if (strlen($re[0][16])>13) {
                        $glosa = substr($re[0][16],0,12).','.$re[0][3].$re[0][18];
                    } else {
                        if (strlen($re[0][16])<1) {
                            $glosa = 'Clientes Varios,'.$re[0][3].$re[0][18];
                        } else {
                            $glosa = $re[0][16].','.$re[0][3].$re[0][18];
                        }
                    }
                    for ($k=0; $k < count($re); $k++) { 
                        $item = array();
                        $item[0] = '';
                        $item[1] = '05';   //05 ventas    //11 compras
                        $item[2] = str_pad($re[0][3], 2, 0, STR_PAD_LEFT).str_pad($re[$k][8], 4, 0, STR_PAD_LEFT);
                        $item[3] = $re[0][19];
                        $item[4] = ($iv[4] == 'SOL')?'MN':'US';
                        $item[5] = $glosa;
                        $item[6] = '';
                        $item[7] = 'V';
                        $item[8] = 'S';
                        $item[9] = '';
                        $item[10] = $re[$k][11];
                        $item[11] = ($re[0][15]=='9')?'00000001':$re[0][15];
                        $item[12] = '';
                        $item[13] = ($re[$k][24]>0)?'D':'H';
                        $item[14] = ($re[$k][24]>0)?$re[$k][24]:$re[$k][25];
                        $item[15] = '';
                        $item[16] = '';
                        $item[17] = $t10[$re[0][17]];
                        $item[18] = $re[0][18];
                        $item[19] = $re[0][19];
                        $item[20] = $re[0][20];
                        $item[21] = '';
                        $item[22] = $glosa;
                        $item[23] = '';
                        $item[24] = '';
                        $item[25] = '';
                        $item[26] = ($iv[14]>0)?$t10[$iv[14]]:'';
                        $item[27] = $iv[15];
                        $item[28] = $iv[16];
                        $item[29] = '';
                        $item[30] = ($item[17]=='NC')?abs($iv[8]):'';   //base
                        $item[31] = ($item[17]=='NC')?abs($iv[11]):'';   //igv
                        array_push($do,$item);
                    }
                }
            }
        }
        copy('Assets/excel/concar_format.xlsx', 'Assets/excel/format_out.xlsx');
        $head = new PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        $spx_out = $head->load('excel/format_out.xlsx');
        // $spx_out = new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $spx_out->getActiveSheet()->getStyle('D')->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY);
        $spx_out->getActiveSheet()->getStyle('T')->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY);
        $spx_out->getActiveSheet()->getStyle('U')->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY);
        $spx_out->getActiveSheet()->getStyle('AC')->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY);
        for ($i=4; $i < count($do)+4 ; $i++) {
            for ($j=1; $j < count($do[$i-4])+1; $j++) { 
                $spx_out->getActiveSheet()->setCellValueByColumnAndRow($j, $i, $do[$i-4][$j-1]);
            }
        }
        $writer = new PhpOffice\PhpSpreadsheet\Writer\Xlsx($spx_out);
        $writer->save('Assets/excel/format_out.xlsx');
        die(); 
    }
    public function htmlPdf(){
        $dompdf = new Dompdf\Dompdf();
        ob_end_clean();
        $data['html'] = file_get_contents($_FILES['html']['tmp_name']);
        $html = getFile("Cajas/pdf",$data);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4');
        $dompdf->render();
        file_put_contents('Assets/pdf/file.pdf', $dompdf->output());
        echo json_encode(array('name'=>'file.pdf'),JSON_UNESCAPED_UNICODE);
        die();
    }
}
?>