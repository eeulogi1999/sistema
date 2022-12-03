<?php headerAdmin($data); ?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-dashboard"></i><?= $data['page_title'] ?></h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/dashboard">Dashboard</a></li>
    </ul>
  </div>

  <!-- <div id="wizard" class="form_wizard wizard_horizontal">
        <ul class="wizard_steps">
          <li>
            <a href="#step-1" class="selected" id="fase1" >
              <span class="step_no"  id="step1">1</span>
              <span class="step_descr">
                Productos(Materia Prima)<br />
                <small>Almacen 1</small>
              </span>
            </a>
          </li>
          <li>
            <a href="#step-2" id="fase2" class="done">
              <span class="step_no" id="step2">2</span>
              <span class="step_descr">
                Productos en Proceso<br />
                <small>Almacen 1</small>
              </span>
            </a>
          </li>
          <li>
            <a href="#step-3" id="fase3" class="done">
              <span class="step_no" id="step3">3</span>
              <span class="step_descr">
                Productos Terminados<br />
                <small>Almacen 1</small>
              </span>
            </a>
          </li>

        </ul>  
      </div>    -->
  <div class="row">
    <?php if(!empty($_SESSION['permisos'][2]['r'])){ ?>
    <div class="col-md-6 col-lg-3">
      <a href="<?= base_url() ?>/usuarios" class="linkw">
        <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
          <div class="info">
            <h4>Usuarios</h4>
            <!-- <p><b><?= $data['usuarios'] ?></b></p> -->
          </div>
        </div>
      </a>
    </div>
    <?php } ?>
    <?php if(!empty($_SESSION['permisos'][3]['r'])){ ?>
    <div class="col-md-6 col-lg-3">
      <a href="<?= base_url() ?>/clientes" class="linkw">
        <div class="widget-small info coloured-icon"><i class="icon fa fa-user fa-3x"></i>
          <div class="info">
            <h4>Clientes</h4>
            <!-- <p><b><?= $data['clientes'] ?></b></p> -->
          </div>
        </div>
      </a>
    </div>
    <?php } ?>
    <?php if(!empty($_SESSION['permisos'][4]['r']) ){ ?>
    <div class="col-md-6 col-lg-3">
      <a href="<?= base_url() ?>/productos" class="linkw">
        <div class="widget-small warning coloured-icon"><i class="icon fa fa fa-archive fa-3x"></i>
          <div class="info">
            <h4>Productos</h4>
            <!-- <p><b><?= $data['productos'] ?></b></p> -->
          </div>
        </div>
      </a>
    </div>
    <?php } ?>
    <?php if(!empty($_SESSION['permisos'][5]['r'])){ ?>
    <div class="col-md-6 col-lg-3">
      <a href="<?= base_url() ?>/pedidos" class="linkw">
        <div class="widget-small danger coloured-icon"><i class="icon fa fa-shopping-cart fa-3x"></i>
          <div class="info">
            <h4>Pedidos</h4>
            <!-- <p><b><?= $data['pedidos'] ?></b></p> -->
          </div>
        </div>
      </a>
    </div>
    <?php } ?>
  </div>

  <div class="row">
    <div class="col-md-6">
      <div class="tile">
        <div class="container-title">
          <h3 class="tile-title">COMPRAS POR SEMANA</h3>
          <div class="dflex">
            <input class="date-picker ventasMes" id="comprasMes" name="comprasMes" placeholder="Mes y Año">
            <button type="button" class="btnVentasMes btn btn-info btn-sm" onclick="fntSearchCMes()"> <i
                class="fas fa-search"></i> </button>
          </div>
        </div>
        <div id="graficasCompraMes"></div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="tile">
        <div class="container-title">
          <h3 class="tile-title">VENTAS POR SEMANA</h3>
          <div class="dflex">
            <input class="date-picker ventasMes" id="ventasMes" name="ventasMes" placeholder="Mes y Año">
            <button type="button" class="btnVentasMes btn btn-info btn-sm" onclick="fntSearchVMes()"> <i
                class="fas fa-search"></i> </button>
          </div>
        </div>
        <div id="graficasVentaMes"></div>
      </div>
    </div>
   <!--  <div id="graficasInventario">
      <select class="form-control" data-live-search="true" id="listArticulo" name="listArticulo" 
        tabindex="-98">
        <option value="1">CALIBRADOR 8X1/128/200MM C/M</option>
        <option value="2">CINTA METRICA 100 M STANLEY</option>
        <option value="3">CIZALLA TIJERA 18'' ACERO</option>
        <option value="4">ESTANTE METALICO RIVET GORILA</option>
        <option value="5">LAMPAS</option>
        <option value="6">COSTALES MINEROS (CIENTO)</option>
        <option value="7">WINCHA 50M</option>
        <option value="8">BOLSAS DE MUESTREO (CIENTO)</option>
        <option value="9">PLATAFORMA DE CARGA 453.6 KG</option>
        <option value="10">AUTOTRANSFORMADOR 220 - 110 V </option>
        
      </select>
    </div>
  </div>-->
  
</main>
<?php footerAdmin($data); ?>