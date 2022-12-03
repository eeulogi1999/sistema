<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="Sistema CompanyCacel">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Eduardo Eulogio">
    <meta name="theme-color" content="#009688">
    <link rel="shortcut icon" href="<?= media();?>/images/logo_<?= CID?>.png">
    <title><?= $data['page_tag'] ?></title>
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/bootstrap-select.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/js/datepicker/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?= libraries()?>/webix-master/codebase/webix.css"  charset="utf-8" >
    <link rel="stylesheet" type="text/css" href="<?= libraries()?>/fullcalendar-5.11.3/lib/main.css">
    <link rel="stylesheet" href="<?= libraries()?>/jQuery-contextMenu-master/dist/jquery.contextMenu.min.css">
  </head>
  <body class="app sidebar-mini">
    <div id="divLoading" >
      <div>
        <img src="<?= media(); ?>/images/loading.svg" alt="Loading">
      </div>
    </div>
    <!-- Navbar-->
    <header class="app-header bg-<?= CID?>">
      <a class="app-header__logo bg-<?= CID?>" href="<?= base_url(); ?>/dashboard">SIGE</a>
      <!-- Sidebar toggle button-->
      <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"><i class="fas fa-bars"></i></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <!-- User Menu-->
        <?php if(!empty($_SESSION['per'][3]['r'])){ ?>
        <li>
          <div class="app-nav__item p-2">
          <select class="form-control" data-live-search="true" id="listEmpresas" name="listEmpresas"></select>
          </div>
        </li>
        <?php } ?>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
          <i class="fas fa-building"><span class="pl-2"><?= $_SESSION['gcl']['gcl_gem_id']['gem_razonsocial'] ?></span></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="<?= base_url() ?>/empresas/perfil"><i class="fa fa-user fa-lg"></i> Perfil</a></li>
            <li></li>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
          <i class="fas fa-warehouse"><span class="pl-2"><?= ucfirst($_SESSION['est']['est_nombre']); ?></span></i></a>
          <ul id="est_all" class="dropdown-menu settings-menu dropdown-menu-right">
            <?php if (isset($data['estData'])) {
                foreach ($data['estData'] as $i => $est) { ?>
            <li><a class="dropdown-item" href="<?= base_url() ?>/Main/setChangeEst/<?= $est['est_id'] ?>"><?= $est['est_nombre'] ?></a></li>
            <?php }  } ?>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
          <i class="fa fa-user fa-lg"><span class="pl-2"><?= "Usuario"?></span> </i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="<?= base_url(); ?>/opciones"><i class="fa fa-cog fa-lg"></i> Ajustes</a></li>
            <li><a class="dropdown-item" href="<?= base_url(); ?>/usuarios/perfil"><i class="fa fa-user fa-lg"></i> Perfil</a></li>
            <li><a class="dropdown-item" href="<?= base_url(); ?>/logout"><i class="fa fa-sign-out fa-lg"></i> Salir</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <?php require_once("nav_admin.php"); ?>