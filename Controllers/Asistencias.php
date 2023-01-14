<?php 
@ob_start();
require 'Libraries/phpspreadsheet/vendor/autoload.php';
class Asistencias extends Controllers{
    public function __construct(){
        parent::__construct('asistencias');   
        $this->newModel('colaboradores'); 
        $this->newModel('personas'); 
    }
    public function Asistencias(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Asistencias";
        $data['page_title'] = "Asistencias ";
        $data['page_name'] = "Asistencias";
        $data['page_data'] = array('asi'=>array('asi_week'=>$_SESSION['asi']['asi_week']));
        $data['page_functions_js'] = array("functions_asistencias.js");
        $this->views->getView($this,"asistencias",$data);
    }
    public function getAsistencias(){
        $rwcol = $this->colaboradores->selectRegistros();
        $rw = array();
        for ($i=0; $i < count($rwcol); $i++) { 
            $r['asi_col_id'] = $rwcol[$i];
            $r['asi_ndias'] = $this->asistencias->searchRegistro(array('asi_col_id'=>$rwcol[$i]['col_id'],
            'custom'=>'asi_ext IS NULL AND WEEKOFYEAR(asi_horaE) = "'.explode('W',$_SESSION['asi']['asi_week'])[1].'"'),
            "COUNT(DISTINCT(DATE_FORMAT(asi_horaE, '%Y-%m-%d'))) as 'nd'")['nd'];
            $rwnh = $this->asistencias->selectRegistros(array('asi_col_id'=>$rwcol[$i]['col_id'],
            'custom'=>'asi_ext IS NULL AND WEEKOFYEAR(asi_horaE) = "'.explode('W',$_SESSION['asi']['asi_week'])[1].'"'));
            $nh = 0;
            $nm = (new DateTime)->setTime(0,0,0);
            for ($j=0; $j < count($rwnh); $j++) { 
                $dt1 = new DateTime($rwnh[$j]['asi_horaE']);
                $dt2 = new DateTime($rwnh[$j]['asi_horaS']);
                $dif = $dt1->diff($dt2);
                $nmh = (intval($nm->format('h'))<12)?intval($nm->format('h')):0;
                $nh += intval($dif->format('%h')) +$nmh;
                $nm = (new DateTime)->setTime(0,intval($nm->format('i')),0);
                $nm = $nm->modify('+'.$dif->format('%i').' minute');
            }
            $nh += (intval($nm->format('h'))<12)?intval($nm->format('h')):0;
            $nm = (intval($nm->format('i'))>0)?intval($nm->format('i'))/60:0;
            $nh += $nm;
            $view = '<button class="btn btn-success btn-sm" onClick="viewAsi('.$r['asi_col_id']['col_id'].')" title="Asistencias"><i class="far fa-eye"></i></button>'; 
            $hex = '<button class="btn btn-warning btn-sm" onClick="viewHex('.$r['asi_col_id']['col_id'].')" title="Horas Extras"><i class="far fa-eye"></i></button>'; 
            $r['nh'] = $nh;
            $r['asi_nhoras'] = ($nh>51)?$nh-51:0;
            $r['asi_options'] = '<div class="text-center">'.$view.' '.$hex.'</div>';
            array_push($rw,$r); 
        }
        echo json_encode($rw,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function importAsi(){
        $destino = 'Assets/excel/asi_xls.xls';  
        $move = move_uploaded_file($_FILES['asi_xls']['tmp_name'], $destino);
        if (true) {  //$move==1
            //$reader = new PhpOffice\PhpSpreadsheet\Reader\Xls();
            //$reader->setReadDataOnly(true);

            $reader = PhpOffice\PhpSpreadsheet\IOFactory::createReaderForFile($destino);
            $reader->setReadDataOnly(true);
            $spreadsheet = $reader->load($destino);
            //$spreadsheet->getActiveSheet()->getStyle('D')->getNumberFormat()->setFormatCode(PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_YYYYMMDD);
            $sheet = $spreadsheet->getSheet($spreadsheet->getFirstSheetIndex());
            $de = $sheet->toArray();
            $a=0;
            for ($i=1; $i < count($de); $i++) {
                $ri = explode(' ',$de[$i][1]);
                $si = 'Falta';
                for ($j=1; $j < count($ri); $j++) { 
                    if ($j==1) {
                        $si = '';
                    }
                    $si.=$ri[$j].' ';
                }
                $gpe=$this->personas->insertRegistro(array('gpe_identificacion'=>rand(10000000, 99999999),
                'gpe_nombre'=>$ri[0],'gpe_apellidos'=>$si),array('gpe_nombre','gpe_apellidos'));
                $col=$this->colaboradores->insertRegistro(array('col_cod'=>$de[$i][2],
                'col_gpe_id'=>$gpe['gpe_id'],
                'col_gar_id'=>3,
                'col_puesto'=>'Colaborador',
                'col_est_id'=>$_SESSION['est']['est_id']),array('col_cod'));
                $dtstr = DateTime::createFromFormat('j/m/Y H:i:s', $de[$i][3])->format('Y-m-d H:i:s');
                $dt = explode(' ',$dtstr);
                $h = explode(':',$dt[1]);
                if ($h[0]<12) {
                    $asi1=$this->asistencias->insertRegistro(array('asi_col_id'=>$col['col_id'],
                    'asi_horaE'=>$dtstr),array('asi_col_id','asi_horaE'));
                }
                if (intval($h[0])>12) {
                    $asis=$this->asistencias->searchRegistro(array('asi_col_id'=>$col['col_id'],
                    'custom'=>'DATE_FORMAT(asi_horaE, "%Y-%m-%d") = "'.$dt[0].'"'));
                    if (!empty($asis)) {
                        $asi2=$this->asistencias->updateRegistro(array('asi_id'=>$asis['asi_id'],'asi_horaS'=>$dtstr));
                        $a += 1;
                    }
                }
            }
            $arrRes=array('status'=>true,'msg'=>'Se Procesaron un total de: '.$a);
        } else {
            $arrRes=array('status'=>false,'msg'=>'No se pudo recuperar el Archivo');
        }
        echo json_encode($arrRes,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getAsi($asi_col_id){
        $rw = $this->asistencias->selectRegistros(array('asi_col_id'=>$asi_col_id,'custom'=>'asi_ext IS NULL'),
        array('asi_col_id')); 
        $r = array();
        foreach ($rw as $i => $d) {
            array_push($r,array('title'=>'Asistio','id'=>$d['asi_id'],'start'=>date('Y-m-d\TH:i:s',strtotime($d['asi_horaE'])),'end'=>date('Y-m-d\TH:i:s',strtotime($d['asi_horaS']))));
        }
        echo json_encode($r,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function getHex($asi_col_id){
        $rw = $this->asistencias->selectRegistros(array('asi_col_id'=>$asi_col_id,'asi_ext'=>1),
        array('asi_col_id')); 
        $r = array();
        foreach ($rw as $i => $d) {
            array_push($r,array('title'=>'Extras','id'=>$d['asi_id'],'start'=>date('Y-m-d\TH:i:s',strtotime($d['asi_horaE'])),'end'=>date('Y-m-d\TH:i:s',strtotime($d['asi_horaS']))));
        }
        echo json_encode($r,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function changeWeek(){
        if ($_POST) {
            $_SESSION['asi']['asi_week'] = $_POST['asi_week'];
            $r =array('status'=>true);
        }else{
            $r =array('status'=>false);
        }
        echo json_encode($r,JSON_UNESCAPED_UNICODE);
        die();
    }
    public function setAsistencias(){
        $res = array('status'=>false,'msg'=>'Datos no Recibidos','data'=>$_POST);
        if ($_POST) {
            for ($i=1; $i < 7; $i++) { 
                if (!empty($_POST['ms_'.$i]) && !empty($_POST['me_'.$i])) {
                    $this->asistencias->insertRegistro(array('asi_col_id'=>$_POST['asi_col_id'],'asi_horaE'=>$_POST['d_'.$i].' '.$_POST['ms_'.$i],'asi_horaS'=>$_POST['d_'.$i].' '.$_POST['me_'.$i]),array('asi_col_id','asi_horaE'));
                }
                if (!empty($_POST['ts_'.$i]) && !empty($_POST['te_'.$i])) {
                    $this->asistencias->insertRegistro(array('asi_col_id'=>$_POST['asi_col_id'],'asi_horaE'=>$_POST['d_'.$i].' '.$_POST['ts_'.$i],'asi_horaS'=>$_POST['d_'.$i].' '.$_POST['te_'.$i]),array('asi_col_id','asi_horaE'));
                }
            }
            $res = array('status'=>true,'msg'=>'Guardado Correctamente','data'=>$_POST);
        }
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
        die();
    }
}