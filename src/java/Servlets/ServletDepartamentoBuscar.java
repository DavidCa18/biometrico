/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Departamento;
import Controlador.ControladorDepartamento;
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
public class ServletDepartamentoBuscar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        ControladorDepartamento controladorDepartamento = new ControladorDepartamento();

        String JSONDepartamento = "{"
                + "  \"data\": [";
        PrintWriter out = response.getWriter();

        for (Departamento departamento : controladorDepartamento.buscarDepartamentos()) {

            JSONDepartamento
                    += "["
                    + "\"" + departamento.getIdDepartamento() + "\","
                    + "\"" + departamento.getNombreDepartamento() + "\","
                    + "\"" + departamento.getDescripDepartamento() + "\","
                    + "\"EDITAR\","
                    + "\"ELIMINAR\""
                    + "],";

        }

        if (JSONDepartamento.length() > 12) {
            out.println(JSONDepartamento.substring(0, (JSONDepartamento.length() - 1)) + "]}");
        } else {
            out.println(" {  \"data\": [[\" \",\"SIN REGISTROS\",\"SIN REGISTROS\",\"EDITAR\",\"ELIMINAR\"]]}");
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
