/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Usuario;
import Controlador.ControladorUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mario
 */
public class ServletInicioSesion extends HttpServlet {

    //ServletInicioSesion
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession sesion = request.getSession(true);

        Usuario usuario = new Usuario();
        ControladorUsuario controladorUsuario = new ControladorUsuario();

        String user = request.getParameter("txtUsuario");
        String pass = request.getParameter("txtPass");

        usuario.setNombreUsuario(user);
        usuario.setPasswordsuario(pass);

        if (controladorUsuario.verificarUsuario(usuario).equals("1") && sesion.getAttribute("sesionActivaAdministrador") == null) {

            sesion.setAttribute("sesionActivaAdministrador", user);
            response.getWriter().println("Xadministrador/adminIndex.jsp");

        } else if (controladorUsuario.verificarUsuario(usuario).equals("2") && sesion.getAttribute("sesionActivaBusqueda") == null) {

            sesion.setAttribute("sesionActivaBusqueda", user);            
            response.getWriter().println("Xbusquedas/busquedasIndex.jsp");

        } else if (controladorUsuario.verificarUsuario(usuario).equals("3") && sesion.getAttribute("sesionActivaUsuario") == null) {

            sesion.setAttribute("sesionActivaUsuario", user);
            response.getWriter().println("Xusuarios/userIndex.jsp");

        } else if (controladorUsuario.verificarUsuario(usuario).equals("0")) {
            response.sendError(1, "Error al Iniciar Sesión");
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
