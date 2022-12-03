<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Eduardo Eulogio">
  <meta name="theme-color" content="#009688">
  <link rel="shortcut icon" href="<?= media();?>/images/logo_<?= CID?>.png">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="<?= media();?>/css/main.css">
  <link rel="stylesheet" type="text/css" href="<?= media();?>/css/style.css">

  <title><?= $data['page_tag']; ?></title>
</head>

<body class="bg-<?= CID?>">
  <section id="content" class="login-content">
    <div class="row p-5 bg-white rounded-lg">
    <div class="logo p-5 d-none d-sm-block" >
      <img src="<?= media(); ?>/images/logo_<?= CID?>.png" alt="logo" width="250px">
    </div>
    <div id="box-log" class="login-box rounded-lg">
      <div id="divLoading">
        <div>
          <img src="<?= media(); ?>/images/loading.svg" alt="Loading">
        </div>
      </div>
      
      <form class="login-form" name="formLogin" id="formLogin" action="">
        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>INICIAR SESIÓN</h3>
        <div class="form-group">
          <label class="control-label">USUARIO</label>
          <input id="gus_user" name="gus_user" class="form-control" type="email" placeholder="Email" autofocus>
        </div>
        <div class="form-group">
          <label class="control-label">CONTRASEÑA</label>
          <input id="gus_password" name="gus_password" class="form-control" type="password" placeholder="Contraseña">
        </div>
       
        <div class="form-group">
          <div class="utility">
            <p class="semibold-text mb-2"><a href="#" data-toggle="flip1">¿Olvidaste tu contraseña?</a></p>
          </div>
        </div>
        <div id="alertLogin" class="text-center"></div>
        <div class="form-group btn-container">
          <button  type="submit" class="btn btn-primary btn-block" ><i class="fas fa-sign-in-alt"></i> INICIAR
            SESIÓN</button>
        </div>
      </form>
      <form id="formSelectEmpresa" name="formSelectEmpresa" class="forget-form" action="">
        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>¿Seleccione una Empresa?</h3>
        <div class="form-group">
          <label class="control-label">EMPRESAS</label>
          <select class="form-control" data-live-search="true" id="gac_gcl_id" name="gac_gcl_id" required >
          </select>
        </div>
        <div class="form-group btn-container">
          <button type="submit" class="btn btn-primary btn-block"><i
              class="fas fa-sign-in-alt"></i>INICIAR</button>
        </div>
        <div class="form-group mt-3">
        <p class="semibold-text mb-2"><a href="#" data-toggle="flip2">Regresar</a></p>
        </div>
      </form>

      <form id="formSelectEstablecimientos" name="formSelectEstablecimientos" class="login-form" action="">
        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>¿Seleccione Almacen?</h3>
        <div class="form-group">
          <label class="control-label">ESTABLECIMIENTOS</label>
          <select class="form-control" data-live-search="true" id="est_id" name="est_id" required >
          </select>
        </div>
        <div class="form-group btn-container">
          <button type="submit" class="btn btn-primary btn-block"><i
              class="fas fa-sign-in-alt"></i>INICIAR</button>
        </div>
        <div class="form-group mt-3">
          <p class="semibold-text mb-2"><a href="#" data-toggle="flip3">Regresar</a></p>
        </div>
      </form>

      <form id="formRecetPass" name="formRecetPass" class="forget-form" action="">
        <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>¿Olvidaste contraseña?</h3>
        <div class="form-group">
          <label class="control-label">EMAIL</label>
          <input id="gus_user_r" name="gus_user_r" class="form-control" type="email" placeholder="Email">
        </div>
        <div class="form-group btn-container">
          <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>REINICIAR</button>
        </div>
        <div class="form-group mt-3">
          <p class="semibold-text mb-0"><a href="#" data-toggle="flip2"><i class="fa fa-angle-left fa-fw"></i> Iniciar
              sesión</a></p>
        </div>
      </form>

    </div>
    </div>
  </section>
  <script>
    const base_url = "<?= base_url(); ?>";
  </script>
  <!-- Essential javascripts for application to work-->
  <script src="<?= media(); ?>/js/jquery-3.3.1.min.js"></script>
  <script src="<?= media(); ?>/js/popper.min.js"></script>
  <script src="<?= media(); ?>/js/bootstrap.min.js"></script>
  <script src="<?= media(); ?>/js/fontawesome.js"></script>
  <script src="<?= media(); ?>/js/functions_main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="<?= media(); ?>/js/plugins/pace.min.js"></script>
  <script type="text/javascript" src="<?= media();?>/js/plugins/sweetalert.min.js"></script>
  <script src="<?= media(); ?>/js/<?= $data['page_functions_js']; ?>"></script>
</body>

</html>