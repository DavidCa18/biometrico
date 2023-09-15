<%@page import="Controlador.ControladorInicio"%>
<%@page import="Controlador.ControladorEmpresa"%>
<%
    ControladorEmpresa controladorEmpresa = new ControladorEmpresa();
    ControladorInicio controladorInicio = new ControladorInicio();
%>
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
            if (sesions.getAttribute("sesionActivaBusqueda") != null) {
                usuario = sesions.getAttribute("sesionActivaBusqueda").toString();
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
                                        </span> <span class="text-muted text-xs block"> Búsqueda <b class="caret"></b></span> </span> </a>
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
                        <li class="active">
                            <a href="./busquedasIndex.jsp"><i class="fa fa-pie-chart"></i> <span class="nav-label">Inicio</span>  </a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-search"></i> <span class="nav-label">Consultas</span> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="./busquedasConsultas.jsp">Consulta Global</a></li>
                                <li><a href="./busquedasConsultasUsuarios.jsp">Consulta Empleados</a></li>
                                <li><a href="./busquedasConsultasCalendario.jsp">Consulta Calendario</a></li>
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
                        <h2>Inicio</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Búsqueda</a>
                            </li>
                            <li class="active">
                                <strong>Inicio</strong>
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
                        <div class="col-lg-3 col-sm-6">
                            <div class="widget style1 red-bg">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <i class="fa fa-users fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> Empleados </span>
                                        <%= controladorInicio.buscarNumEmpleados()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="widget style1 lazur-bg">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <i class="fa fa-calendar fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> Horarios </span>
                                        <%= controladorInicio.buscarNumHorarios()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="widget style1 blue-bg">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> Usuarios </span>
                                        <%= controladorInicio.buscarNumUsuarios()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="widget style1 yellow-bg">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <i class="fa fa-bell fa-5x"></i>
                                    </div>
                                    <div class="col-xs-8 text-right">
                                        <span> N° Timbradas </span>
                                        <%= controladorInicio.buscarNumTimbradas()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <br>
                        <div class="col-md-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Número de timbradas mensuales </h5>
                                    <div class="ibox-tools">
                                        <div class="pull-right">
                                            <div class="btn-group">
                                                <label class="label label-xs" style="background: white">Seleccionar Año</label>
                                                <select class="btn btn-xs btn-white" name="anio_busqueda" id="anio_busqueda">
                                                    <%= controladorInicio.buscarAnios()%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <canvas id="lineChart" height="100"></canvas>
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
        <script src="../js/plugins/chartJs/Chart.min.js"></script>
        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    </body>

    <script>

        $(document).ready(function () {
            var anio = $('#anio_busqueda').val();
            CargarMensual(anio);
        });

        $('#anio_busqueda').click(function (e) {
            var anio = $('#anio_busqueda').val();
            CargarMensual(anio);
        });


        function CargarMensual(anio) {

            $.ajax({
                type: "GET",
                url: "../ServletInicio",
                data: {anio: anio},
                success: function (responseText) {

                    var labels = new Array();
                    var values = new Array();
                    for (var i = 0; i < responseText.length; i++) {
                        labels.push(responseText[i].mes_inicio);
                        values.push(responseText[i].timbradas_inicio);
                    }

                    var lineData = {
                        labels: labels,
                        datasets: [

                            {
                                label: "Timbradas Mensuales",
                                backgroundColor: 'rgba(40,150,211,0.5)',
                                borderColor: "rgba(25,131,178,0.7)",
                                pointBackgroundColor: "rgba(50,123,155,1)",
                                pointBorderColor: "#fff",
                                data: values
                            }
                        ]
                    };

                    var lineOptions = {
                        responsive: true
                    };

                    var myNewChart2;

                    if (window.myNewChart2 != null) {
                        window.myNewChart2.destroy();
                    }

                    var ctx1 = document.getElementById("lineChart").getContext("2d");
                    window.myNewChart2 = new Chart(ctx1, {type: 'line', data: lineData, options: lineOptions});

                }
            }).fail(function (xhr, ajaxOptions, thrownError) {
                alert('Error');
            });
        }

    </script>

    <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>
</html>
