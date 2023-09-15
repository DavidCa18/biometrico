/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Terminal;
import Controlador.ControladorTerminal;
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
public class ServletConsultasResumen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        ControladorTerminal controladorConsulta = new ControladorTerminal();

        String empleados = request.getParameter("empleados");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        String JSONConsulta = "[";
        PrintWriter out = response.getWriter();

        for (Terminal terminal : controladorConsulta.buscarHistorialResumenEmpleados(fechaInicio, fechaFin, empleados)) {

            JSONConsulta
                    += "{"
                    + "\"id_empleado\":\"" + terminal.getEmpleadoTerminal().getIdEmpleado()+ "\",\n"
                    + "\"nombre_empleado\":\"" + terminal.getEmpleadoTerminal().getNombreEmpleado() + "\",\n"
                    + "\"timbradas_empleado\":\"" + terminal.getIdTerminal()+ "\"\n"
                    + "},";

        }

        if (JSONConsulta.length() > 1) {
            out.println(JSONConsulta.substring(0, (JSONConsulta.length() - 1)) + "]");
        } else {
            out.println("{"
                    + "\"id_empleado\":\"S/N\",\n"
                    + "\"nombre_empleado\":\"S/N\",\n"
                    + "\"timbradas_empleado\":\"S/N\"\n"
                    + "}");
        }
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
