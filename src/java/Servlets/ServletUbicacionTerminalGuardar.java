/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.UbicacionTerminal;
import Controlador.ControladorUbicacionTerminal;
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
public class ServletUbicacionTerminalGuardar extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
       
        ControladorUbicacionTerminal controladorUbicacionTerminal = new ControladorUbicacionTerminal();
        UbicacionTerminal ubicacionTerminal = new UbicacionTerminal();

        int idUbicacionTerminal = Integer.parseInt(request.getParameter("txtCodigoUT"));
        String nombre = request.getParameter("txtNombreUbicacionTerminal");

        ubicacionTerminal.setIdUbicacionTerminal(idUbicacionTerminal);
        ubicacionTerminal.setNombreUbicacionTerminal(nombre);

        if (controladorUbicacionTerminal.guardarUbicacionTerminal(ubicacionTerminal).equals("Nombre del Terminal Guardado Exitosamente")) {
            response.getWriter().println("Nombre del Terminal Guardado Exitosamente");
        } else {
            response.sendError(1, "Error al Guardar Terminal");
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
