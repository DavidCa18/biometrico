<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Biometric | Gestión de Personal</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

        <link href="css/animate.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body class="gray-bg" onload="nobackbutton();">

        <div class="lock-word animated fadeInDown">

        </div>
        <div class="middle-box text-center lockscreen animated fadeInDown">
            <div>
                <div class="m-b-md">
                    <img alt="image"  src="img/index.png">
                </div>
                <h3>Bienvenidos al sistema  BIOMETRIC</h3>
                <p>Ingresar el código proporcionado para registrar el producto.</p>
                <div class="form-group">
                    <input type="text" class="form-control" id="codigo">
                </div>
                <button type="submit" class="btn btn-success block full-width" id="btnGuardarLicencia">Registrar</button>
            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
        function nobackbutton() {
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button" //chrome
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            };
        }
        </script>
        <script>


            $("#btnGuardarLicencia").click(function (e) {
                if ($('#codigo').val().length > 0) {
                    var serial = $('#codigo').val();
                    GuardarLicenciaAPI(serial);
                } else {
                    alert('INGRESAR LICENCIA EN EL CAMPO DE TEXTO');
                }
            });

            function GuardarLicenciaDB(serial) {

                $.ajax({
                    type: 'GET',
                    url: 'ServletValidarGuardar',
                    data: {serial: serial},
                    success: function (data) {
                        
                        if (data[0].msm == 'CODIGO DE VERIFICACION REGISTRADO EXITOSAMENTE DB') {
                            alert('EXITO:' + data[0].msm);
                            location.replace('index.jsp');
                        } else {
                            alert('NO:' + data[0].msm);
                            RollbackLicenciaAPI(serial);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert('ERROR DB:' + xhr + ajaxOptions + thrownError);
                    }
                });
            }

            function GuardarLicenciaAPI(serial) {

                $.ajax({
                    type: 'GET',
                    url: 'ServletValidarActualizar',
                    data: {serial: serial},
                    success: function (data) {

                        if (data[0].msm == 'CODIGO DE VERIFICACION REGISTRADO EXITOSAMENTE API') {
                            GuardarLicenciaDB(serial);
                            alert('EXITO:' + data[0].msm);
                        } else {
                            alert('NO:' + data[0].msm);
                        }

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert('ERROR API:' + xhr + ajaxOptions + thrownError);
                    }
                });
            }

            function RollbackLicenciaAPI(serial) {

                $.ajax({
                    type: 'GET',
                    url: 'ServletValidarRollback',
                    data: {serial: serial},
                    success: function (data) {
                        alert('EXITO:' + data[0].msm);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert('ERROR ROLLBACK API:' + xhr + ajaxOptions + thrownError);
                    }
                });
            }
        </script>

    </body>

</html>