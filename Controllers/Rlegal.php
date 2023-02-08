<?php 
@ob_start();
class Rlegal extends Controllers{ 
    public function __construct(){
        parent::__construct('rlegal');  
        $this->newModel('cierremeses');
        $this->newModel('departamentos');
        $this->newModel('provincias');
        $this->newModel('distritos');
        $this->customModel('Html2array');
    }
    public function Rlegal(){
        if(empty($_SESSION['perMod']['gtp_r'])){
            header("Location:".base_url().'/dashboard');
        }
        $data['page_tag'] = "Rlegal";
        $data['page_title'] = "Rlegal";
        $data['page_name'] = "Rlegal";
        $data['page_data'] = array();
        $data['page_functions_js'] = array("functions_rlegal.js");
        $this->views->getView($this,"rlegal",$data);
    }
    public function consulta($ruc){
        $reponse = postRlegal($ruc);
        libxml_use_internal_errors(true);
        $sunat = $this->Html2array->getdata($reponse);
        for ($i=1; $i < count($sunat); $i++) { 
            echo trim($ruc.','.$sunat[$i][1]).','.trim($sunat[$i][3]).','.trim($sunat[$i][5]).','.trim($sunat[$i][7]).','.trim($sunat[$i][9]);
        }
    }
    public function all(){
        $rucs = array_slice($this->rlegal->selectRegistros(), 1000, 2299);
        foreach ($rucs as $i => $d) {
            dep($this->consulta($d['rle_ruc']));
        }
        die();
    }
    public function bot(){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://repositorio.ingemmet.gob.pe/handle/20.500.12544/235',
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
        libxml_use_internal_errors(true);
        $arr = $this->Html2array->getdata($response,true); //true if requer html node
        $li = array();
        for ($i=1; $i < count($arr); $i++) { 
            $DOM = new DOMDocument;
		    $DOM->loadHTML($arr[$i][0]);
            $a = $DOM->getElementsByTagName('a');
            foreach ($a as $d) {
                $li[$d->nodeValue]='https://repositorio.ingemmet.gob.pe'.$d->getAttribute('href');
            }
        }
        echo json_encode($li,JSON_UNESCAPED_UNICODE);
        return $li;
    }
    function download(){
        // header("Content-disposition: attachment; filename=".$_POST['name']);
        // header("Content-type: application/pdf");
        // readfile($_POST['url']);
        dep($_POST);
        dep($_FILES);
        die();
    }
    public function boti(){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://repositorio.ingemmet.gob.pe/handle/20.500.12544/368',
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
        libxml_use_internal_errors(true);
        $arr = $this->Html2array->getdata($response,true); //true if requer html node
        $li = array();
        for ($i=1; $i < count($arr); $i++) { 
            $DOM = new DOMDocument;
		    $DOM->loadHTML($arr[$i][0]);
            $a = $DOM->getElementsByTagName('a');
            foreach ($a as $d) {
                $cur = curl_init();
                curl_setopt_array($cur, array(
                CURLOPT_URL => 'https://repositorio.ingemmet.gob.pe'.$d->getAttribute('href'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'GET',
                CURLOPT_HTTPHEADER => array(
                    'Cookie: JSESSIONID=5AE621DDBEC8A36A61F852196361CE2B'
                ),
                ));
                $res = curl_exec($cur);
                curl_close($cur);
                file_put_contents($d->nodeValue, $res);
                $li[$d->nodeValue]='https://repositorio.ingemmet.gob.pe'.$d->getAttribute('href');
            }
        }
        $zip = new ZipArchive;
        $zip->open('ingemmet.zip', ZipArchive::CREATE);
        foreach ($li as $i => $file) {
            $zip->addFile($i);
            //unlink($i);
        }
        $zip->close();
        //dep($li);
        header('Content-Type: application/zip');
        header('Content-disposition: attachment; filename=ingemmet.zip');
        header('Content-Length: ' . filesize('ingemmet.zip'));
        readfile('ingemmet.zip');
        die();
        //echo json_encode($li,JSON_UNESCAPED_UNICODE);
        //return $li;
    }
    function dow(){
        $cur = curl_init();
        curl_setopt_array($cur, array(
        CURLOPT_URL => 'https://repositorio.ingemmet.gob.pe/bitstream/20.500.12544/235/5/B-008-Boletin-Estudio_Recursos_Minerales_Peru-Franja_1.pdf',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'Cookie: JSESSIONID=5AE621DDBEC8A36A61F852196361CE2B'
        ),
        ));
        $res = curl_exec($cur);
        curl_close($cur);
        file_put_contents('my.pdf', $res);


        $files = array('readme.txt', 'test.html', 'image.gif');
        $zipname = 'file.zip';
        $zip = new ZipArchive;
        $zip->open($zipname, ZipArchive::CREATE);
        foreach ($files as $file) {
        $zip->addFile($file);
        }
        $zip->close();



        // header('Content-Type: application/zip');
        // header('Content-disposition: attachment; filename='.$zipname);
        // header('Content-Length: ' . filesize($zipname));
        // readfile($zipname);

        // $file = readfile('https://repositorio.ingemmet.gob.pe/bitstream/20.500.12544/235/61/B008-Mapa8_Isovalores_de_Sb.pdf');
        // dep($file);
        die();
    }
    function distritos(){
        $sql = 'SELECT gde.gde_departamento,gpr.gpr_provincia,gdi.gdi_distrito 
        FROM ((distritos as gdi
        INNER JOIN provincias  as gpr ON gpr.gpr_id = gdi.gdi_gpr_id)
        INNER JOIN departamentos as gde ON gde.gde_id = gpr.gpr_gde_id);';
    }

}
?>