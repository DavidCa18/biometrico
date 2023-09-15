
<%@page import="Controlador.ControladorComplemento"%>
<%@page import="Controlador.ControladorEmpresa"%>
<% ControladorEmpresa controladorEmpresa = new ControladorEmpresa();
    ControladorComplemento controladorComplemento = new ControladorComplemento();
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
        <link href="../css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">

        <link href="../css/plugins/datapicker/datepicker3.css" rel="stylesheet" type="text/css"/>

        <link href="../css/plugins/dataTables/datatables.min.css" rel="stylesheet">
        <link href="../css/plugins/toastr/toastr.min.css" rel="stylesheet">
        <link href="../css/plugins/ladda/ladda-themeless.min.css" rel="stylesheet">
        <link href="../css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
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
                        <li class="active">
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
                        <h2>Gestión Empleados</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Empleados</strong>
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
                                    <button type="button" class="btn btn-w-m btn-success" data-toggle="modal" data-target="#mdEmpleado" id="guardar"><i class="fa fa-plus"></i> Agregar Empleados</button>
                                </div>

                                <div class="table-responsive" >
                                    <table id="tbEmpleado" class="table table-striped table-bordered table-hover" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="background: #3B93D1; color: white">Código</th>
                                                <th style="background: #3B93D1; color: white">Tipo Documento</th>
                                                <th style="background: #3B93D1; color: white">N° Documento</th>
                                                <th style="background: #3B93D1; color: white">Nombre</th>
                                                <th style="background: #3B93D1; color: white">Correo Electrónico</th>
                                                <th style="background: #3B93D1; color: white">Fecha Nacimiento</th>
                                                <th style="background: #3B93D1; color: white">Fecha Enrolamiento</th>
                                                <th style="background: #3B93D1; color: white">Celular</th>
                                                <th style="background: #3B93D1; color: white">Convencional</th>
                                                <th style="background: #3B93D1; color: white">Oficina</th>
                                                <th style="background: #3B93D1; color: white">Dirección</th>
                                                <th style="background: #3B93D1; color: white">Foto</th>
                                                <th style="background: #3B93D1; color: white">Código Género</th>
                                                <th style="background: #3B93D1; color: white">Género</th>
                                                <th style="background: #3B93D1; color: white">Código Estado Civil</th>
                                                <th style="background: #3B93D1; color: white">Estado Civil</th>
                                                <th style="background: #3B93D1; color: white">Códugo Departamento</th>
                                                <th style="background: #3B93D1; color: white">Departamento</th>
                                                <th style="background: #3B93D1; color: white">Código Nacionalidad</th>
                                                <th style="background: #3B93D1; color: white">Nacionalidad</th>
                                                <th style="background: #3B93D1; color: white">Código Cargo</th>
                                                <th style="background: #3B93D1; color: white">Cargo</th>
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
        <div class="modal fade" id="mdEmpleado" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated flipInY">
                    <form role="form" method="POST" id="fmrEmpleado" name="fmrEmpleado">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h2 class="modal-title font-bold">Gestión de Empleados</h2>
                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Código Empleado</label>
                                        
                                        <input type="number" placeholder="Ingresar Código Empleado / Biométrico" class="form-control" id="txtCodigoE" name="txtCodigoE">
                                    </div>
                                    <div class="form-group">
                                        <label>Tipo Documento</label>
                                        <select class="form-control" id="cbxTipoDocumento" name="cbxTipoDocumento">
                                            <option value="CÉDULA">CÉDULA</option>
                                            <option value="PASAPORTE">PASAPORTE</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Número Documento</label>
                                        <input type="number" placeholder="Ingresar Número Documento" class="form-control" id="txtNumeroDocumento" name="txtNumeroDocumento">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Foto Empleado</label> 
                                    <textarea class="form-control" rows="3" id="logo" name="logo" style="display: none"></textarea>
                                    <output id="list" style="text-align: center"></output>
                                    <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                        <div class="form-control" data-trigger="fileinput">
                                            <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                            <span class="fileinput-filename" style="width: 20px"></span>
                                        </div>
                                        <span class="input-group-addon btn btn-default btn-file">
                                            <span class="fileinput-new">Select file</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" id="files" name="files[]"/>
                                        </span>
                                        <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input type="text" placeholder="Ingresar Nombre Empleado" class="form-control" id="txtNombre" name="txtNombre">
                                    </div>
                                    <div class="form-group" id="data_1">
                                        <label>Fecha Nacimineto</label>
                                        <div class="input-group date">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text"
                                                                                                                        class="form-control" id="txtNacimiento" name="txtNacimiento">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Número Celular</label>
                                        <input type="number" placeholder="Ingresar Celular" class="form-control" id="txtCelular" name="txtCelular">
                                    </div>

                                    <div class="form-group">
                                        <label>Número Convencional</label>
                                        <input type="number" placeholder="Ingresar Convencional" class="form-control" id="txtConvencional" name="txtConvencional">
                                    </div>
                                    <div class="form-group">
                                        <label>Género</label>
                                        <select class="form-control" id="cbxGenero" name="cbxGenero">
                                            <%= controladorComplemento.buscarGenero()%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Cargo</label>
                                        <select class="form-control" id="cbxCargo" name="cbxCargo">
                                            <%= controladorComplemento.buscarCargo()%>
                                        </select>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Correo Electrónico</label>
                                        <input type="email" placeholder="Ingresar Código Correo Electrónico" class="form-control" id="txtEmail" name="txtEmail">
                                    </div>
                                    <div class="form-group" id="data_1">
                                        <label>Fecha Enrolamiento</label>
                                        <div class="input-group date">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text"
                                                                                                                        class="form-control" id="txtEnrolamiento" name="txtEnrolamiento">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Número Oficina</label>
                                        <input type="number" placeholder="Ingresar Oficina" class="form-control" id="txtOficina" name="txtOficina">
                                    </div>
                                    <div class="form-group">
                                        <label>Estado Civil</label>
                                        <select class="form-control" id="cbxEstadoCivil" name="cbxEstadoCivil">
                                            <%= controladorComplemento.buscarEstadoCivil()%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Nacionalidad</label>
                                        <select class="form-control" id="cbxNacionalidad" name="cbxNacionalidad">
                                            <%= controladorComplemento.buscarNacionalidad()%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Departamento</label>
                                        <select class="form-control" id="cbxDepartamento" name="cbxDepartamento">
                                            <%= controladorComplemento.buscarDepartamento()%>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Descanso <p id="textoModificar" style="color: #ff3333">Campo no modificable desde este módulo. <a href="">Modicar click aqui</a></p></label>
                                <select class="form-control m-b" id="cbxDescanso" name="cbxDescanso" style="height: 35px" multiple>                                           

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Dirección</label>
                                <textarea class="form-control" placeholder="Ingresar Dirección de Domicilio" id="txtDireccion" name="txtDireccion" rows="2"></textarea>

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal"><i class="fa fa-times"></i>  Cancelar</button>
                            <button type="submit" class="ladda-button ladda-button-demo btn btn-warning" id="btnModificarEmpleado"><i class="fa fa-pencil"></i> Modificar</button>
                            <button type="submit" class="ladda-button ladda-button-demo btn btn-success" id="btnGuardarEmpleado"><i class="fa fa-save"></i> Guardar</button>
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
        <script src="../js/plugins/jasny/jasny-bootstrap.min.js"></script>

        <script src="../js/plugins/datapicker/bootstrap-datepicker.js" type="text/javascript"></script>

        <script src="../js/plugins/dataTables/datatables.min.js"></script>

        <script src="../js/plugins/toastr/toastr.min.js"></script>

        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

        <script src="../js/plugins/ladda/spin.min.js"></script>
        <script src="../js/plugins/ladda/ladda.min.js"></script>
        <script src="../js/plugins/ladda/ladda.jquery.min.js"></script>
        <script src="../js/bootstrap-multiselect.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                InsertarFecha();
                BuscarDescansos();
                BuscarEmpleado();
            });

            $('#btnGuardarEmpleado').click(function (e) {
                e.preventDefault();
                if (Validar()) {
                    GuardarEmpleado();
                }

            });

            $('#btnModificarEmpleado').click(function (e) {
                e.preventDefault();
                if (Validar()) {
                    ModificarEmpleado();
                }
            });

            $('#guardar').click(function (e) {
                Limpiar();
                $("#btnModificarEmpleado").css("display", "none");
                $("#btnGuardarEmpleado").css("display", "inline");
                $("#textoModificar").css("display", "none");
            });

            $('#files').change(function (e) {
                archivo(e);
            });

            function archivo(evt) {
                var files = evt.target.files;
                for (var i = 0, f; f = files[i]; i++) {
                    if (!f.type.match('image.*')) {
                        continue;
                    }
                    var reader = new FileReader();
                    reader.onload = (function (theFile) {
                        return function (e) {

                            var imagen = ['<img id="imagen_empleado" style="width: 55%; height: 140px; top: 0; left: 0;" class="thumb" src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');

                            $('#list').empty();
                            $('#logo').val("");

                            $("#list").html(imagen);
                            $('#logo').val(e.target.result);

                        };
                    })(f);
                    reader.readAsDataURL(f);
                }
            }

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

            function BuscarEmpleado() {

                var table = $('#tbEmpleado').DataTable({
                    "ajax": "../ServletEmpleadoBuscar",
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
                            "defaultContent": "<button id='btnEliminar' class='ladda-button ladda-button-demo btn btn-danger' type='button'><i class='fa fa-trash'></i></button>"
                        },
                        {
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        },
                        {
                            "targets": [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20],
                            "visible": false
                        }
                    ],
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

                $('#tbEmpleado tbody').on('click', '#btnModificar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    $("#btnGuardarEmpleado").css("display", "none");
                    $("#btnModificarEmpleado").css("display", "inline");
                    $("#textoModificar").css("display", "inline");
                    $('#mdEmpleado').modal('show');

                    $('#txtCodigoE').val(data[0]);
                    $('#cbxTipoDocumento').val(data[1]);
                    $('#txtNumeroDocumento').val(data[2]);
                    $('#txtNombre').val(data[3]);
                    $('#txtEmail').val(data[4]);
                    $('#txtNacimiento').val(data[5]);
                    $('#txtEnrolamiento').val(data[6]);
                    $('#txtCelular').val(data[7]);
                    $('#txtConvencional').val(data[8]);
                    $('#txtOficina').val(data[9]);
                    $('#txtDireccion').val(data[10]);
                    $('#logo').val(data[11]);

                    var imagen = ['<img id="imagen_logo" style="width: 55%; height: 140px; top: 0; left: 0;" class="thumb" src="', data[11], '"/>'].join('');
                    $('#list').empty();
                    $("#list").html(imagen);

                    $('#cbxEstadoCivil').val(data[14]);
                    $('#cbxDepartamento').val(data[16]);
                    $('#cbxNacionalidad').val(data[18]);
                    $('#cbxGenero').val(data[12]);
                    $('#cbxCargo').val(data[20]);

                    BuscarDescansosEmpleados(data[0]);

                });

                $('#tbEmpleado tbody').on('click', '#btnEliminar', function () {
                    var data = table.row($(this).parents('tr')).data();

                    swal({
                        title: "¿Desea Eliminar el Registro?",
                        text: "El Empleado " + data[3] + " será Eliminado",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Sí, Eliminar!",
                        closeOnConfirm: false
                    }, function () {
                        EliminarEmpleado(data[0]);
                        sweetAlert.close();
                    });


                });
            }

            function BuscarDescansos() {

                $.ajax({
                    type: "GET",
                    url: "../ServletDescansoBuscar",
                    success: function (responseText) {
                        var htmlOut = '';
                        for (var i = 0; i < responseText.length; i++) {
                            htmlOut += "<option value='" + responseText[i].id_descanso + "'>" + responseText[i].dia_descanso + "</option>\n";
                        }

                        $('#cbxDescanso').empty();
                        $('#cbxDescanso').append(htmlOut);

                        $('#cbxDescanso').multiselect('destroy');
                        $('#cbxDescanso').multiselect({
                            includeSelectAllOption: true,
                            enableFiltering: true,
                            buttonWidth: '100%',
                            maxHeight: 200
                        });
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Cargar Descansos', 'Gestión Descansos');
                });
            }

            function BuscarDescansosEmpleados(idEmpleado) {

                $.ajax({
                    type: "GET",
                    url: "../ServletDescansoEmpleadoBuscar",
                    data: {idEmpleado: idEmpleado},
                    success: function (responseText) {
                        $('#cbxDescanso').multiselect("deselectAll", false).multiselect("refresh");
                        for (var i = 0; i < responseText.length; i++) {
                            $('#cbxDescanso').multiselect('select', '' + responseText[i].dia_descanso + '', true);
                            $('#cbxDescanso').multiselect('refresh');
                        }

                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Cargar Descanso Empleado', 'Gestión Descanso Empleado');
                });
            }

            function GuardarEmpleado() {

                var data = $('#fmrEmpleado').serialize();
                var l = $('.ladda-button-demo').ladda();
                l.ladda('start');
                $.ajax({
                    type: "POST",
                    url: "../ServletEmpleadoGuardar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Empleado');
                        l.ladda('stop');
                        DescansoEmpleado();
                        BuscarEmpleado();
                        Limpiar();
                        $('#mdEmpleado').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Empleado.\nEl código ingresado ya fue asignado a un empleado', 'Gestión Empleado');
                    l.ladda('stop');
                });
            }

            function ModificarEmpleado() {

                var data = $('#fmrEmpleado').serialize();
                var l = $('.ladda-button-demo').ladda();
                l.ladda('start');
                $.ajax({
                    type: "POST",
                    url: "../ServletEmpleadoModificar",
                    data: data,
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Empleado');
                        l.ladda('stop');
                        BuscarEmpleado();
                        Limpiar();
                        $('#mdEmpleado').modal('toggle');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Empleado', 'Gestión Empleado');
                    l.ladda('stop');
                });
            }

            function EliminarEmpleado(txtCodigoE) {

                var l = $('.ladda-button-demo').ladda();
                l.ladda('start');
                $.ajax({
                    type: "POST",
                    url: "../ServletEmpleadoEliminar",
                    data: {txtCodigoE: txtCodigoE},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Empleado');
                        l.ladda('stop');
                        BuscarEmpleado();
                        Limpiar();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Empleado', 'Gestión Empleado');
                    l.ladda('stop');
                });
            }

            function DescansoEmpleado() {
                var empleado = $('#txtCodigoE').val();
                var selected = $("#cbxDescanso option:selected");
                var concat = "";
                selected.each(function () {
                    concat += "( '" + empleado + "','" + $(this).val() + "' ),";
                });
                var valores = concat.substring(0, (concat.length - 1));
                GuardarDescansoEmpleado(valores);
            }

            function GuardarDescansoEmpleado(valores) {

                $.ajax({
                    type: "POST",
                    url: "../ServletDescansoEmpleadoGuardar",
                    data: {valores: valores},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Descanso Empleado');
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Descanso Empleado', 'Gestión Descanso Empleado');
                });
            }

            function Validar() {

                var descanso = $('#cbxDescanso').val();
                if ($('#txtCodigoE').val().length > 0) {
                    if ($('#txtNumeroDocumento').val().length > 0) {
                        if ($('#txtNombre').val().length > 0) {
                            if ($('#txtEmail').val().length > 0) {
                                if ($('#txtNacimiento').val().length > 0) {
                                    if (validate_date($('#txtNacimiento').val()) == true) {
                                        if ($('#txtEnrolamiento').val().length > 0) {
                                            if (validate_date($('#txtEnrolamiento').val()) == true) {
                                                if ($('#txtCelular').val().length > 0) {
                                                    if ($('#txtConvencional').val().length > 0) {
                                                        if ($('#txtOficina').val().length > 0) {
                                                            if ($('#txtDireccion').val().length > 0) {
                                                                if ($('#logo').val().length > 0) {
                                                                    if (descanso.length > 0) {
                                                                        return true;
                                                                    } else {
                                                                        swal("Advertencia", "Ingresar días de descanso del empleado", "warning");
                                                                    }
                                                                } else {
                                                                    swal("Advertencia", "Ingresar foto del empleado", "warning");
                                                                }
                                                            } else {
                                                                swal("Advertencia", "Ingresar dirección del domicilio", "warning");
                                                            }
                                                        } else {
                                                            swal("Advertencia", "Ingresar número oficina\nsi no posee digite 00", "warning");
                                                        }
                                                    } else {
                                                        swal("Advertencia", "Ingresar número convencional\nsi no posee digite 00", "warning");
                                                    }
                                                } else {
                                                    swal("Advertencia", "Ingresar número celular\nsi no posee digite 00", "warning");
                                                }
                                            } else {
                                                swal("Advertencia", "Ingresar fecha de enrolamiento válida", "warning");
                                            }
                                        } else {
                                            swal("Advertencia", "Ingresar fecha de enrolamiento", "warning");
                                        }
                                    } else {
                                        swal("Advertencia", "Ingresar fecha de nacimiento válida", "warning");
                                    }
                                } else {
                                    swal("Advertencia", "Ingresar fecha de nacimiento", "warning");
                                }
                            } else {
                                swal("Advertencia", "Ingresar correo electrónico", "warning");
                            }
                        } else {
                            swal("Advertencia", "Ingresar nombre del empleado", "warning");
                        }
                    } else {
                        swal("Advertencia", "Ingresar número de documento", "warning");
                    }
                } else {
                    swal("Advertencia", "Ingresar código del empleado", "warning");
                }

                return false;
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

            function Limpiar() {
                $('#txtCodigoE').val("");
                $('#txtNumeroDocumento').val("");
                $('#txtNombre').val("");
                $('#txtEmail').val("");
                $('#txtNacimiento').val("");
                $('#txtEnrolamiento').val("");
                $('#txtCelular').val("");
                $('#txtConvencional').val("");
                $('#txtOficina').val("");
                $('#txtDireccion').val("");
                $('#logo').val("");
                $('#list').empty();
                $('#cbxDescanso').multiselect("deselectAll", false).multiselect("refresh");
            }

        </script>
        <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>
    </body>

</html>
