/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Empleado;
import Controlador.ControladorEmpleado;
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
public class ServletEmpleadoBuscar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        ControladorEmpleado controladorEmpleado = new ControladorEmpleado();

        String JSONEmpleado = "{"
                + "  \"data\": [";
        PrintWriter out = response.getWriter();

        for (Empleado empleado : controladorEmpleado.buscarEmpleados()) {

            JSONEmpleado
                    += "["
                    + "\"" + empleado.getIdEmpleado() + "\","
                    + "\"" + empleado.getTipoDocumentoEmpleado() + "\","
                    + "\"" + empleado.getNumeroDocumentoEmpleado() + "\","
                    + "\"" + empleado.getNombreEmpleado() + "\","
                    + "\"" + empleado.getEmailEmpleado() + "\","
                    + "\"" + empleado.getNacimientoEmpleado() + "\","
                    + "\"" + empleado.getEnrolamientoEmpleado() + "\","
                    + "\"" + empleado.getCelularEmpleado() + "\","
                    + "\"" + empleado.getConvencionalEmpleado() + "\","
                    + "\"" + empleado.getOficinaEmpleado() + "\","
                    + "\"" + empleado.getDireccionEmpleado() + "\","
                    + "\"" + empleado.getFotoEmpleado() + "\","
                    + "\"" + empleado.getIdGenero().getIdGenero() + "\","
                    + "\"" + empleado.getIdGenero().getDescripcionGenero() + "\","
                    + "\"" + empleado.getIdEstadoVicil().getIdEstadoCivil() + "\","
                    + "\"" + empleado.getIdEstadoVicil().getDescripcionEstadoCivil() + "\","
                    + "\"" + empleado.getIdDepartamento().getIdDepartamento() + "\","
                    + "\"" + empleado.getIdDepartamento().getNombreDepartamento() + "\","
                    + "\"" + empleado.getIdNacionalidad().getIdNacionalidad() + "\","
                    + "\"" + empleado.getIdNacionalidad().getDescripcionNacionalidad() + "\","
                    + "\"" + empleado.getIdCargo().getIdCargo() + "\","
                    + "\"" + empleado.getIdCargo().getNombreCargo()+ "\","
                    + "\"EDITAR\","
                    + "\"ELIMINAR\""
                    + "],";

        }

        if (JSONEmpleado.length() > 12) {
            out.println(JSONEmpleado.substring(0, (JSONEmpleado.length() - 1)) + "]}");
        } else {
            out.println(" {  \"data\": [[\"0\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"EDITAR\",\"ELIMINAR\"]]}");
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
