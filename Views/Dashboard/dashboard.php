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
  <div class="row" style="height:200px">
    <div class="col-md-4">
      <div class="tile" style="height: 85%;">
        <div class="tile-body">
          <div id="dailyVersesWrapper" class="display-6"></div>
          <!-- <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm" id="ten_table" width="100%"></table>
          </div> -->
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="tile" style="height: 85%;">
        <div class="tile-body display-6">
          El éxito no es la clave de la felicidad. La felicidad es la clave del éxito – Albert Schweitzer
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="tile" style="height:85%;overflow-y:auto;">
        <h4 class="text-center">NOTICIAS</h4>
        <div class="tile-body">
          <a href="https://www.cochilco.cl/Paginas/Estudios/Mercados%20de%20metales%20e%20insumos%20estrat%C3%A9gicos/Informes-Semanales-2015.aspx"
            target="_bank">COCHILCO</a><br>
          <a href="https://www.lme.com/Metals/Non-ferrous/LME-Copper#Trading+day+summary" target="_bank">LME</a><br>
          <a href="https://es.investing.com/commodities/copper?cid=959211" target="_bank">INVESTING</a><br>
          <a href="https://www.expansion.com/mercados/cotizaciones/materias/cobre(londres)_MCU.html" target="_blank"
            rel="noopener noreferrer">EXPANSIÓN</a>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-4">
      <div class="tile">
        <h3 class="text-center">NOTAS DE PRECIOS</h3>
        <div class="tile-body">
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
                aria-selected="true">GENERAL</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
                aria-selected="false">.</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                aria-selected="false">..</a>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active p-3" id="home" role="tabpanel" aria-labelledby="home-tab">
              <div class="table-responsive">
                <div class="tex px-2 text-uppercase" style="display:none;font-size: 16px;">Buen día envío precios,<br>
                Cualquier variación en los precios se les estará informando.</div>
                <div class="px-2" style="display:none">ULTIMA ACTUALIZACIÓN: <span class="update"></span></div>
                <table class="table table-bordered table-sm" id="gen_table" width="100%"></table>
              </div>
              <button class="btn btn-success" onClick="share('gen',event)"><i
                  class="fas fa-share"></i>Compartir</button>
            </div>
            <div class="tab-pane fade p-3" id="profile" role="tabpanel" aria-labelledby="profile-tab">
              <div class="table-responsive">
                <div class="tex px-2 text-uppercase" style="display:none;font-size: 16px;">Buen día envío precios,<br>
                Cualquier variación en los precios se les estará informando.</div>
                <div class="px-2" style="display:none">ULTIMA ACTUALIZACIÓN: <span class="update"></span></div>
                <table class="table table-bordered table-sm" id="fre_table" width="100%"></table>
              </div>
              <button class="btn btn-success" onClick="share('fre',event)"><i
                  class="fas fa-share"></i>Compartir</button>
            </div>
            <div class="tab-pane fade p-3" id="contact" role="tabpanel" aria-labelledby="contact-tab">
              <div class="table-responsive">
                <div class="tex px-2 text-uppercase" style="display:none; font-size: 16px;">Buen día envío precios,<br>
                Cualquier variación en los precios se les estará informando.</div>
                <div class="px-2" style="display:none">ULTIMA ACTUALIZACIÓN: <span class="update"></span></div>
                <table class="table table-bordered table-sm" id="con_table" width="100%"></table>
              </div>
              <button class="btn btn-success" onClick="share('con',event)"><i
                  class="fas fa-share"></i>Compartir</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-8">
      <div class="tile">
        <h4 class="text-center">DOCUMENTOS</h4>
          <?php 
            $files = scandir(__DIR__.'/../../Assets/public');
            for ($i=2; $i < count($files) ; $i++) { ?>
              <?= $i-1 ?>- <a target="_bank" href="<?= media().'/public/'.$files[$i] ?>"><?= $files[$i] ?></a><br>
           <?php } ?>
        <h4 class="text-center">SUGERENCIAS</h4>
        <div class="tile-body">
          <div>- Ayudanos a reducir errores y ser mas eficientes.</div>
          <div>- Para bien de nuestra Empresa y sistema, Actualizar los datos en el menor tiempo posible.</div>
          <div></div>
        </div>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>
<script async defer src="https://dailyverses.net/get/random.js?language=nvi"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>