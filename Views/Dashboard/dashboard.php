<?php 
    headerAdmin($data); 
?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fas fa-user-tag"></i> <?= $data['page_title'] ?>
      </h1>
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
          <h5 class="text-center">NOTAS</h5>
          PRECIOS ACTUALIZADOS 
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
Chapa 2
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="tile">
        <div class="tile-body">
          <figure class="highcharts-figure">
            <div id="ten_copper"></div>
            <p class="highcharts-description"></p>
          </figure>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="tile">
        <div class="tile-body">
          <figure class="highcharts-figure">
            <div id="ten_usd"></div>
            <p class="highcharts-description"></p>
          </figure>
        </div>
      </div>
    </div>
  </div>


</main>
<?php footerAdmin($data); ?>