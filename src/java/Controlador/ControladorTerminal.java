/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Calendario;
import Clases.Terminal;
import Modelo.ModeloTerminal;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorTerminal {

    public ArrayList<Terminal> buscarHistorialDetalleEmpleados(String fechaInicio, String fechaFinal, String empleados) {
        ModeloTerminal modeloTerminal = new ModeloTerminal();
        return modeloTerminal.buscarHistorialDetalleEmpleados(fechaInicio, fechaFinal, empleados);
    }

    public ArrayList<Terminal> buscarHistorialResumenEmpleados(String fechaInicio, String fechaFinal, String empleados) {
        ModeloTerminal modeloTerminal = new ModeloTerminal();
        return modeloTerminal.buscarHistorialResumenEmpleados(fechaInicio, fechaFinal, empleados);
    }

    public ArrayList<Terminal> buscarHistorialResumenEstadoEmpleados(String fechaInicio, String fechaFinal, String empleados) {
        ModeloTerminal modeloTerminal = new ModeloTerminal();
        return modeloTerminal.buscarHistorialResumenEstadoEmpleados(fechaInicio, fechaFinal, empleados);
    }

    public ArrayList<Calendario> buscarCalendarioEmpleado(int empleado, int mes, int anio) {
        ModeloTerminal modeloTerminal = new ModeloTerminal();
        return modeloTerminal.buscarCalendarioEmpleado(empleado, mes, anio);
    }

    public ArrayList<Terminal> buscarTipoEntradaResumenEmpleado(String fechaInicio, String fechaFinal, String empleados) {
        ModeloTerminal modeloTerminal = new ModeloTerminal();
        return modeloTerminal.buscarTipoEntradaResumenEmpleado(fechaInicio, fechaFinal, empleados);
    }
}
