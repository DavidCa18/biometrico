
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
                        <li class="active">
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
                        <h2>Gestión Usuarios</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Usuarios</strong>
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
                                    <button type="button" class="btn btn-w-m btn-success" data-toggle="modal" data-target="#mdUsuario" id="guardar"><i class="fa fa-plus"></i> Agregar Usuario</button>
                                </div>
                                <div class="table-responsive">
                                    <table id="tbUsuarios" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="background: #3B93D1; color: white">Código</th>
                                                <th style="background: #3B93D1; color: white">Usuario</th>
                                                <th style="background: #3B93D1; color: white">Contraseña</th>
                                                <th style="background: #3B93D1; color: white">Rol</th>
                                                <th style="background: #3B93D1; color: white">Estado</th>
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

        <!-- Modal - Guardar Usuario -->
        <div class="modal fade" id="mdUsuario" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrUsuarios" name="fmrUsuarios">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Gestión de Usuarios</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label>Código</label> 
                                <input type="number" placeholder="Ingresar Número de Documento" class="form-control" id="txtCodigoU" name="txtCodigoU" >
                            </div>
                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" placeholder="Ingresar Nombre Usuario o Email" class="form-control" id="txtUsuario" name="txtUsuario" >
                            </div>
                            <div class="form-group">
                                <label>Contraseña</label>
                                <input type="password" placeholder="Ingresar Nombre Contraseña" class="form-control" id="txtPass" name="txtPass" >
                            </div>
                            <div class="form-group">
                                <label>Rol</label>
                                <select class="form-control" id="cbxRol" name="cbxRol" >
                                    <option value="BUSQUEDA">BUSQUEDA</option>
                                    <option value="CLIENTE">CLIENTE</option>
                                    <option value="ADMINISTRADOR">ADMINISTRADOR</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="btn btn-warning" id="btnModificarUsuario"><i class="fa fa-pencil"></i> Modificar</button>
                            <button type="submit" class="btn btn-success" id="btnGuardarUsuario"><i class="fa fa-save"></i> Guardar</button>
                        </div>
                        <input type="number" placeholder="Ingresar Número de Documento" class="form-control" id="data" name="data" required style="display: none">
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

            $(document).ready(function () {
                BuscarUsuarios();
            });

            $('#btnGuardarUsuario').click(function (e) {
                if (Validar()) {
                    e.preventDefault();
                    GuardarUsuario();
                }
            });

            $('#btnModificarUsuario').click(function (e) {
                if (Validar()) {
                    e.preventDefault();
                    ModificarUsuario();
                }
            });

            $('#guardar').click(function (e) {
                Limpiar();
                $("#btnModificarUsuario").css("display", "none");
                $("#btnGuardarUsuario").css("display", "inline");
            });

            function BuscarUsuarios() {

                var table = $('#tbUsuarios').DataTable({
                    "ajax": "../ServletUsuarioBuscar",
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
                            "targets": [2],
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

                $('#tbUsuarios tbody').on('click', '#btnModificar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#btnGuardarUsuario").css("display", "none");
                    $("#btnModificarUsuario").css("display", "inline");
                    $('#mdUsuario').modal('show');

                    $('#txtCodigoU').val(data[0]);
                    $('#txtUsuario').val(data[1]);
                    $('#txtPass').val(data[2]);
                    $('#cbxRol').val(data[3]);

                });

                $('#tbUsuarios tbody').on('click', '#btnEliminar', function () {
                    var data = table.row($(this).parents('tr')).data();
                    $('#data').val(data[0]);

                    swal({
                        title: "¿Desea Eliminar el Registro?",
                        text: "El estado del usuario " + data[0] + " será modificado",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Sí, Eliminar!",
                        closeOnConfirm: false
                    }, function () {
                        EliminarUsuario($('#data').val());
                        sweetAlert.close();
                    });


                });
            }

            function GuardarUsuario() {

                var data = $('#fmrUsuarios').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletUsuarioGuardar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Usuarios');
                        BuscarUsuarios();
                        Limpiar();
                        $('#mdUsuario').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Usuario', 'Gestión Usuarios');
                });
            }

            function ModificarUsuario() {

                var data = $('#fmrUsuarios').serialize();

                $.ajax({
                    type: "POST",
                    url: "../ServletUsuarioModificar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Usuarios');
                        BuscarUsuarios();
                        Limpiar();
                        $('#mdUsuario').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Modificar Usuario', 'Gestión Usuarios');
                });
            }

            function EliminarUsuario(data) {

                $.ajax({
                    type: "POST",
                    url: "../ServletUsuarioEliminar",
                    data: {data: data},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Usuarios');
                        BuscarUsuarios();
                        Limpiar();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Eliminar Usuario', 'Gestión Usuarios');
                });
            }

            function Validar() {

                if ($('#txtCodigoU').val().length > 0) {
                    if ($('#txtCodigoU').val().length == 10) {
                        if ($('#txtUsuario').val().length > 0) {
                            if ($('#txtPass').val().length > 0) {
                                return true;
                            } else {
                                swal("Advertencia", "Ingresar la Contraseña", "warning");
                            }
                        } else {
                            swal("Advertencia", "Ingresar el Usuario", "warning");
                        }
                    } else {
                        swal("Advertencia", "La cantidad de caracteres en el código es incorrecta", "warning");
                    }
                } else {
                    swal("Advertencia", "Ingresar el Código", "warning");
                }
                return false;
            }

            function Limpiar() {
                $('#txtCodigoU').val("");
                $('#txtUsuario').val("");
                $('#txtPass').val("");
                $('#data').val("");
            }

        </script>
        <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>

    </body>

</html>
