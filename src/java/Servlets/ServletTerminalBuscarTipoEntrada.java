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
 * @author LENOVO LEGION
 */
public class ServletTerminalBuscarTipoEntrada extends HttpServlet {

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

        String empleados = request.getParameter("empleados");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        String JSONTerminal = "[";
        PrintWriter out = response.getWriter();

        for (Terminal terminal : controladorTerminal.buscarTipoEntradaResumenEmpleado(fechaInicio, fechaFin, empleados)) {

            JSONTerminal
                    += "{"
                    + "\"empleado_documento\":\"" + terminal.getEmpleadoTerminal().getNumeroDocumentoEmpleado() + "\",\n"
                    + "\"empleado_nombre\":\"" + terminal.getEmpleadoTerminal().getNombreEmpleado() + "\",\n"
                    + "\"tipo_entrada_nombre\":\"" + tipo(terminal.getTipoTerminal()) + "\",\n"
                    + "\"tipo_entrada_numero\":\"" + terminal.getIdTerminal() + "\",\n"
                    + "\"estado_terminal\":\"" + terminal.getEstadoTerminal() + "\"\n"
                    + "},";

        }

        if (JSONTerminal.length() > 1) {
            out.println(JSONTerminal.substring(0, (JSONTerminal.length() - 1)) + "]");
        } else {
            out.println("{"
                    + "\"empleado_documento\":\"0\",\n"
                    + "\"empleado_nombre\":\"0\",\n"
                    + "\"tipo_entrada_nombre\":\"0\",\n"
                    + "\"tipo_entrada_numero\":\"0\",\n"
                    + "\"estado_terminal\":\"0\"\n"
                    + "}");
        }
    }

    public String tipo(String dato) {
        String msm;

        if (dato.equals("S/R")) {
            msm = "SIN REGISTRO";
        } else {
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
