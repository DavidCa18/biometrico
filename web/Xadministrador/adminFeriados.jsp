
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
        <link href="../css/plugins/datapicker/datepicker3.css" rel="stylesheet" type="text/css"/>
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
                        <li >
                            <a href="./adminCargos.jsp"><i class="fa fa-suitcase"></i> <span class="nav-label">Cargos</span>  </a>
                        </li>
                        <li class="active">
                            <a href=""><i class="fa fa-calendar"></i> <span class="nav-label">Tiempo</span> <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li class="active"><a href="./adminFeriados.jsp">Feriados</a></li>
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
                        <h2>Gestión Feriados</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Feriados</strong>
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
                                    <button type="button" class="btn btn-w-m btn-success" data-toggle="modal" data-target="#mdFeriado" id="guardar"><i class="fa fa-plus"></i> Agregar Feriado</button>
                                </div>
                                <div class="table-responsive" >
                                    <table id="tbFeriado" class="table table-striped table-bordered table-hover" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="background: #3B93D1; color: white">Código</th>
                                                <th style="background: #3B93D1; color: white">Fecha Base</th>
                                                <th style="background: #3B93D1; color: white">Año</th>
                                                <th style="background: #3B93D1; color: white">Feriado</th>
                                                <th style="background: #3B93D1; color: white"></th>
                                                <th style="background: #3B93D1; color: white"></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="modal fade" id="mdFeriado" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrFeriado" name="fmrFeriado">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Gestión Feriados</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">

                                <input type="number" class="form-control" id="txtCodigoF" name="txtCodigoF" style="display: none">
                            </div>
                            <div class="form-group">
                                <div class="form-group" id="data_1">
                                    <label>Fecha Feriado</label>
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text"
                                                                                                                    class="form-control" id="txtFechaFeriado" name="txtFechaFeriado">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="btn btn-warning" id="btnModificarFeriado"><i class="fa fa-pencil"></i> Modificar</button>
                            <button type="submit" class="btn btn-success" id="btnGuardarFeriado"><i class="fa fa-save"></i> Guardar</button>
                        </div>
                    </form>
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
        <script src="../js/plugins/datapicker/bootstrap-datepicker.js" type="text/javascript"></script>

        <script>

            $(document).ready(function () {
                BuscarFeriado();
                InsertarFecha();
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

            $('#btnGuardarFeriado').click(function (e) {
                e.preventDefault();
                if (Validar()) {
                    GuardarFeriado();
                }
            });

            $('#btnModificarFeriado').click(function (e) {
                e.preventDefault();
                if (Validar()) {
                    ModificarFeriado();
                }
            });

            $('#guardar').click(function (e) {
                Limpiar();
                $("#btnModificarFeriado").css("display", "none");
                $("#btnGuardarFeriado").css("display", "inline");
            });

            function BuscarFeriado() {

                var table = $('#tbFeriado').DataTable({

                    "ajax": "../ServletFeriadoBuscar",
                    destroy: true,
                    empty: true,
                    "ordering": false,
                    "columnDefs": [
                        {"visible": false, "targets": 2},
                        {
                            "targets": -2,
                            "data": null,
                            "width": "1%",
                            "defaultContent": "<button id='btnModificar' class='btn btn-warning' type='button'><i class='fa fa-pencil'></i></button>"
                        },
                        {
                            "targets": -1,
                            "data": null,
                            "width": "1%",
                            "defaultContent": "<button id='btnEliminar' class='btn btn-danger' type='button'><i class='fa fa-trash'></i></button>"
                        },
                        {
                            "targets": [0, 1],
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
                                        '<tr class="group" style="background: #6BC2FF; color: white"><td colspan="10"><i class="fa fa-clock-o"></i> <b>Año - ' + group + '</b></td></tr>'
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
                        "sSearch": "Buscar:",
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
                        }

                    }
                });

                $('#tbFeriado tbody').on('click', '#btnModificar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#btnGuardarFeriado").css("display", "none");
                    $("#btnModificarFeriado").css("display", "inline");
                    $('#mdFeriado').modal('show');

                    $('#txtCodigoF').val(data[0]);
                    $('#txtFechaFeriado').val(data[1]);

                });

                $('#tbFeriado tbody').on('click', '#btnEliminar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    swal({
                        title: "¿Desea Eliminar el Registro?",
                        text: "El Feriado del " + data[2] + " será Eliminado",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Sí, Eliminar!",
                        closeOnConfirm: false
                    }, function () {
                        EliminarFeriado(data[0]);
                        sweetAlert.close();
                    });


                });
            }

            function GuardarFeriado() {

                var data = $('#fmrFeriado').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletFeriadoGuardar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Feriado');
                        BuscarFeriado();
                        Limpiar();
                        $('#mdFeriado').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Feriado', 'Gestión Feriado');
                });
            }

            function ModificarFeriado() {

                var data = $('#fmrFeriado').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletFeriadoModificar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Cargo');
                        BuscarFeriado();
                        Limpiar();
                        $('#mdFeriado').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Error al Modificar Feriado', 'Gestión Feriado');
                });
            }

            function EliminarFeriado(txtCodigoF) {

                $.ajax({
                    type: "POST",
                    url: "../ServletFeriadoEliminiar",
                    data: {txtCodigoF: txtCodigoF},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Feriado');
                        BuscarFeriado();
                        Limpiar();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {

                    toastr.error('Error al Eliminar Feriado', 'Gestión Feriado');
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
            function Validar() {
                
                var fecha = $('#txtFechaFeriado').val();
                if (validate_date(fecha) == true) {
                    return true;

                } else {
                    swal("Advertencia", "Ingresar una fecha válida", "warning");
                }

                return false;
            }

            function Limpiar() {
                $('#txtCodigoF').val("");
            }

        </script>
        <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>

    </body>

</html>
