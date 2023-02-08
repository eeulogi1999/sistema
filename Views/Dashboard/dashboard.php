<?php 
    headerAdmin($data); 
?>
<main class="app-content">
  <div class="app-title">
    <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
    </h1>
    <div class="d-flex">
      <span class="d-flex align-items-center mr-2">SUNAT</span>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="dol">$ </span>
        </div>
        <input type="text" class="form-control" id="gtc_dol" placeholder="DOLARES" aria-describedby="dol" size="10">
      </div>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="sol">S/</span>
        </div>
        <input type="text" class="form-control" id="gtc_sol" placeholder="SOLES" aria-describedby="sol" size="10">
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm" id="ten_table" width="100%"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-4">
      <div class="tile">
        <div class="tile-body">
          <!-- <h5 class="text-center">NOTAS</h5> -->
          <!-- PRECIOS ACTUALIZADOS 
            Brillo 31.50
            Grueso 30
            Delgado 29
            Grupo 5.10 
            Bronce 19.50
            Rad.bronce 17
            Viruta de bronce 14
            Duro 5.40
            Perfil 6.20
            Acero 4
            Rad. Aluminio 4
            Olla sucia 4.50
            Olla limpia 5.50
            Oxee 6
            Batería 67
            Chata 57
            Tierra bateria 3.90
            Cocalata 3.80
            Cable 6.50
            Cable grasa 6
            Cable sulfatado 5.5
            Carrocería 4.50
            Antimonio 8
            Chapa 2 -->
          <figure class="highcharts-figure">
            <div id="ten_copper"></div>
            <p class="highcharts-description"></p>
          </figure>
        </div>
      </div>
    </div>
    <!-- <div class="col-md-4">
      <div class="tile">
        <div class="tile-body">
          <figure class="highcharts-figure">
            <div id="ten_plomo"></div>
            <p class="highcharts-description"></p>
          </figure>
        </div>
      </div>
    </div> -->
    <?php if ($_SESSION['gcl']['gcl_gem_id']['gem_ruc'] == '20609315327') { ?>
    <div class="col-md-8">
      <div class="tile">
        <div class="tile-body">
          <h4 class="text-center">CUENTAS</h4>
          <div>BCP DOLARES: 191-9932896-1-90 &nbsp;&nbsp;-&nbsp;&nbsp; CCI: 002 191 009932896190 51</div>
          <div>BCP SOLES: &nbsp;&nbsp; 191-9938278-0-44 &nbsp;&nbsp;-&nbsp;&nbsp; CCI: 002 191 0099382788044 55 </div><br>
          <h4 class="text-center">DOCUMENTOS</h4>
          <?php 
            $files = scandir(__DIR__.'/../../Assets/pdf/private');
            for ($i=2; $i < count($files) ; $i++) { ?>
              <?= $i-1 ?>- <a target="_bank" href="<?= media().'/pdf/private/'.$files[$i] ?>"><?= $files[$i] ?></a><br>
           <?php } ?>
          <h4 class="text-center">SUGERENCIAS</h4>
          <div>1 - Mantener actulizado las Ordenes de Venta en el sistema, para nuestra mejor orden administrativo.</div>
          <div>2 - Proporcionar factura o boleta del tipo de cambio dolares a nombre de la empresa y hacer entrega
            mensual a nuestro equipo.</div>
          <div>3 - Proporcionar las facturas de pago de los gastos aduaneros TPP y/o otros junto con constancia de pago.
          </div>
          <div>4 - Proporcionar los documentos de la dua mensualmente y dar seguimiento hasta que sarpe la nave para
            evitar problemas.</div>
          <div>5 - Cada INGRESO O SALIDA de la cuenta SOLES O DOLARES empresa EXPORTADORA, solo sera de acuerdo a su
            movimiento de sus (FACTURAS).</div>
          <div>6 - NO INGRESAR dinero libre a las cuentas Soles o Dolares / solo sera movimientos con comprabantes (LEY
            BANCARIZACION).</div>
          <div>7 - Cuadre liquides según avance de las ventas.</div>
          <div class="text-uppercase">8 - Mantener comunicación fluida con nuestro equipo ayudara a no tener problemas
            futuros.</div>
          <br>
          <h4 class="text-center">SEGURIDAD</h4>
              <div>1. No compartir con terceros ni guardar la contraseña del sistema en la Computadora</div>
              <div>2. No mantener la sesión y/o ventana abierta si no se esta operando</div>
              <div>3. Ayudanos a proteger nuestros datos, ¡proteger los datos significa proteger a las personas!</div><br>
          <h4 class="text-center">CONFIDENCIALIDAD</h4>
          <div>SE OBLIGA A NO REVELAR LA EXISTENCIA DE LA PRESENTE DECLARACIÓN, EMPRESA, SISTEMA Y/O PROYECTO. Las
            partes acuerdan que cualquier información intercambiada,
            facilitada o creada entre ellas durante el desarrollo del plan, <strong>será mantenida en estricta
              CONFIDENCIALIDAD.</strong> </div>
              <div>La parte receptora correspondiente, <strong>sólo podrá revelar información confidencial
              a quienes la necesiten y estén autorizados previamente por la parte de CUYA INFORMACION CONFIDENCIAL SE
              TRATA.</strong> </div>
          <!-- <figure class="highcharts-figure">
            <div id="ten_usd"></div>
            <p class="highcharts-description"></p>
          </figure> -->
        </div>
      </div>
    </div>
    <?php  } ?>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <h4>NOTICIAS</h4>
          <a href="https://www.cochilco.cl/Paginas/Estudios/Mercados%20de%20metales%20e%20insumos%20estrat%C3%A9gicos/Informes-Semanales-2015.aspx"
            target="_bank">COCHILCO</a>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>