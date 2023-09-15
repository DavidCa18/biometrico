
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
                                <li><a href="./adminFeriados.jsp">Feriados</a></li>
                                <li class="active"><a href="./adminHorarios.jsp">Horarios</a></li>    
                                <li><a href="./adminConsultasCalendario.jsp">Consulta Calendario</a></li>
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
                        <h2>Gestión Horarios</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Horarios</strong>
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
                                    <button type="button" class="btn btn-w-m btn-success" data-toggle="modal" data-target="#mdHorario" id="guardar"><i class="fa fa-plus"></i> Agregar Horario</button>
                                </div>
                                <div class="table-responsive" >
                                    <table id="tbHorario" class="table table-striped table-bordered table-hover" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="background: #3B93D1; color: white">Código</th>
                                                <th style="background: #3B93D1; color: white">Turno</th>
                                                <th style="background: #3B93D1; color: white"><i class="fa fa-clock-o"></i> Entrada</th>
                                                <th style="background: #3B93D1; color: white"><i class="fa fa-clock-o"></i> Salida</th>
                                                <th style="background: #3B93D1; color: white"><i class="fa fa-clock-o"></i> Espera</th>
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

        <div class="modal fade" id="mdHorario" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrHorario" name="fmrHorario">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Gestión de Horarios</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <input type="number" class="form-control" id="txtCodigoH" name="txtCodigoH" style="display: none">
                            </div>
                            <div class="form-group">
                                <label>Turno</label>
                                <select class="form-control" id="cbxTurno" name="cbxTurno">
                                    <option value="COMPLETO">COMPLETO</option>
                                    <option value="MEDIO TIEMPO">MEDIO TIEMPO</option>
                                </select>
                            </div>
                            <div class="row">
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>Hora Entrada</label>
                                    <div class="form-group">
                                        <p>Horas</p>
                                        <select class="form-control" id="cbxHoraEntrada" name="cbxHoraEntrada">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>&nbsp;</label>
                                    <div class="form-group">
                                        <p>Minutos</p>
                                        <select class="form-control" id="cbxMinutoEntrada" name="cbxMinutoEntrada">

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>&nbsp;</label>
                                    <div class="form-group">
                                        <p>Segundos</p>
                                        <select class="form-control" id="cbxSegundoEntrada" name="cbxSegundoEntrada">

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>Hora Salida</label>
                                    <div class="form-group">
                                        <p>Horas</p>
                                        <select class="form-control" id="cbxHoraSalida" name="cbxHoraSalida">

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>&nbsp;</label>
                                    <div class="form-group">
                                        <p>Minutos</p>
                                        <select class="form-control" id="cbxMinutoSalida" name="cbxMinutoSalida">

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>&nbsp;</label>
                                    <div class="form-group">
                                        <p>Segundos</p>
                                        <select class="form-control" id="cbxSegundoSalida" name="cbxSegundoSalida">

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>Tiempo de Espera</label>
                                    <div class="form-group">
                                        <p>Horas</p>
                                        <select class="form-control" id="cbxHoraEspera" name="cbxHoraEspera">

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>&nbsp;</label>
                                    <div class="form-group">
                                        <p>Minutos</p>
                                        <select class="form-control" id="cbxMinutoEspera" name="cbxMinutoEspera">

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <label>&nbsp;</label>
                                    <div class="form-group">
                                        <p>Segundos</p>
                                        <select class="form-control" id="cbxSegundoEspera" name="cbxSegundoEspera">

                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="text" id="txtHoraEntrada" name="txtHoraEntrada" style="display: none" />
                        <input type="text" id="txtHoraSalida" name="txtHoraSalida" style="display: none" />
                        <input type="text" id="txtHoraEspera" name="txtHoraEspera" style="display: none" />

                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="btn btn-warning" id="btnModificarHorario"><i class="fa fa-pencil"></i> Modificar</button>
                            <button type="submit" class="btn btn-success" id="btnGuardarHorario"><i class="fa fa-save"></i> Guardar</button>
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

        <script>

            AsignarTiempo('cbxHoraEntrada', 24);
            AsignarTiempo('cbxHoraSalida', 24);
            AsignarTiempo('cbxHoraEspera', 24);

            AsignarTiempo('cbxMinutoEntrada', 60);
            AsignarTiempo('cbxMinutoSalida', 60);
            AsignarTiempo('cbxMinutoEspera', 60);

            AsignarTiempo('cbxSegundoEntrada', 60);
            AsignarTiempo('cbxSegundoSalida', 60);
            AsignarTiempo('cbxSegundoEspera', 60);

            function AsignarTiempo(valor, numero) {
                var horas;
                for (var i = 0; i < numero; i++) {
                    horas += "<option value='" + ceros(i) + "'>" + ceros(i) + "</option>\n";
                }
                $('#' + valor + '').empty();
                $('#' + valor + '').html(horas);
            }

            function ceros(time) {

                var result = '';
                if (time < 10) {
                    result = '0' + time;
                } else {
                    result = time;
                }
                return result;
            }

        </script>

        <script>

            BuscarHorario();

            $('#btnGuardarHorario').click(function (e) {
                e.preventDefault();

                var convetirEntrada = $('#cbxHoraEntrada').val() + ":" + $('#cbxMinutoEntrada').val() + ":" + $('#cbxSegundoEntrada').val();
                var convetirSalida = $('#cbxHoraSalida').val() + ":" + $('#cbxMinutoSalida').val() + ":" + $('#cbxSegundoSalida').val();
                var convetirEspera = $('#cbxHoraEspera').val() + ":" + $('#cbxMinutoEspera').val() + ":" + $('#cbxSegundoEspera').val();

                $('#txtHoraEntrada').val(convetirEntrada);
                $('#txtHoraSalida').val(convetirSalida);
                $('#txtHoraEspera').val(convetirEspera);

                GuardarHorario();

            });

            $('#btnModificarHorario').click(function (e) {
                e.preventDefault();

                var convetirEntrada = $('#cbxHoraEntrada').val() + ":" + $('#cbxMinutoEntrada').val() + ":" + $('#cbxSegundoEntrada').val();
                var convetirSalida = $('#cbxHoraSalida').val() + ":" + $('#cbxMinutoSalida').val() + ":" + $('#cbxSegundoSalida').val();
                var convetirEspera = $('#cbxHoraEspera').val() + ":" + $('#cbxMinutoEspera').val() + ":" + $('#cbxSegundoEspera').val();

                $('#txtHoraEntrada').val(convetirEntrada);
                $('#txtHoraSalida').val(convetirSalida);
                $('#txtHoraEspera').val(convetirEspera);

                ModificarHorario();

            });

            $('#guardar').click(function (e) {
                Limpiar();
                $("#btnModificarHorario").css("display", "none");
                $("#btnGuardarHorario").css("display", "inline");
            });

            function BuscarHorario() {

                var table = $('#tbHorario').DataTable({
                    "ajax": "../ServletHorarioBuscar",
                    destroy: true,
                    empty: true,
                    "columnDefs": [{
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
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        }],
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

                $('#tbHorario tbody').on('click', '#btnModificar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#btnGuardarHorario").css("display", "none");
                    $("#btnModificarHorario").css("display", "inline");
                    $('#mdHorario').modal('show');

                    var horaEntrada = data[2];
                    var minutoEntrada = data[2];
                    var segundoEntrada = data[2];

                    var horaSalida = data[3];
                    var minutoSalida = data[3];
                    var segundoSalida = data[3];

                    var horaEspera = data[4];
                    var minutoEspera = data[4];
                    var segundoEspera = data[4];

                    $('#txtCodigoH').val(data[0]);
                    $('#cbxTurno').val(data[1]);
                    $('#cbxHoraEntrada').val(horaEntrada.substring(0, 2));
                    $('#cbxMinutoEntrada').val(minutoEntrada.substring(3, 5));
                    $('#cbxSegundoEntrada').val(segundoEntrada.substring(6, 8));
                    $('#cbxHoraSalida').val(horaSalida.substring(0, 2));
                    $('#cbxMinutoSalida').val(minutoSalida.substring(3, 5));
                    $('#cbxSegundoSalida').val(segundoSalida.substring(6, 8));
                    $('#cbxHoraEspera').val(horaEspera.substring(0, 2));
                    $('#cbxMinutoEspera').val(minutoEspera.substring(3, 5));
                    $('#cbxSegundoEspera').val(segundoEspera.substring(6, 8));

                });

                $('#tbHorario tbody').on('click', '#btnEliminar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    swal({
                        title: "¿Desea Eliminar el Registro?",
                        text: "El horario\nTURNO:" + data[1] + "\nENTRADA:" + data[2] + "\nSALIDA:" + data[3] + "\nESPERA:" + data[4] + "\nserá Eliminado",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Sí, Eliminar!",
                        closeOnConfirm: false
                    }, function () {
                        EliminarHorario(data[0]);
                        sweetAlert.close();
                    });


                });
            }

            function GuardarHorario() {

                var data = $('#fmrHorario').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletHorarioGuardar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Horario');
                        BuscarHorario();
                        Limpiar();
                        $('#mdHorario').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Horario. El horario que intenta almacenar ya existe', 'Gestión Horario');
                });
            }

            function ModificarHorario() {

                var data = $('#fmrHorario').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletHorarioModificar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Horario');
                        BuscarHorario();
                        Limpiar();
                        $('#mdHorario').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Modificar Horario. El horario que intenta almacenar ya existe', 'Gestión Horario');
                });
            }

            function EliminarHorario(txtCodigoH) {

                $.ajax({
                    type: "POST",
                    url: "../ServletHorarioEliminar",
                    data: {txtCodigoH: txtCodigoH},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Horario');
                        BuscarHorario();
                        Limpiar();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Eliminar Horario', 'Gestión Horario');
                });
            }

            function Limpiar() {

                $('#txtCodigoH').val("");
                $('#txtHoraEntrada').val("");
                $('#txtHoraSalida').val("");
                $('#txtHoraEspera').val("");
            }

        </script>
        <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>

    </body>

</html>



