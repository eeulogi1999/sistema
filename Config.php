<?php
	define('BASE_URL',$_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].((isset($_SERVER['HTTPS']))?'':'/'.basename(dirname(__FILE__))));
	//define('BASE_URL',$_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST']);
	const PHPID = "erpsocios";  // erpregomsa, erpcacel ,erpegest ,erpsocios
	const CID = "cacel";  //regomsa,cacel, egest

	//Zona horaria
	date_default_timezone_set('America/Lima');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";

	const DB_SUBNAME = "company5_se_"; 
	const DB_NAME = "company5_se_socios";

	const DB_USER = "company5_root";
	const DB_PASSWORD = "1root-SOM";

	const DB_CHARSET = "utf8";

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "S/";
	const CURRENCY = "SOLES";

	const BG = array('cacel'=>'"#711529 !important"','regomsa'=>'"#009688 !important"','egest'=>'"##00aa8d !important"');
	const PPA_TIPO = array('Planilla','Adelanto');
	//Api PayPal
	//SANDBOX PAYPAL
	const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "AYcF2p8R-9gV_iUQ1AGdOz_6vOAc_jwwUSfCC4FQr6bWLT_7_d4mbDFrv1ulNnelVZcicrJwgwVwJIRF";
	const SECRET = "EIhyWpvOuPhIBhTKG54dyTJ2HtFc-EbegpQgsyqQkHKqRzZTu0zzdHr9_M7A7u25hNG0o_NySx8wBuCt";
	//LIVE PAYPAL
	//const IDCLIENTE = "AWBtVubwv1loCQFkpbwVdxw3GN9v4wj8ieLQPCpm8i8v0iwHSO_wc1_fWPNqldrcrPh1RqQ1bIcZPKWD";
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const SECRET = "ELCYtuxTFft8kEuAhcg8jE7_Bi31BnMd8E4DilpsnnsgXnZRUA8AKiXHwOVSPVu7xFIDZYw_6AjXulyC";


	//Api PayPal
	const URLEFACT = array('cdr'=>'https://ose-qa-rest.efact.pe/api-efact-ose/v1/cdr/',
							'xml'=>'https://ose-qa-rest.efact.pe/api-efact-ose/v1/xml/',
							'pdf'=>'https://ose-qa-rest.efact.pe/api-efact-ose/v1/pdf/');


	//Datos envio de correo
	const NOMBRE_REMITENTE = "Sistema Cacel";
	const EMAIL_REMITENTE = "no-reply@companycacel.com";
	const NOMBRE_EMPESA = "Comap SAC";
	const WEB_EMPRESA = "www.companycacel.com";

	const DESCRIPCION = "SISTEMA ERP CONTABLE";
	const SHAREDHASH = "ErpContable";

	//Datos Empresa
	const DIRECCION = "Avenida las Américas Zona 13, Guatemala";
	const TELEMPRESA = "+(502)78787845";
	const WHATSAPP = "+50278787845";
	const EMAIL_EMPRESA = "admin@companycacel.com";
	const EMAIL_PEDIDOS = "admin@companycacel.com"; 
	const EMAIL_SUSCRIPCION = "admin@companycacel.com";

	const CAT_SLIDER = "1,2,3";
	const CAT_BANNER = "4,5,6";
	const CAT_FOOTER = "1,2,3,4,5";

	//Datos para Encriptar / Desencriptar
	const KEY = 'sige-cacel';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 50;

	//Módulos
	const MCLIENTES = 3;
	const MPEDIDOS = 5;
	const MSUSCRIPTORES = 7;

	//Roles
	const RADMINISTRADOR = 1;
	const RCLIENTES = 7;


	const AGE_TIPO = array('MIXTO'=>'warning','PROVEEDOR'=>'primary','CLIENTE'=>'success');
	
	const CAJ = array('scuentas','Ingresos','Egresos','Gastos','Iadicionales','Cinternos','Nota-Credito','Nota-Debito');
	//Stados
	const STATUS = array('INACTIVO'=>'primary','ACTIVO'=>'success','ELIMINADO'=>'danger');
	const NCR_MOT = array(
		array('mot_id'=>1 , 'mot_codigo'=>'01', 'mot_descripcion'=>'Anulación de la operación'),
		array('mot_id'=>2 , 'mot_codigo'=>'02', 'mot_descripcion'=>'Anulación por error en el RUC'),
		array('mot_id'=>3 , 'mot_codigo'=>'03', 'mot_descripcion'=>'Corrección por error en la descripción'),
		array('mot_id'=>4 , 'mot_codigo'=>'04', 'mot_descripcion'=>'Descuento global'),
		array('mot_id'=>5 , 'mot_codigo'=>'05', 'mot_descripcion'=>'Descuento por ítem'),
		array('mot_id'=>6 , 'mot_codigo'=>'06', 'mot_descripcion'=>'Devolución total'),
		array('mot_id'=>7 , 'mot_codigo'=>'07', 'mot_descripcion'=>'Devolución por ítem'),
		array('mot_id'=>8 , 'mot_codigo'=>'08', 'mot_descripcion'=>'Bonificación'),
		array('mot_id'=>9 , 'mot_codigo'=>'09', 'mot_descripcion'=>'Disminución en el valor'),
		array('mot_id'=>10 ,'mot_codigo'=>'10', 'mot_descripcion'=>'Otros Conceptos'),
		array('mot_id'=>11 ,'mot_codigo'=>'11', 'mot_descripcion'=>'Ajustes de operaciones de exportación'),
		array('mot_id'=>12 ,'mot_codigo'=>'12', 'mot_descripcion'=>'Ajustes afectos al IVAP')
		);
	const CSTATUS = array(array('CANCELADO','dark'),
				array('GUARDADO','primary'),
				array('EMITIDO','info'),
				array('ANULADO','danger'),
				array('RECHAZADO','warning'),
				array('VALIDADO','success'));
	const MSTATUS = array(
					array('ANULADO','danger'),
					array('GUARDADO','primary'),
					array('CONFORME','success'),
					array('OBSERVADO','warning')
					);
	//const MSTATUS = array('CONFORME','OBSERVADO','ANULADO');
	const T9P = array('Cuentas de orden Acreedoras,Cuentas de orden Deudoras',
	'Activo','Activo','Activo','Pasivo','Patrimonio','Gastos por Naturaleza',
	'Ingresos','Saldos intermediarios de gestión','Cuentas analíticas o de explotación');

	//Productos por página
	const CANTPORDHOME = 8;
	const PROPORPAGINA = 4;
	const PROCATEGORIA = 4;
	const PROBUSCAR = 4;

	//REDES SOCIALES
	//const FACEBOOK = "https://www.facebook.com/abelosh";
	//const INSTAGRAM = "https://www.instagram.com/febel24/";
	

 ?>