<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Biometric | Gestión de Personal</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body class="gray-bg" onload="nobackbutton();">

        <div class="middle-box text-center loginscreen animated fadeInDown">
            <div>
                <div>
                    <br><br><br>
                    <img src="img/logo.png" alt="Loctel" width="100%">
                    <br>
                    <br>
                </div>
                <h3>Ingresar al Sistema</h3>
                <form class="m-t" method="POST" action="ServletInicioSesion" id="fmrLogin">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Usuario" name="txtUsuario" id="txtUsuario" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Contraseña" name="txtPass" id="txtPass" required>
                    </div>
                    <button type="submit" class="btn btn-success block full-width m-b" id="btnIniciar" name="btnIniciar">Ingresar</button>
                </form>
                <%
                    if (request.getParameter("cerrar") != null) {
                        session.invalidate();
                    }
                %>

                <p class="m-t"> <small>Biometric &copy; Desarrollado por Cineto Telecomunicaciones - 2017</small> </p>
            </div>
        </div>
        <div style="position: absolute;
             bottom: 0px;
             left: 0px;
             margin-bottom: 0px;
             margin-left: 0px;
             background-color: transparent;
             vertical-align: sub;">
            <div class="dropup">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-question-circle"></i>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <li><a href="index.jsp?cerrar=true">Restablecer Sesiones</a></li>
                </ul>
            </div>

        </div>

        <!-- Mainly scripts -->
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script src="js/plugins/toastr/toastr.min.js"></script>
        <script>

        $(function () {

            $('#btnIniciar').click(function (e) {
                e.preventDefault();
                var data = $('#fmrLogin').serialize();

                $.post("ServletInicioSesion", data, function (res, est, jqXHR) {

                    location.replace(res);

                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Credenciales Incorrectas', 'Error al Iniciar Sesión');
                });
            });

        });
        </script>

    </body>

    <script>
        function nobackbutton() {
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            };
        }
    </script>

    <script>

        ComprobarLicenciaLocal();

        function ComprobarLicenciaAPI(serial) {
            $.ajax({
                type: 'GET',
                url: 'ServletValidarComprobar',
                data: {serial: serial},
                success: function (data) {
                    if (data[0].msm == 'false') {
                        location.replace('code.jsp');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert('ERROR API:' + xhr + ajaxOptions + thrownError);
                }
            });
        }

        function ComprobarLicenciaLocal() {
            $.ajax({
                type: 'GET',
                url: 'ServletValidarBuscar',
                success: function (data) {
                    if (data[0].msm != 'VACIO') {
                        ComprobarLicenciaAPI(data[0].msm);
                    } else {
                        location.replace('code.jsp');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert('ERROR LOCAL:' + xhr + ajaxOptions + thrownError);
                }
            });
        }

    </script>

</html>
