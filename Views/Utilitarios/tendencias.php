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
    <div class="col-md-6">
      <div class="tile">
        <div class="tile-body">
          <figure class="highcharts-figure">
            <div id="ten_copper"></div>
            <p class="highcharts-description"></p>
          </figure>
        </div>
      </div>
    </div>
    <div class="col-md-6">
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