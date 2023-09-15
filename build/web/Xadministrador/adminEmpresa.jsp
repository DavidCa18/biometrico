<%-- 
    Document   : adminIndex
    Created on : 11-sep-2017, 12:34:24
    Author     : mario
--%>

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
                        <li class="active">
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
                        <h2>Empresa</h2>
                        <ol class="breadcrumb">
                            <li>
                                <a>Administrador</a>
                            </li>
                            <li class="active">
                                <strong>Empresa</strong>
                            </li>
                        </ol>
                    </div>
                    <div class="col-sm-8">
                        <div class="title-action">
                            <output id="list"></output>
                        </div>
                    </div>
                </div>

                <div class="wrapper wrapper-content animated fadeInRight" >
                    <div class="row">
                        <div class="col-md-12">
                            <div class="ibox-title">
                                <form role="form"  method="POST" action="../ServletEmpresaGuardar" id="fmrUsuarios" name="fmrUsuarios">

                                    <div class="row" id="empresa_get">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Número de Documento</label> 
                                                <input type="number" placeholder="Ingresar R.U.C" class="form-control" id="ruc" name="ruc">
                                            </div>
                                            <div class="form-group">
                                                <label>Razón Social</label> 
                                                <input type="text" placeholder="Ingresar Nombre Empresa" class="form-control" id="nombre" name="nombre">
                                            </div>
                                            <div class="form-group">
                                                <label>Telefono</label> 
                                                <input type="number" placeholder="Ingresar Teléfono" class="form-control" id="telefono" name="telefono">
                                            </div>
                                            <div class="form-group">
                                                <label>Dirección</label> 
                                                <textarea class="form-control" placeholder="Ingresar Dirección" rows="3" id="direccion" name="direccion"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" rows="3" id="logo" name="logo" style="display: none"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Logo Empresarial</label> 

                                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                                    <div class="form-control" data-trigger="fileinput">
                                                        <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                                        <span class="fileinput-filename"></span>
                                                    </div>
                                                    <span class="input-group-addon btn btn-default btn-file">
                                                        <span class="fileinput-new">Select file</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" id="files" name="files[]"/>
                                                    </span>
                                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                                </div> 
                                            </div>
                                            <div class="form-group">
                                                <button type="button" class="btn btn-success" id="btnGuardarEmpresa" style="float: left"><i class="fa fa-save"></i> Guardar</button>
                                            </div>
                                            <br><br><br>
                                        </div>
                                    </div>
                                </form>
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
        <script src="../js/plugins/jasny/jasny-bootstrap.min.js"></script>

        <script src="../js/plugins/toastr/toastr.min.js"></script>
        <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

        <script>

            $(document).ready(function () {
                BuscarEmpresa();
            });

            $("#btnGuardarEmpresa").click(function () {
                var nombre = $('#nombre').val();
                var ruc = $('#ruc').val();
                var telefono = $('#telefono').val();
                var direccion = $('#direccion').val();
                var logo = $('#logo').val();

                GuardarEmpresa(nombre, ruc, telefono, direccion, logo);
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

                            var imagen = ['<img id="imagen_logo" style="max-width: 25%; max-height: 35px; top: 0; left: 0;" class="thumb" src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');

                            $('#list').empty();
                            $('#logo').val("");

                            $("#list").html(imagen);
                            $('#logo').val(e.target.result);

                        };
                    })(f);
                    reader.readAsDataURL(f);
                }
            }

            function GuardarEmpresa(nombre, ruc, telefono, direccion, logo) {

                $.ajax({
                    type: "POST",
                    url: "../ServletEmpresaGuardar",
                    data: {nombre: nombre, ruc: ruc, telefono: telefono, direccion: direccion, logo: logo},
                    success: function (responseText) {
                        toastr.success(responseText, 'Gestión Empresa');
                        BuscarEmpresa();
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Guardar Empresa', 'Gestión Empresa');
                });
            }

            function BuscarEmpresa() {
                $.ajax({
                    type: "GET",
                    url: "../ServletEmpresaBuscar",
                    success: function (empresa) {

                        $('#nombre').val(empresa[0].nombre_empresa);
                        $('#ruc').val(empresa[0].ruc_empresa);
                        $('#telefono').val(empresa[0].telefono_empresa);
                        $('#direccion').val(empresa[0].direccion_empresa);
                        $('#logo').val(empresa[0].logo_empresa);

                        var imagen = ['<img id="imagen_logo" style="max-width: 25%; max-height: 35px; top: 0; left: 0;" class="thumb" src="', empresa[0].logo_empresa, '"/>'].join('');
                        $('#list').empty();
                        $("#list").html(imagen);
                    }
                }).fail(function (xhr, ajaxOptions, thrownError) {
                    toastr.error('Error al Cargar Empresa', 'Gestión Empresa');
                });
            }

        </script>
        <script src="../js/TimeOut/timeOut.js" type="text/javascript"></script>

    </body>

</html>
