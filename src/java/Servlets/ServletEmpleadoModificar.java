/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Cargo;
import Clases.Departamento;
import Clases.Empleado;
import Clases.EstadoCivil;
import Clases.Genero;
import Clases.Nacionalidad;
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
public class ServletEmpleadoModificar extends HttpServlet {

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

        ControladorEmpleado controladorEmpleado = new ControladorEmpleado();

        Empleado empleado = new Empleado();
        Genero genero = new Genero();
        EstadoCivil estadoCivil = new EstadoCivil();
        Departamento departamento = new Departamento();
        Nacionalidad nacionalidad = new Nacionalidad();
        Cargo cargo = new Cargo();

        int idEmpleado = Integer.parseInt(request.getParameter("txtCodigoE"));
        String tipoDocumento = request.getParameter("cbxTipoDocumento");
        String numeroDocumento = request.getParameter("txtNumeroDocumento");
        String nombre = request.getParameter("txtNombre");
        String fechaNacimiento = request.getParameter("txtNacimiento");
        String celular = request.getParameter("txtCelular");
        String convencional = request.getParameter("txtConvencional");
        int generoId = Integer.parseInt(request.getParameter("cbxGenero"));
        int cargoId = Integer.parseInt(request.getParameter("cbxCargo"));
        String direccion = request.getParameter("txtDireccion");
        String foto = request.getParameter("logo");
        String email = request.getParameter("txtEmail");
        String fechaEnrolamiento = request.getParameter("txtEnrolamiento");
        String oficina = request.getParameter("txtOficina");
        int estadoCivilId = Integer.parseInt(request.getParameter("cbxEstadoCivil"));
        int nacionalidadId = Integer.parseInt(request.getParameter("cbxNacionalidad"));
        int departamentoId = Integer.parseInt(request.getParameter("cbxDepartamento"));

        empleado.setIdEmpleado(idEmpleado);
        empleado.setTipoDocumentoEmpleado(tipoDocumento);
        empleado.setNumeroDocumentoEmpleado(numeroDocumento);
        empleado.setNombreEmpleado(nombre);
        empleado.setEmailEmpleado(email);
        empleado.setNacimientoEmpleado(fechaNacimiento);
        empleado.setEnrolamientoEmpleado(fechaEnrolamiento);
        empleado.setCelularEmpleado(celular);
        empleado.setConvencionalEmpleado(convencional);
        empleado.setOficinaEmpleado(oficina);
        empleado.setDireccionEmpleado(direccion);
        empleado.setFotoEmpleado(foto);
        genero.setIdGenero(generoId);
        estadoCivil.setIdEstadoCivil(estadoCivilId);
        departamento.setIdDepartamento(departamentoId);
        nacionalidad.setIdNacionalidad(nacionalidadId);
        cargo.setIdCargo(cargoId);

        empleado.setIdGenero(genero);
        empleado.setIdEstadoVicil(estadoCivil);
        empleado.setIdDepartamento(departamento);
        empleado.setIdNacionalidad(nacionalidad);
        empleado.setIdCargo(cargo);

        if (controladorEmpleado.modificarEmpleado(empleado).equals("Empleado Modificado Exitosamente")) {
            response.getWriter().println("Empleado Modificado Exitosamente");
        } else {
            response.sendError(1, "Error al Modificar Empleado");
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
