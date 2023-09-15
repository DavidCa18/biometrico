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

        <link href="../css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="../css/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print'>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="../css/plugins/dataTables/datatables.min.css" rel="stylesheet">
        <link href="../css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
        <link href="../css/plugins/ladda/ladda-themeless.min.css" rel="stylesheet">

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
                        <li class="active">
                            <a href=""><i class="fa fa-search"></i> <span class="nav-label">Consultas</span> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a href="./adminConsultas.jsp">Consulta Global</a></li>
                                <li><a href="./adminConsultasUsuarios.jsp">Consulta Empleados</a></li>
                                <li class="active"><a href="./adminConsultasCalendario.jsp">Consulta Calendario</a></li>
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
                        <li>
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
                                <li>
                                    <a href=""> Control Asistencia &nbsp;&nbsp;<i class="fa fa-angle-right"></i></a>
                                    <ul class="nav nav-third-level">
                                        <li>
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
                        <h2>Consultas</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Consultas - Calendario</strong>
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
                                <div class="form-group">
                                    <h3>Ingresar los parámetros de consulta</h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Empleados</label>
                                            <select class="form-control m-b" id="cbxEmpleados" name="cbxEmpleados" style="height: 35px">                                           

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group" id="data_1">
                                            <label>Mes</label>
                                            <select class="form-control m-b" id="cbxMeses" name="cbxMeses" style="height: 35px">                                           
                                                <option value='01'>Enero</option>
                                                <option value='02'>Febrero</option>
                                                <option value='03'>Marzo</option>
                                                <option value='04'>Abril</option>
                                                <option value='05'>Mayo</option>
                                                <option value='06'>Junio</option>
                                                <option value='07'>Julio</option>
                                                <option value='08'>Agosto</option>
                                                <option value='09'>Septiembre</option>
                                                <option value='10'>Octubre</option>
                                                <option value='11'>Noviembre</option>
                                                <option value='12'>Diciembre</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group" id="data_1">
                                            <label>Año</label>
                                            <select class="form-control m-b" id="cbxAnios" name="cbxAnios" style="height: 35px">                                           
                                                <%= controladorInicio.buscarAnios()%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>&nbsp;</label>
                                            <div class="form-group" >
                                                <button type="button" class="ladda-button btn btn-success" id="btnConsultar"><i class="fa fa-search"></i> BUSCAR</button>                                                  
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div id="msm_error">

                                    </div>
                                </div>
                                <hr>
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal inmodal" id="mdAdvertencia" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><i class="fa fa-exclamation-triangle"></i> &nbsp Advertencia</h4>
                    </div>
                    <div class="modal-body">
                        <p style="text-align: justify">Al ingresar al siguiente módulo desde un dipositivo móvil, 
                            la gran cantidad de datos manejados no se apreciaran de una forma correcta y legible 
                            además la generación de reportes podría verse afectado en su diseño<br><br>
                            <strong>¿Desea ingresar a pesar de las condiciones?</strong></p>
                    </div>
                    <div class="modal-footer">
                        <a href="./adminIndex.jsp" class="btn btn-primary"><i class="fa fa-undo"></i> Volver</a>
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-check"></i> Aceptar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="../js/plugins/fullcalendar/moment.min.js"></script>
        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Custom and plugin javascript -->
        <script src="../js/inspinia.js"></script>
        <script src="../js/plugins/pace/pace.min.js"></script>

        <script src="../js/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="../js/plugins/fullcalendar/fullcalendar.min.js"></script>

        <script src="../js/plugins/dataTables/datatables.min.js"></script>
        <script src="../js/bootstrap-multiselect.js" type="text/javascript"></script>
        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
        <script src="../js/plugins/ladda/spin.min.js"></script>
        <script src="../js/plugins/ladda/ladda.min.js"></script>
        <script src="../js/plugins/ladda/ladda.jquery.min.js"></script>



    </body>

    <script>


        $(document).ready(function () {

            BuscarEmpleados();

            var device = navigator.userAgent;

            if (device.match(/Iphone/i) || device.match(/Ipod/i) || device.match(/Android/i) || device.match(/J2ME/i) || device.match(/BlackBerry/i) || device.match(/iPhone|iPad|iPod/i) || device.match(/Opera Mini/i) || device.match(/IEMobile/i) || device.match(/Mobile/i) || device.match(/Windows Phone/i) || device.match(/windows mobile/i) || device.match(/windows ce/i) || device.match(/webOS/i) || device.match(/palm/i) || device.match(/bada/i) || device.match(/series60/i) || device.match(/nokia/i) || device.match(/symbian/i) || device.match(/HTC/i))
            {
                $('#mdAdvertencia').modal('show');
            }
        });

        $('#btnConsultar').click(function (e) {

            var empleado = $('#cbxEmpleados').val();
            var anio = $('#cbxAnios').val();
            var mes = $("#cbxMeses").val();

            if (validar()) {
                BuscarCalendarioEmpleado(empleado, anio, mes);
            }

        });

        function BuscarCalendarioEmpleado(empleado, anio, mes) {


            $('#calendar').fullCalendar('destroy');
            $('#calendar').fullCalendar('render');

            $('#calendar').fullCalendar({

                lang: 'es',
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listMonth',
                },
                timeFormat: 'H:mm',
                eventSources: [

                    {
                        url: '../ServletTerminalBuscarCalendario',
                        type: 'GET',
                        data: {
                            empleado: empleado,
                            anio: anio,
                            mes: mes
                        },
                        error: function () {
                            alert('Error al visualizar calendario!');
                        },
                        color: '#3B93D1',
                        textColor: 'white'
                    }

                ]
            });

        }

        function BuscarEmpleados() {

            $.ajax({
                type: "GET",
                url: "../ServletAsignacionBuscarEmpleado",
                success: function (responseText) {

                    var htmlOut = '';
                    for (var i = 0; i < responseText.length; i++) {
                        htmlOut += "<option value='" + responseText[i].id_empleado + "'>" + responseText[i].nombre_empleado + " - " + responseText[i].numero_documento_empleado + "</option>\n";
                    }

                    $('#cbxEmpleados').empty();
                    $('#cbxEmpleados').append(htmlOut);

                }
            });
        }

        function validar() {

            var empleado = $('#cbxEmpleados').val();

            if (empleado.length > 0) {
                $('#msm_error').empty();
                return true;
            } else {
                $('#msm_error').empty();
                $("#msm_error").html("<div class='alert alert-danger'> <a class='alert-link' href='#'>Seleccionar almenos un empleado</a> </div>");
            }

            return false;
        }


    </script>

    <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>
</html>
