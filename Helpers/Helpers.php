<?php 

	//Retorla la url del proyecto
	function base_url(){
		return BASE_URL;
	}
    //Retorla la url de Assets
    function media(){
        return BASE_URL."/Assets";
    }
    function images(){
        return BASE_URL."/Assets/images";
    }
    function libraries(){
        return BASE_URL."/Libraries";
    }
    function headerAdmin($data=""){
        $view_header = "Views/Template/header_admin.php";
        require_once ($view_header);
    }
    function footerAdmin($data="")
    {
        $view_footer = "Views/Template/footer_admin.php";
        require_once ($view_footer);        
    }
    function headerTienda($data="")
    {
        $view_header = "Views/Template/header_tienda.php";
        require_once ($view_header);
    }
    function footerTienda($data="")
    {
        $view_footer = "Views/Template/footer_tienda.php";
        require_once ($view_footer);        
    }
	//Muestra información formateada
	function dep($data,$die = true){
        $format  = print_r('<pre>');
        $format .= print_r($data);
        $format .= print_r('</pre>');
        if ($die) {
            die();
        }
        return $format;
    }
    function getModal(string $nameModal, $data){
        $view_modal = "Views/Template/Modals/{$nameModal}.php";
        require $view_modal;        
    }
    function getFile(string $url, $data){
        ob_start();
        require_once("Views/{$url}.php");
        $file = ob_get_clean();
        return $file;        
    }
    //Envio de correos
    function sendEmail($data,$template){
        $asunto = $data['asunto'];
        $emailDestino = $data['email'];
        $empresa = NOMBRE_REMITENTE;
        $remitente = EMAIL_REMITENTE;
        $emailCopia = !empty($data['emailCopia']) ? $data['emailCopia'] : "";
        //ENVIO DE CORREO
        $de = "MIME-Version: 1.0\r\n";
        $de .= "Content-type: text/html; charset=UTF-8\r\n";
        $de .= "From: {$empresa} <{$remitente}>\r\n";
        $de .= "Bcc: $emailCopia\r\n";
        ob_start();
        require_once("Views/Template/Email/".$template.".php");
        $mensaje = ob_get_clean();
        mail('eeulogi1999àgmail.com', 'prueba', '<h1>Prueba</h1>');
        $send = mail($emailDestino, $asunto, $mensaje, $de);
        return $send;
    }

    function getPermisos($gus_gmo_id){
        require_once ("Models/DatabaseModel.php");
        $x = new Mysql(DB_NAME);
        $tpermisos = new DatabaseModel($x,DB_NAME,'tpermisos');
        $arrData = $tpermisos->searchRegistro(array('gtp_gro_id'=>$_SESSION['gus']['gus_gro_id']['gro_id'],'gtp_gmo_id'=>$gus_gmo_id));
        return  $arrData;
    }
    function getModulos($parms){
        require_once ("Models/DatabaseModel.php");
        $x = new Mysql(DB_NAME);
        $modulos = new DatabaseModel($x,DB_NAME,'modulos');
        $arrData = $modulos->selectRegistros(array('custom'=>$parms));
        return $arrData;
    }
    function uploadImage(array $data, string $name){
        $url_temp = $data['tmp_name'];
        $destino    = '.uploads/'.$name;        
        $move = move_uploaded_file($url_temp, $destino);
        return $move;
    }

    function deleteFile(string $name){
        unlink('.uploads/'.$name);
    }

    //Elimina exceso de espacios entre palabras
    function strClean($strCadena){
        $string = preg_replace(['/\s+/','/^\s|\s$/'],[' ',''], $strCadena);
        $string = trim($string); //Elimina espacios en blanco al inicio y al final
        $string = stripslashes($string); // Elimina las \ invertidas
        $string = str_ireplace("<script>","",$string);
        $string = str_ireplace("</script>","",$string);
        $string = str_ireplace("<script src>","",$string);
        $string = str_ireplace("<script type=>","",$string);
        $string = str_ireplace("SELECT * FROM","",$string);
        $string = str_ireplace("DELETE FROM","",$string);
        $string = str_ireplace("INSERT INTO","",$string);
        $string = str_ireplace("SELECT COUNT(*) FROM","",$string);
        $string = str_ireplace("DROP TABLE","",$string);
        $string = str_ireplace("OR '1'='1","",$string);
        $string = str_ireplace('OR "1"="1"',"",$string);
        $string = str_ireplace('OR ´1´=´1´',"",$string);
        $string = str_ireplace("is NULL; --","",$string);
        $string = str_ireplace("is NULL; --","",$string);
        $string = str_ireplace("LIKE '","",$string);
        $string = str_ireplace('LIKE "',"",$string);
        $string = str_ireplace("LIKE ´","",$string);
        $string = str_ireplace("OR 'a'='a","",$string);
        $string = str_ireplace('OR "a"="a',"",$string);
        $string = str_ireplace("OR ´a´=´a","",$string);
        $string = str_ireplace("OR ´a´=´a","",$string);
        $string = str_ireplace("--","",$string);
        $string = str_ireplace("^","",$string);
        $string = str_ireplace("[","",$string);
        $string = str_ireplace("]","",$string);
        $string = str_ireplace("==","",$string);
        $string = str_ireplace("'","",$string);
        $string = str_ireplace('"',"",$string);
        return $string;
    }

    function clear_cadena(string $cadena){
        //Reemplazamos la A y a
        $cadena = str_replace(
        array('Á', 'À', 'Â', 'Ä', 'á', 'à', 'ä', 'â', 'ª'),
        array('A', 'A', 'A', 'A', 'a', 'a', 'a', 'a', 'a'),
        $cadena
        );
 
        //Reemplazamos la E y e
        $cadena = str_replace(
        array('É', 'È', 'Ê', 'Ë', 'é', 'è', 'ë', 'ê'),
        array('E', 'E', 'E', 'E', 'e', 'e', 'e', 'e'),
        $cadena );
 
        //Reemplazamos la I y i
        $cadena = str_replace(
        array('Í', 'Ì', 'Ï', 'Î', 'í', 'ì', 'ï', 'î'),
        array('I', 'I', 'I', 'I', 'i', 'i', 'i', 'i'),
        $cadena );
 
        //Reemplazamos la O y o
        $cadena = str_replace(
        array('Ó', 'Ò', 'Ö', 'Ô', 'ó', 'ò', 'ö', 'ô'),
        array('O', 'O', 'O', 'O', 'o', 'o', 'o', 'o'),
        $cadena );
 
        //Reemplazamos la U y u
        $cadena = str_replace(
        array('Ú', 'Ù', 'Û', 'Ü', 'ú', 'ù', 'ü', 'û'),
        array('U', 'U', 'U', 'U', 'u', 'u', 'u', 'u'),
        $cadena );
 
        //Reemplazamos la N, n, C y c
        $cadena = str_replace(
        array('Ñ', 'ñ', 'Ç', 'ç',',','.',';',':'),
        array('N', 'n', 'C', 'c','','','',''),
        $cadena
        );
        return $cadena;
    }
    //Genera una contraseña de 10 caracteres
	function passGenerator($length = 10){
        $pass = "";
        $longitudPass=$length;
        $cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        $longitudCadena=strlen($cadena);

        for($i=1; $i<=$longitudPass; $i++)
        {
            $pos = rand(0,$longitudCadena-1);
            $pass .= substr($cadena,$pos,1);
        }
        return $pass;
    }
    //Genera un token
    function token(){
        $r1 = bin2hex(random_bytes(10));
        $r2 = bin2hex(random_bytes(10));
        $r3 = bin2hex(random_bytes(10));
        $r4 = bin2hex(random_bytes(10));
        $token = $r1.'-'.$r2.'-'.$r3.'-'.$r4;
        return $token;
    }
    function formatMoney($cantidad,$t4m=null){
        $cantidad = ((!empty($t4m))?$t4m['gt4_simbolo']:SMONEY).' '.number_format($cantidad,2,SPD,SPM);
        return $cantidad;
    }
    
    function getTokenPaypal(){
        $payLogin = curl_init(URLPAYPAL."/v1/oauth2/token");
        curl_setopt($payLogin, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($payLogin, CURLOPT_RETURNTRANSFER,TRUE);
        curl_setopt($payLogin, CURLOPT_USERPWD, IDCLIENTE.":".SECRET);
        curl_setopt($payLogin, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
        $result = curl_exec($payLogin);
        $err = curl_error($payLogin);
        curl_close($payLogin);
        if($err){
            $request = "CURL Error #:" . $err;
        }else{
            $objData = json_decode($result);
             $request =  $objData->access_token;
        }
        return $request;
    }

    function CurlConnectionGet(string $ruta, string $contentType = null, string $token){
        $content_type = $contentType != null ? $contentType : "application/x-www-form-urlencoded";
        if($token != null){
            $arrHeader = array('Content-Type:'.$content_type,
                            'Authorization: Bearer '.$token);
        }else{
            $arrHeader = array('Content-Type:'.$content_type);
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $ruta);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $arrHeader);
        $result = curl_exec($ch);
        $err = curl_error($ch);
        curl_close($ch);
        if($err){
            $request = "CURL Error #:" . $err;
        }else{
            $request = json_decode($result,true);
        }
        return $request;
    }

    function CurlConnectionPost(string $ruta, string $contentType = null, string $token){
        $content_type = $contentType != null ? $contentType : "application/x-www-form-urlencoded";
        if($token != null){
            $arrHeader = array('Content-Type:'.$content_type,
                            'Authorization: Bearer '.$token);
        }else{
            $arrHeader = array('Content-Type:'.$content_type);
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $ruta);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $arrHeader);
        $result = curl_exec($ch);
        $err = curl_error($ch);
        curl_close($ch);
        if($err){
            $request = "CURL Error #:" . $err;
        }else{
            $request = json_decode($result);
        }
        return $request;
    }

    function postRlegal($ruc){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://e-consultaruc.sunat.gob.pe/cl-ti-itmrconsruc/jcrS00Alias',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => 'accion=getRepLeg&contexto=ti-it&modo=1&desRuc=&nroRuc='.$ruc,
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/x-www-form-urlencoded',
            'Cookie: ITMRCONSRUCSESSION=pDmQvXcGCjsbhn8JKVp564J2jVGfTWjGK1T3SwCvt4zDJJ5bnQnmbL02hJVf1ThmzT3jPNhRgG7R5z4t1Nq2BmJhz105MYyZVkb8jYJghkf1sN13m9p1CG04vj96H2QJT2rS2wJNzkQl8rTYqXQTJZSWHGRngny1hsQ5r1Dm1WTTJgG1hf2SKfydTT9ZpTGynX5yPqYqqmYVk7K9wv0hkJdtvwY2yGcnTFXKJkQGkqyhJ1V1dlCLcL35hy4mXQ5H!-1914353685!-1326105119; TS01fda901=014dc399cb029b41464adbb371cd65790f72a0ab26da049d9568822b6ed220447408eb6bac47cce939529e0effb5832882b26b9e85ae5c0f949b3310e97a41b4d433de1d25'
        ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }
    function gettokens(){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://ose-gw1.efact.pe/api-efact-ose/oauth/token',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => 'username=20605347232&password=234e7819712af0b3de80b10e173df99f687f6c45ff9228c6174f9901c6100900&grant_type=password',
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/x-www-form-urlencoded',
            'Authorization: Basic Y2xpZW50OnNlY3JldA=='
        ),
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if($err){
            $arrData = array("error" => $err);
        }else{
            $arrData = json_decode($response,true);
        }
        return $arrData;
    }
    echo json_encode('asdgf 11',JSON_UNESCAPED_UNICODE);
	die();
    function document($token,$nombre,$content){
        $delimiter = uniqid();
        $postData = "--$delimiter\r\n"
        ."Content-Disposition: form-data; name=\"file\"; filename=\"$nombre\"\r\n"
        ."Content-Type: application/json\r\n\r\n"
        .$content
        ."\r\n--$delimiter--\r\n";

        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://ose-gw1.efact.pe/api-efact-ose/v1/document/',
        //CURLOPT_URL => 'http://localhost/erpregomsa/Postman/setCurls',
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_ENCODING => '',
        CURLOPT_FOLLOWLOCATION => 1,
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => $postData,
        CURLOPT_HTTPHEADER => array(
            "Authorization: Bearer ".$token,
            "Content-Type: multipart/form-data; boundary=".$delimiter,
            "Content-Length: " . strlen($postData),
            "Host: ose-gw1.efact.pe"
        ), 
        CURLOPT_SSL_VERIFYPEER => false    
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if($err){
            $arrData = array("error" => $err);
        }else{
            $arrData = json_decode($response,true);
        }
        return $arrData;
    }
    function curlEfactGet($url,$token,$com_ticket){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url.$com_ticket,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'Authorization: Bearer '.$token
        ),
        CURLOPT_SSL_VERIFYPEER => false 
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if($err){
            $arrData = array('status'=>false,"error" => $err);
        }else{
            if (is_json($response)) {
                $arrData = json_decode($response,true);
                $arrData['status'] = false;
            } else {
                $arrData = array("status" => true,"data"=>$response);
            }
        }
        return $arrData;
    }

    function is_json($data=NULL) {
        if (!empty($data) && !is_array($data) && $data != 1) {
            @json_decode($data);
            if (json_last_error() === JSON_ERROR_NONE) {
                return true;
            } else {
                return false;
            }
        }
        return false;
      }
      
    function Meses(){
        $meses = array("Enero", 
                      "Febrero", 
                      "Marzo", 
                      "Abril", 
                      "Mayo", 
                      "Junio", 
                      "Julio", 
                      "Agosto", 
                      "Septiembre", 
                      "Octubre", 
                      "Noviembre", 
                      "Diciembre");
        return $meses;
    }
    function is_fecha($string = ""){
        $date = explode('-',$string);
        return checkdate(1,$date[1],$date[0]);
    }
    function file_get_contents_ssl($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_REFERER, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3000); // 3 sec.
        curl_setopt($ch, CURLOPT_TIMEOUT, 10000); // 10 sec.
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
    function curl_core($url= BASE_URL.'/Main/get/gcl/1'){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPAUTH=>CURLAUTH_BASIC,
        CURLOPT_USERPWD=>'admin@companycacel.com:qwert',
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'gcl_id: 1',
            'alm_id: 1'
        ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        return $response;
    }
 ?>