
<?php 
	if($grafica = "graficasCompraMes"){
		$registroMes = $data;
 ?>
<script>
	  Highcharts.chart('graficasCompraMes', {
	      chart: {
	          type: 'line'
	      },
	      title: {
	          text: 'Compras de <?= $registroMes['mes'].' del '.$registroMes['anio'] ?>'
	      },
	      subtitle: {
	          text: 'Total Compras <?= SMONEY.'. '.formatMoney($registroMes['registros']['total']) ?> '
	      },
	      xAxis: {
	          categories: [
	            <?php 
	                foreach ($registroMes['registros'] as $dia) {
	                  echo $dia['dia'].",";
	                }
	            ?>
	          ]
	      },
	      yAxis: {
	          title: {
	              text: ''
	          }
	      },
	      plotOptions: {
	          line: {
	              dataLabels: {
	                  enabled: true
	              },
	              enableMouseTracking: false
	          }
	      },
	      series: [{
	          name: '',
	          data: [
	            <?php 
	                foreach ($registroMes['registros'] as $dia) {
	                  echo $dia['total'].",";
	                }
	            ?>
	          ]
	      }]
	  });
</script>
 <?php } ?>
 <?php 
	if($grafica = "graficasVentaMes"){
		$registroMes = $data;
 ?>
<script>
	  Highcharts.chart('graficasVentaMes', {
	      chart: {
	          type: 'line'
	      },
	      title: {
	          text: 'Ventas de <?= $registroMes['mes'].' del '.$registroMes['anio'] ?>'
	      },
	      subtitle: {
	          text: 'Total Ventas <?= SMONEY.'. '.formatMoney($registroMes['registros']['total']) ?> '
	      },
	      xAxis: {
	          categories: [
	            <?php 
	                foreach ($registroMes['registros'] as $dia) {
	                  echo $dia['dia'].",";
	                }
	            ?>
	          ]
	      },
	      yAxis: {
	          title: {
	              text: ''
	          }
	      },
	      plotOptions: {
	          line: {
	              dataLabels: {
	                  enabled: true
	              },
	              enableMouseTracking: false
	          }
	      },
	      series: [{
	          name: '',
	          data: [
	            <?php 
	                foreach ($registroMes['registros'] as $dia) {
	                  echo $dia['total'].",";
	                }
	            ?>
	          ]
	      }]
	  });
</script>
 <?php } ?>
 <?php 
	if($grafica = "graficasInventario"){
		// $registroMes = $data;
 ?> 
<script>
	 const config = {
  type: 'doughnut',
  data: data,
};
const data = {
  labels: [
    'Red',
    'Blue',
    'Yellow'
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [300, 50, 100],
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)'
    ],
    hoverOffset: 4
  }]
};
</script>
 <?php } ?>