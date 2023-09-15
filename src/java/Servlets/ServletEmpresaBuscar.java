/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Empresa;
import Controlador.ControladorEmpresa;
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
public class ServletEmpresaBuscar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        ControladorEmpresa controladorEmpresa = new ControladorEmpresa();

        String JSONEmpresa = "";
        PrintWriter out = response.getWriter();

        Empresa empresa = controladorEmpresa.buscarEmpresa();

        JSONEmpresa
                += "[{"
                + "\"nombre_empresa\":\"" + empresa.getNombreEmpresa() + "\","
                + "\"ruc_empresa\":\"" + empresa.getRucEmpresa() + "\","
                + "\"direccion_empresa\":\"" + empresa.getDireccionEmpresa()+ "\","
                + "\"telefono_empresa\":\"" + empresa.getTelefonoEmpresa() + "\","
                + "\"logo_empresa\":\"" + empresa.getLogoEmpresa() + "\""
                + "}]";

        out.println(JSONEmpresa);
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
