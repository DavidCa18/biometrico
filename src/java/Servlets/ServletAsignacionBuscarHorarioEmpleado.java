/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Empleado;
import Clases.Horario;
import Controlador.ControladorEmpleado;
import Controlador.ControladorHorario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mario
 */
public class ServletAsignacionBuscarHorarioEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ControladorEmpleado controladorEmpleado = new ControladorEmpleado();
        String htmlCode = "<li class=\"dd-item\" data-id=\"5\">";

        for (Empleado empleado : controladorEmpleado.buscarEmpleadosAsignación()) {

            htmlCode += ""
                    + "<div class=\"dd-handle\">\n"
                    + "<span class=\"label label-info\"><i class=\"fa fa-user\"></i></span> <b>" + empleado.getNombreEmpleado() + "</b>\n"
                    + "</div>\n" + obtenerHorarios(empleado.getIdEmpleado());

        }

        response.getWriter().write(htmlCode + "\n </li>");

    }

    public String obtenerHorarios(int idEmpleado) {

        ControladorHorario controladorHorario = new ControladorHorario();
        String htmlCode = "<ol class=\"dd-list\">\n";

        for (Horario horario : controladorHorario.buscarHorarioParametros(idEmpleado)) {

            htmlCode += ""
                    + "<li class=\"dd-item\" data-id=\"2\">\n"
                    + "     <div class=\"dd-handle\">\n"
                    + "         <span class=\"pull-right\"> " + horario.getTurnoHorario() + " </span>\n"
                    + "         <span class=\"label label-warning\"><i class=\"fa fa-clock-o\"></i></span> HORARIO: DE " + horario.getEntradaHorario() + " A " + horario.getSalidaHorario() + "\n"
                    + "     </div>\n"
                    + "</li>\n";

        }
        return htmlCode + " </ol>";
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
