/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Horario;
import Controlador.ControladorHorario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mario
 */
public class ServletHorarioGuardar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ControladorHorario controladorHorario = new ControladorHorario();
        Horario horario = new Horario();

        String turno = request.getParameter("cbxTurno");
        String entrada = request.getParameter("txtHoraEntrada");
        String salida = request.getParameter("txtHoraSalida");
        String espera = request.getParameter("txtHoraEspera");

        horario.setTurnoHorario(turno);
        horario.setEntradaHorario(entrada);
        horario.setSalidaHorario(salida);
        horario.setEsperaHorario(espera);

        if (controladorHorario.guardarHorario(horario).equals("Horario Guardado Exitosamente")) {
            response.getWriter().println("Horario Guardado Exitosamente");
        } else {
            response.sendError(1, "Error al Guardar Horario");
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

