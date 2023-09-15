<%-- 
    Document   : adminReporteGlobla
    Created on : 02-oct-2017, 13:48:30
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">


        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <title>Reporte Global</title>
    </head>
    <body style="background: white;" class="wrapper">

        <% String parametro = request.getParameter("txtImprimir");%>
        
        <div id="pagina">
            <br><br>
            <%= parametro%>
        </div>

        <script src="../js/jquery-3.1.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

        <script src="../js/jquery.PrintArea.js" type="text/javascript"></script>

    </body>

    <script>
        $("div#pagina").printArea();
    </script>
</html>
