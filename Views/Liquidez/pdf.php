<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuadro de Liquidez</title>
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= media();?>/css/bootstrap-select.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
</head>
<body>
    <table class="table table-hover table-sm ">
        <thead>
            <tr>
                <th colspan="2" class="text-center">DETALLE DE LIQUIDEZ</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                <table class="table table-hover table-bordered table-sm ">
        <thead>
            <tr><th colspan="6" class="text-center">INGRESOS</th></tr>
            <tr>
                <th>#</th>
                <th>FECHA</th>
                <th>TIPO</th>
                <th>CUENTA</th>
                <th>DESCRIPCION</th>
                <th>TOTAL</th>
            </tr>
        </thead>
        <tbody>
            <tr></tr>
        </tbody>
        <tfoot></tfoot>
    </table>
                </td>
                <td>
                <table class="table table-hover table-bordered table-sm ">
        <thead colspan="6">
        <tr><th colspan="6" class="text-center">SALIDAS</th></tr>
            <tr>
                <th>#</th>
                <th>FECHA</th>
                <th>TIPO</th>
                <th>CUENTA</th>
                <th>DESCRIPCION</th>
                <th>TOTAL</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
        <tfoot></tfoot>
    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>