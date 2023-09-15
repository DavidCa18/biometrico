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
public class ServletAsignacionBuscarEmpleadoParametro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");

        ControladorEmpleado controladorEmpleado = new ControladorEmpleado();

        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));

        String JSONEmpleado = "[";
        PrintWriter out = response.getWriter();

        for (Empleado empleado : controladorEmpleado.buscarEmpleadoParametro(idEmpleado)) {

            JSONEmpleado
                    += "{\n"
                    + "\"id_empleado\":\"" + empleado.getIdEmpleado() + "\",\n"
                    + "\"nombre_empleado\":\"" + empleado.getNombreEmpleado() + "\",\n"
                    + "\"cargo_empleado\":\"" + empleado.getIdCargo().getNombreCargo()+ "\",\n"
                    + "\"numero_documento_empleado\":\"" + empleado.getNumeroDocumentoEmpleado()+ "\",\n"
                    + "\"foto_empleado\":\"" + empleado.getFotoEmpleado()+ "\",\n"
                    + "\"departamento_cargo\":\"" + empleado.getIdDepartamento().getNombreDepartamento()+ "\"\n"
                    + "},";

        }

        if (JSONEmpleado.length() > 1) {
            out.println(JSONEmpleado.substring(0, (JSONEmpleado.length() - 1)) + "]");
        } else {
            out.println("{\n"
                    + "\"id_empleado\":\"S/N\",\n"
                    + "\"nombre_empleado\":\"S/N\",\n"
                    + "\"cargo_empleado\":\"S/N\",\n"
                    + "\"numero_documento_empleado\":\"S/N\",\n"
                    + "\"foto_empleado\":\"S/N\",\n"
                    + "\"departamento_cargo\":\"S/N\"\n"
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
