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
          <div id="dailyVersesWrapper" class="display-5"></div>
          <!-- <div class="table-responsive">
            <table class="table table-hover table-bordered table-sm" id="ten_table" width="100%"></table>
          </div> -->
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-8">
      <div class="tile">
        <h3 class="text-center">NOTAS DE PRECIOS</h3>
        <div class="tile-body">
          <div class="row">
            <div class="col">
              <h4 class="text-center">GENERAL</h4>
              <table class="table table-bordered table-sm">
                <thead>
                  <th>MATERIAL</th>
                  <th>PRECIO</th>
                </thead>
                <tbody>
                  <tr>
                    <td>BRILLANTE</td>
                    <td>30.10</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="col">
              <h4 class="text-center">FRECUENTE</h4>
              <table class="table table-bordered table-sm">
                <thead>
                  <th>MATERIAL</th>
                  <th>PRECIO</th>
                </thead>
                <tbody>
                  <tr>
                    <td>BRILLANTE</td>
                    <td>30.10</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="col">
              <h4 class="text-center">COMPLETA</h4>
              <table class="table table-bordered table-sm">
                <thead>
                  <th>MATERIAL</th>
                  <th>PRECIO</th>
                </thead>
                <tbody>
                  <tr>
                    <td>BRILLANTE</td>
                    <td>30.10</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="tile">
        <h4 class="text-center">NOTICIAS</h4>
        <div class="tile-body">
          <a href="https://www.cochilco.cl/Paginas/Estudios/Mercados%20de%20metales%20e%20insumos%20estrat%C3%A9gicos/Informes-Semanales-2015.aspx"
           target="_bank" >COCHILCO</a><br>
          <a href="https://www.lme.com/Metals/Non-ferrous/LME-Copper#Trading+day+summary" target="_bank">LME</a><br>
          <a href="https://es.investing.com/commodities/copper?cid=959211" target="_bank">EXPANCIÓN</a>
        </div>

        <!-- <figure class="highcharts-figure">
            <div id="ten_usd"></div>
            <p class="highcharts-description"></p>
          </figure> -->
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>