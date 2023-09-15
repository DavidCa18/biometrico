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
public class ServletConsultas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        ControladorTerminal controladorConsulta = new ControladorTerminal();

        String empleados = request.getParameter("empleados");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        String JSONTerminal = "[";
        PrintWriter out = response.getWriter();

        for (Terminal terminal : controladorConsulta.buscarHistorialDetalleEmpleados(fechaInicio, fechaFin, empleados)) {

            JSONTerminal
                    += "{"
                    + "\"terminal_id\":\"" + terminal.getIdTerminal() + "\",\n"
                    + "\"empleado_nombre\":\"" + terminal.getEmpleadoTerminal().getNombreEmpleado() + "\",\n"
                    + "\"empleado_documento\":\"" + terminal.getEmpleadoTerminal().getNumeroDocumentoEmpleado() + "\",\n"
                    + "\"empleado_cargo\":\"" + terminal.getEmpleadoTerminal().getIdCargo().getNombreCargo() + "\",\n"
                    + "\"empleado_departamento\":\"" + terminal.getEmpleadoTerminal().getIdDepartamento().getNombreDepartamento() + "\",\n"
                    + "\"terminal_fecha_registro\":\"" + terminal.getFechaTerminal() + "\",\n"
                    + "\"terminal_tipo\":\"" + terminal.getTipoTerminal() + "\",\n"
                    + "\"terminal_hora_entrada_salida\":\"" + terminal.getHoraTerminal() + "\",\n"
                    + "\"terminal_observacion\":\"" + observacion(String.valueOf(terminal.getObservacionTerminal())) + "\",\n"
                    + "\"terminal_estado\":\"" + terminal.getEstadoTerminal() + "\",\n"
                    + "\"terminal_laboratario\":\"" + terminal.getNumeroTerminal().getNombreTerminalNumero() + "\",\n"
                    + "\"empleado_foto\":\"" + terminal.getEmpleadoTerminal().getFotoEmpleado() + "\"\n"
                    + "},";

        }

        if (JSONTerminal.length() > 1) {
            out.println(JSONTerminal.substring(0, (JSONTerminal.length() - 1)) + "]");
        } else {
            out.println("{"
                    + "\"terminal_id\":\"S/N\",\n"
                    + "\"empleado_nombre\":\"S/N\",\n"
                    + "\"empleado_documento\":\"S/N\",\n"
                    + "\"empleado_cargo\":\"S/N\",\n"
                    + "\"empleado_departamento\":\"S/N\",\n"
                    + "\"terminal_fecha_registro\":\"S/N\",\n"
                    + "\"terminal_tipo\":\"S/N\",\n"
                    + "\"terminal_hora_entrada_salida\":\"S/N\",\n"
                    + "\"terminal_observacion\":\"S/N\",\n"
                    + "\"terminal_estado\":\"S/N\",\n"
                    + "\"terminal_laboratario\":\"S/N\",\n"
                    + "\"empleado_foto\":\"S/N\"\n"
                    + "}");
        }

    }

    public String observacion(String dato) {
        String msm;

        if (dato.equals("null")) {
            msm = " ";
        }else{
            msm = dato;
        }

        return msm;
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
