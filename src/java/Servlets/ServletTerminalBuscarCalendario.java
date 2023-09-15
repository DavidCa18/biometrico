/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Calendario;
import Controlador.ControladorTerminal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO LEGION
 */
public class ServletTerminalBuscarCalendario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        ControladorTerminal controladorTerminal = new ControladorTerminal();

        int empleado = Integer.parseInt(request.getParameter("empleado"));
        int mes = Integer.parseInt(request.getParameter("mes"));
        int anio = Integer.parseInt(request.getParameter("anio"));

        String JSONCalendario = "[";
        PrintWriter out = response.getWriter();

        for (Calendario calendario : controladorTerminal.buscarCalendarioEmpleado(empleado, mes, anio)) {

   
            JSONCalendario
                    += "{"
                    + "\"title\":\"" + "ESTADO: " + calendario.getEstadoCalendario() + "\","
                    + "\"start\":\"" + calendario.getFechaCalendario() + "\""
                    + "},";

        }

        if (JSONCalendario.length() > 1) {
            out.println(JSONCalendario.substring(0, (JSONCalendario.length() - 1)) + "]");
        } else {
            out.println("[{ \"title\":\"N/A\",\"start\":\"2017-01-01\"}]");
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
