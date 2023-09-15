<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Clases.Empresa"%>
<%@page import="Controlador.ControladorEmpresa"%>
<%
    ControladorEmpresa controladorEmpresa = new ControladorEmpresa();
    Empresa empresa = controladorEmpresa.buscarEmpresa();
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
        <link href="../css/plugins/dataTables/datatables.min.css" rel="stylesheet">
        <link href="../css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
        <link href="../css/plugins/datapicker/datepicker3.css" rel="stylesheet" type="text/css"/>
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

            Date date = new Date();
            DateFormat hourdateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
            String fechaActual = hourdateFormat.format(date);

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
                                <li class="active"><a href="./adminConsultasUsuarios.jsp">Consulta Empleados</a></li>
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
                                <strong>Consultas - Empleado</strong>
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
                                            <label>Fecha Incio</label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text"
                                                                                                                            class="form-control" id="txtFechaInicio" name="txtFechaInicio">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group" id="data_1">
                                            <label>Fecha Fin</label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text"
                                                                                                                            class="form-control" id="txtFechaFin" name="txtFechaFin">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>&nbsp;</label>
                                            <div class="form-group" >
                                                <button type="button" class="ladda-button btn btn-success" id="btnConsultar"><i class="fa fa-search"></i> BUSCAR</button>
                                                <button type="button" class="ladda-button btn btn-warning" data-toggle="modal" id="btnReporte"><i class="fa fa-file"></i> REPORTE</button>                                                  
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="form-group">
                                    <div id="msm_error">

                                    </div>
                                </div>
                                <hr>
                                <div class="form-group table-responsive" id="tableDetails">
                                    <table id="tbDetalles" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        </thead>
                                        <tbody>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        <td width="60"></td>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="mdObservacion" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrObservacion" name="fmrObservacion">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Asignación de Observación</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label>Código Terminal</label>
                                <input type="number" placeholder="Ingresar Código Terminal" class="form-control" id="txtIdTerminal" name="txtIdTerminal">
                            </div>
                            <div class="form-group">
                                <label>Identificación Empleado</label>
                                <input type="number" placeholder="Ingresar Identificación del Empleado" class="form-control" id="txtIdentificacion" name="txtIdentificacion">
                            </div>
                            <div class="form-group">
                                <label>Detalle</label>
                                <textarea  placeholder="Ingresar detalle de la observación" class="form-control" id="txtDetalle" name="txtDetalle" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="btn btn-success" id="btnGuardarObservacion"><i class="fa fa-save"></i> Guardar</button>
                        </div>
                    </form>
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

        <div class="modal fade" id="mdReporte" tabindex="-1" role="dialog" aria-hidden="true" >
            <div class="modal-dialog modal-lg" style="width: 90% !important;">
                <div class="modal-content animated flipInY">

                    <div class="modal-footer">
                        <h3 style="float: left">Vista Preliminar PDF</h3>
                        <button type="button" class="btn btn-success" id="imprimir_documento"><i class="fa fa-print"></i>  Imprimir</button>
                        <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i></button>
                        <hr>
                    </div>
                    <div class="modal-body" >
                        <div id="pages" >
                            <table style="width: 100%">
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="<%= empresa.getLogoEmpresa()%>" width="300" height="80"/><br><br>
                                        </td>
                                        <td>
                                            <label style="width: 100%">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label><br><br>
                                        </td>
                                        <td>
                                            <label><%= empresa.getNombreEmpresa()%></label><br>
                                            <label><%= empresa.getRucEmpresa()%></label><br>
                                            <label><%= empresa.getTelefonoEmpresa()%></label><br>
                                            <label><%= empresa.getDireccionEmpresa()%></label><br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div id="datos_empleado">

                                            </div><br>
                                        </td>
                                        <td>
                                            <div id="foto_empleado">

                                            </div><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table id="tbCargo" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="background: #3B93D1; color: white">Fecha</th>
                                                        <th style="background: #3B93D1; color: white">Tipo</th>
                                                        <th style="background: #3B93D1; color: white">Hora</th>
                                                        <th style="background: #3B93D1; color: white">Observación</th>
                                                        <th style="background: #3B93D1; color: white">Estado</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbDetalleReporte">

                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
        <script src="../js/bootstrap-multiselect.js" type="text/javascript"></script>
        <script src="../js/plugins/datapicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
        <script src="../js/plugins/ladda/spin.min.js"></script>
        <script src="../js/plugins/ladda/ladda.min.js"></script>
        <script src="../js/plugins/ladda/ladda.jquery.min.js"></script>
        <script src="../js/jquery.PrintArea.js" type="text/javascript"></script>

    </body>

    <script>


        $(document).ready(function () {
            InsertarFecha();
            BuscarEmpleados();

            var device = navigator.userAgent;

            if (device.match(/Iphone/i) || device.match(/Ipod/i) || device.match(/Android/i) || device.match(/J2ME/i) || device.match(/BlackBerry/i) || device.match(/iPhone|iPad|iPod/i) || device.match(/Opera Mini/i) || device.match(/IEMobile/i) || device.match(/Mobile/i) || device.match(/Windows Phone/i) || device.match(/windows mobile/i) || device.match(/windows ce/i) || device.match(/webOS/i) || device.match(/palm/i) || device.match(/bada/i) || device.match(/series60/i) || device.match(/nokia/i) || device.match(/symbian/i) || device.match(/HTC/i))
            {
                $('#mdAdvertencia').modal('show');
            }
        });

        $('#btnConsultar').click(function (e) {

            var fechaInicio = $('#txtFechaInicio').val();
            var fechaFinal = $('#txtFechaFin').val();
            var selected = $("#cbxEmpleados option:selected");
            var concat = "";
            selected.each(function () {
                concat += "empleado.eml_id = \\'" + $(this).val() + "\\' OR ";
            });
            var empleados = "";
            empleados = concat.substring(0, (concat.length - 3));
            if (validar()) {
                BuscarHistorialEmpleados(empleados, fechaInicio, fechaFinal);
            }

        });

        $("#btnReporte").click(function () {

            var fechaInicio = $('#txtFechaInicio').val();
            var fechaFinal = $('#txtFechaFin').val();
            var selected = $("#cbxEmpleados option:selected");
            var concat = "";
            selected.each(function () {
                concat += "empleado.eml_id = \\'" + $(this).val() + "\\' OR ";
            });
            var empleados = "";
            empleados = concat.substring(0, (concat.length - 3));
            if (validar()) {

                ReporteHistorialTimbradas(empleados, fechaInicio, fechaFinal);
            }
        });

        $("#imprimir_documento").click(function () {
            $("div#pages").printArea({
                mode: "popup"
            });
        });

        function InsertarFecha() {
            $('#data_1 .input-group.date').datepicker({
                format: 'yyyy-mm-dd',
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            }).datepicker("setDate", new Date());
            ;
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

                    $('#cbxEmpleados').multiselect('destroy');
                    $('#cbxEmpleados').multiselect({
                        includeSelectAllOption: true,
                        enableFiltering: true,
                        buttonWidth: '100%',
                        maxHeight: 200
                    });
                }
            });
        }

        function BuscarHistorialEmpleados(empleados, fechaInicio, fechaFin) {
            var l = $('.ladda-button').ladda();
            l.ladda('start');
            $.ajax({
                type: "GET",
                url: "../ServletConsultas",
                data: {empleados: empleados, fechaInicio: fechaInicio, fechaFin: fechaFin},
                success: function (responseText) {

                    var table = $('#tbDetalles').DataTable();
                    table.destroy();
                    $('#tbDetalles').empty();
                    table = $('#tbDetalles').DataTable({
                        "ordering": false,
                        pageLength: 10,
                        responsive: true,
                        dom: '<"html5buttons"B>lTfgitp',
                        buttons: [
                            {extend: 'csv', className: 'exportar-csv-empleados'},
                            {extend: 'excel', title: 'historial-empleados', className: 'exportar-excel-empleados'},
                            {
                                text: '<i class=\'fa fa-refresh\'><i>',
                                action: function (e, dt, node, config) {
                                    location.reload();
                                }
                            }
                        ],
                        data: responseText,
                        columns: [
                            {data: 'terminal_id', title: "Código"},
                            {data: 'empleado_nombre', title: "Nombre Empleado"},
                            {data: 'empleado_documento', title: "Documento Empleado"},
                            {data: 'empleado_cargo', title: "Cargo"},
                            {data: 'empleado_departamento', title: "Departamento"},
                            {data: 'terminal_fecha_registro', title: "Fecha"},
                            {data: 'terminal_tipo', title: "Tipo"},
                            {data: 'terminal_hora_entrada_salida', title: "Hora"},
                            {data: 'terminal_observacion', title: "Observación"},
                            {data: 'terminal_estado', title: "Estado"},
                            {data: 'terminal_laboratario', title: "Ubicación Terminal"}
                        ],
                        "columnDefs": [
                            {"visible": false, "targets": 2},
                            {
                                "targets": [11],
                                "data": null,
                                "width": "1%",
                                "defaultContent": "<button id='btnModificar' style='background: none; border: none'><i class='fa fa-wrench '></i></button>"
                            },
                            {
                                "targets": [0],
                                "visible": false,
                                "searchable": false
                            }],
                        "order": [[2, 'asc']],
                        "drawCallback": function (settings) {
                            var api = this.api();
                            var rows = api.rows({page: 'current'}).nodes();
                            var last = null;

                            api.column(2, {page: 'current'}).data().each(function (group, i) {
                                if (last !== group) {
                                    $(rows).eq(i).before(
                                            '<tr class="group" style="background: #3B93D1; color: white"><td colspan="10"><i class="fa fa-suitcase"></i> <b>Empleado - ' + group + '</b></td></tr>'
                                            );

                                    last = group;
                                }
                            });
                        },
                        "language": {
                            "sProcessing": "Procesando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados",
                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sSearch": "",
                            "sUrl": "",
                            "sInfoThousands": ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst": "Primero",
                                "sLast": "Último",
                                "sNext": "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            },
                            searchPlaceholder: "Buscar datos"
                        }
                    });

                    $('#tbDetalles tbody').on('click', '#btnModificar', function () {
                        var data = table.row($(this).parents('tr')).data();

                        $('#txtIdTerminal').val(data.terminal_id);
                        $('#txtIdentificacion').val(data.empleado_documento);
                        $('#mdObservacion').modal('show');

                    });
                    l.ladda('stop');
                }
            });

        }

        function ReporteHistorialTimbradas(empleados, fechaInicio, fechaFin) {

            var l = $('.ladda-button').ladda();
            l.ladda('start');
            $.ajax({
                type: "GET",
                url: "../ServletConsultas",
                data: {empleados: empleados, fechaInicio: fechaInicio, fechaFin: fechaFin},
                success: function (responseText) {
                    var htmlOut = '';
                    var htmlData = '';

                    for (var i = 0; i < responseText.length; i++) {

                        htmlOut += "<tr> \n\
                     <td>" + responseText[i].terminal_fecha_registro + "</td> \n\
                     <td>" + responseText[i].terminal_tipo + "</td> \n\
                     <td>" + responseText[i].terminal_hora_entrada_salida + "</td> \n\
                     <td>" + responseText[i].terminal_observacion + "</td> \n\
                     <td>" + responseText[i].terminal_estado + "</td> \n\
                     </tr>";
                    }
                    htmlData = "<p><label>Nombre Empleado: </label> " + responseText[0].empleado_nombre + "</p>\n\
                                    <p><label>N° Documento: </label> " + responseText[0].empleado_documento + "</p>\n\
                                    <p><label>Cargo: </label> " + responseText[0].empleado_cargo + "</p>\n\
                                    <p><label>Departamento: </label> " + responseText[0].empleado_departamento + "</p>";
                    var imagen = ['<img id="imagen_empleado" style="width: 20%; height: 123px; top: 0; left: 0;" class="thumb" src="', responseText[0].empleado_foto, '"/>'].join('');

                    $('#datos_empleado').empty();
                    $('#datos_empleado').append(htmlData);

                    $('#foto_empleado').empty();
                    $('#foto_empleado').append(imagen);

                    $('#tbDetalleReporte').empty();
                    $('#tbDetalleReporte').append(htmlOut);

                    l.ladda('stop');
                    $('#mdReporte').modal('show');
                }
            }).fail(function (xhr, ajaxOptions, thrownError) {
                toastr.error('Error al Generar Reporte', 'Gestión Reporte');
            });

        }

        $('#btnGuardarObservacion').click(function (e) {
            e.preventDefault();
            if (ValidarFormulario()) {
                GuardarObservacion($('#txtDetalle').val(), $('#txtIdTerminal').val(), $('#txtIdentificacion').val());
            }
        });

        function GuardarObservacion(detalle, terminal, empleado) {

            $.ajax({
                type: "POST",
                url: "../ServletObservacionGuardar",
                data: {detalle: detalle, terminal: terminal, empleado: empleado},
                success: function (responseText) {
                    toastr.success(responseText, 'Gestión Observación');
                    Limpiar();
                    $('#mdObservacion').modal('toggle');
                }
            }).fail(function (xhr, ajaxOptions, thrownError) {
                toastr.error('Error al Guardar Observación', 'Gestión Observación');
            });
        }

        function isValidDate(day, month, year) {
            var dteDate;
            month = month - 1;
            dteDate = new Date(year, month, day);

            return ((day == dteDate.getDate()) && (month == dteDate.getMonth()) && (year == dteDate.getFullYear()));
        }

        function validate_date(fecha) {
            var patron = new RegExp("^(19|20)+([0-9]{2})([-])([0-9]{1,2})([-])([0-9]{1,2})$");

            if (fecha.search(patron) == 0) {
                var values = fecha.split("-");
                if (isValidDate(values[2], values[1], values[0])) {
                    return true;
                }
            }
            return false;
        }

        function validar() {

            var fechaInicio = $('#txtFechaInicio').val();
            var fechaFinal = $('#txtFechaFin').val();
            var empleado = $('#cbxEmpleados').val();

            if (validate_date(fechaInicio) == true) {
                if (validate_date(fechaFinal) == true) {
                    if (empleado.length > 0) {
                        $('#msm_error').empty();
                        return true;
                    } else {
                        $('#msm_error').empty();
                        $("#msm_error").html("<div class='alert alert-danger'> <a class='alert-link' href='#'>Seleccionar almenos un empleado</a> </div>");
                    }
                } else {
                    $('#msm_error').empty();
                    $("#msm_error").html("<div class='alert alert-danger'> <a class='alert-link' href='#'>Seleccionar una fecha final válida</a> </div>");
                }
            } else {
                $('#msm_error').empty();
                $("#msm_error").html("<div class='alert alert-danger'> <a class='alert-link' href='#'>Seleccionar una fecha inicio válida</a> </div>");
            }

            return false;
        }

        function ValidarFormulario() {

            if ($('#txtIdTerminal').val().length > 0) {
                if ($('#txtIdentificacion').val().length > 0) {
                    if ($('#txtDetalle').val().length > 0) {
                        return true;
                    } else {
                        swal("Advertencia", "Ingresar detalle de la observación", "warning");
                    }
                } else {
                    swal("Advertencia", "Ingresar identificación del empleado", "warning");
                }
            } else {
                swal("Advertencia", "Ingresar código del registro del terminal", "warning");
            }

            return false;
        }

        function Limpiar() {
            $('#txtIdTerminal').val("");
            $('#txtIdentificacion').val("");
            $('#txtDetalle').val("");
        }

    </script>
    <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>
</html>
