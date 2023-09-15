/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Empleado;
import Clases.Horario;
import Clases.HorarioEmpleado;
import Controlador.ControladorHorarioEmpleado;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mario
 */
public class ServletAsignacionGuardar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ControladorHorarioEmpleado controladorHorarioEmpleado = new ControladorHorarioEmpleado();
        HorarioEmpleado horarioEmpleado = new HorarioEmpleado();
        Empleado empleado = new Empleado();
        Horario horario = new Horario();

        int idEmpleado = Integer.parseInt(request.getParameter("cbxEmpleados"));
        int idHorario = Integer.parseInt(request.getParameter("cbxHorarios"));

        empleado.setIdEmpleado(idEmpleado);
        horario.setIdHorario(idHorario);
        horarioEmpleado.setIdEmpleado(empleado);
        horarioEmpleado.setIdHorario(horario);

        if (controladorHorarioEmpleado.guadarHorarioEmpleado(horarioEmpleado).equals("Asignación Guardada Exitosamente")) {
            response.getWriter().println("Asignación Guardada Exitosamente");
        } else {
            response.sendError(1, "Error al Guardar Asignación");
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
