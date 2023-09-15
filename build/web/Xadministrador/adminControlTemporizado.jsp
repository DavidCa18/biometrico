
<%@page import="Controlador.ControladorEmpresa"%>
<% ControladorEmpresa controladorEmpresa = new ControladorEmpresa(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Biometric | Gestión de Personal</title>

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">

        <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">


        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="../css/plugins/dataTables/datatables.min.css" rel="stylesheet">
        <link href="../css/plugins/toastr/toastr.min.css" rel="stylesheet">
        <style>
            @media (max-width: 600px) {
                #imagen_logo {
                    display: none;
                }
            }
        </style>
    </head>

    <body class="skin-1">
        <%
            HttpSession sesions = request.getSession();
            String usuario = "";
            if (sesions.getAttribute("sesionActivaAdministrador") != null) {
                usuario = sesions.getAttribute("sesionActivaAdministrador").toString();
            } else {
                out.print("<script>location.replace('../index.jsp');</script>");
            }
        %>

        <div id="wrapper">

            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element"> <span>
                                    <img alt="image" class="img-rounded" src="../img/user.png" width="100%" height="30%"/>
                                </span>
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%= usuario%></strong>
                                        </span> <span class="text-muted text-xs block"> Administrador <b class="caret"></b></span> </span> </a>
                                <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                    <li><a href="./adminPerfil.jsp">Perfil</a></li>
                                    <li class="divider"></li>
                                    <li><a href="../index.jsp?cerrar=true">Cerrar Sesión</a></li>
                                </ul>
                            </div>
                            <div class="logo-element">
                                AX+
                            </div>
                        </li>
                        <li>
                            <a href="./adminIndex.jsp"><i class="fa fa-pie-chart"></i> <span class="nav-label">Inicio</span>  </a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-search"></i> <span class="nav-label">Consultas</span> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="./adminConsultas.jsp">Consulta Global</a></li>
                                <li><a href="./adminConsultasUsuarios.jsp">Consulta Empleados</a></li>
                                <li><a href="./adminConsultasCalendario.jsp">Consulta Calendario</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="./adminEmpresa.jsp"><i class="fa fa-bank"></i> <span class="nav-label">Empresa</span></a>
                        </li>
                        <li>
                            <a href="./adminDepartamento.jsp"><i class="fa fa-diamond"></i> <span class="nav-label">Departamento</span></a>
                        </li>
                        <li>
                            <a href="./adminCargos.jsp"><i class="fa fa-suitcase"></i> <span class="nav-label">Cargos</span>  </a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-calendar"></i> <span class="nav-label">Tiempo</span> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="./adminFeriados.jsp">Feriados</a></li>
                                <li><a href="./adminHorarios.jsp">Horarios</a></li>                                
                            </ul>
                        </li>
                        <li>
                            <a href="./adminEmpleados.jsp"><i class="fa fa-users"></i> <span class="nav-label">Empleados</span></a>
                        </li>
                        <li>
                            <a href="./adminAsignacion.jsp"><i class="fa fa-random"></i> <span class="nav-label">Asignación Empleados</span></a>
                        </li>
                        <li>
                            <a href="./adminUbicacionTerminal.jsp"><i class="fa fa-window-maximize"></i> <span class="nav-label">Ubicación Terminal</span></a>
                        </li>
                        <li>
                            <a href="./adminUsuarios.jsp"><i class="fa fa-user"></i> <span class="nav-label">Usuarios</span></a>
                        </li>
                        <li class="active">
                            <a href="">
                                <i class="fa fa-eye"></i>
                                <span class="nav-label">Administración</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="./adminAuditoria.jsp"> Auditoría</a>
                                </li>
                                <li>
                                    <a href="./adminErrores.jsp"> Log Errores</a>
                                </li>
                                <li class="active">
                                    <a href=""> Control Asistencia &nbsp;&nbsp;<i class="fa fa-angle-down "></i></a>
                                    <ul class="nav nav-third-level">
                                        <li class="active">
                                            <a href="./adminControlTemporizado.jsp">Temporizador</a>
                                        </li>
                                        <li>
                                            <a href="./adminControlManual.jsp">Manual</a>
                                        </li>

                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </nav>

            <div id="page-wrapper" class="gray-bg">
                <div class="row border-bottom">
                    <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>

                        </div>
                        <ul class="nav navbar-top-links navbar-right">
                            <li>
                                <span class="m-r-sm text-muted welcome-message"> <b> BIENVENIDO <%= usuario%> - BIOMETRIC</b></span>
                            </li>

                            <li>
                                <a href="../index.jsp?cerrar=true"><i class="fa fa-sign-out"></i>Cerrar Sesión</a>
                            </li>
                        </ul>

                    </nav>
                </div>
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-sm-4">
                        <h2>Control Asistencia</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Control Asistencia</strong>
                            </li>
                        </ol>
                    </div>
                    <div class="col-sm-8">
                        <div class="title-action">
                            <%= controladorEmpresa.buscarLogoEmpresa()%>
                        </div>
                    </div>
                </div>

                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="ibox-title">
                                <div class="alert alert-danger">
                                    <b>MÓDULO DESACTIVADO</b>
                                </div>
                                <div class="alert alert-info">
                                    El control de asistecia temporizada se encarga de realizar la comparación automática de cada timbrada de los empleados, estableciendo el tiempo de comprobación;
                                    dando como resultado si asistió, no asistió, no timbro entrada, no timbro salida y días feriados.<br>
                                    <b>NOTAS:</b>  <br>
                                    <b>* LA SIGUIENTE ACCIÓN DEBERÁ REALIZARSE UNA VEZ INGRESADOS LOS DATOS DESDE LA APLICACIÓN DE ESCRITORIO "DielCineto"</b><br>
                                    <b>* UNA VEZ INICIADO EL CONTROL DE ASISTENCIA NO DEBERÁ SALIR DE ESTE MÓDULO PARA QUE LOS CAMBIOS SURJAN EFECTO Y REALICE LA COMPROBACIÓN EN EL TIEMPO ASIGNADO.</b>
                                </div>
                                <form action="../ServletIniciarCron" method="POST" id="fmrTiempo">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Expresión de Tiempo (CRON)</label>
                                            </div>
                                        </div>
                                        <div class="col-md-11">
                                            <div class="form-group">
                                                <input type="text" placeholder="Ingresar Expresión de Tiempo" class="form-control" id="exp" name="exp">
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-warning"  data-toggle="popover" data-placement="auto top" data-content="Generar expresiones de tiempo, ingresar al siguiente enlace: http://www.cronmaker.com/">
                                                    <i class="fa fa-question"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success" id="btnGuardarCargo"><i class="fa fa-play"></i> Iniciar</button>
                                    </div>

                                </form>
                                <div class="widget lazur-bg p-xl">
                                    <h3>
                                        La comprobación se ejecutará:
                                    </h3>
                                    <ul class="list-unstyled m-t-md" id="mensaje">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Custom and plugin javascript -->
        <script src="../js/inspinia.js"></script>
        <script src="../js/plugins/pace/pace.min.js"></script>

        <script src="../js/plugins/dataTables/datatables.min.js"></script>

        <script src="../js/plugins/toastr/toastr.min.js"></script>

        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>


        <script>

            $('#btnGuardarCargo').click(function (e) {
                e.preventDefault();
                IniciarControlAsistencia();
            });

            function IniciarControlAsistencia() {

                var data = $('#fmrTiempo').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletIniciarCron",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Control Asistencia');
                        $('#mensaje').empty();
                        $('#mensaje').append(responseText);
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Iniciar Control Asistencia', 'Control Asistencia');
                });
            }


        </script>
        

    </body>

</html>
