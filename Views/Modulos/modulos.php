<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="shortcut icon" href="<?= media();?>/images/logo_regomsa.png">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
    <title>Modulos</title>
</head>
<body class="bg-info">
    <main class="modules-content rounded-lg">
        <div class="row bg-white rounded-lg">
            <div class="col-md-4 d-flex flex-row justify-content-center align-items-center">
                <img src="<?= media(); ?>/images/logo_regomsa.png" alt="logo" width="250px">
            </div>
            <div class="col-md-8">
                <div  class="shadow-lg m-4 rounded-lg"id="modules"></div>
            </div>
        </div>
    </main>
</body>
</html>
<script>
    const base_url = "<?= base_url(); ?>";
Highcharts.chart('modules', {
    chart: {
        type: 'packedbubble',
        height: '100%'
    },
    title: {
        text: ''
    },
    exporting: {
        enabled: false
    },
    legend: {
        enabled: false
    },
    tooltip: {
        enabled: false,
        useHTML: true,
        pointFormat: 'More Inf.'
    },
    plotOptions: {
        packedbubble: {
            minSize: '30%',
            maxSize: '120%',
            zMin: 0,
            zMax: 1000,
            layoutAlgorithm: {
                splitSeries: false,
                gravitationalConstant: 0.05
            },
            dataLabels: {
                enabled: true,
                format: '{point.name}',
                filter: {
                    property: 'y',
                    operator: '>',
                    value: 10
                },
                style: {
                    color: 'black',
                    textOutline: 'none',
                    fontWeight: 'normal',
                    fontSize: '18px',
                    fontFamily: 'Impact, Charcoal, sans-serif'
                }
            }
        },
        series: {
            cursor: 'pointer',
            point: {
                events: {
                    click: function () {
                        location.href = base_url+ '/login'+ this.options.key;
                    }
                }
            },
            states: {
                inactive: {
                    opacity: 1
                }
            }
        }
    },
    series: [{
        name: 'Asia',
        data: [
        {
            name: "Ingresos",
            value: 150,
            key: ""
        }]
    },{
        name: 'Asia',
        data: [
        {
            name: "Egresos",
            value: 150,
            key: ""
        }]
    },{
        name: 'Asia',
        data: [
        {
            name: "Contabilidad",
            value: 150,
            key: ""
        }]
    },{
        name: 'Asia',
        data: [
        {
            name: "Planillas",
            value: 150,
            key: ""
        }]
    },{
        name: 'Asia',
        data: [
        {
            name: "Fiscal",
            value: 150,
            key: ""
        }]
    },{
        name: 'Asia',
        data: [
        {
            name: "Bancos y Efectivo",
            value: 150,
            key: ""
        }]
    },{
        name: 'Asia',
        data: [
        {
            name: "Logistico",
            value: 150,
            key: ""
        }]
    }]
});


</script>

