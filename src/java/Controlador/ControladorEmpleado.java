/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Empleado;
import Modelo.ModeloEmpleado;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorEmpleado {

    public String guardarEmpleado(Empleado emp) {
        ModeloEmpleado modeloEmpleado = new ModeloEmpleado();
        return modeloEmpleado.guardarEmpleado(emp);
    }

    public String modificarEmpleado(Empleado emp) {
        ModeloEmpleado modeloEmpleado = new ModeloEmpleado();
        return modeloEmpleado.modificarEmpleado(emp);
    }

    public String eliminarEmpleado(Empleado emp) {
        ModeloEmpleado modeloEmpleado = new ModeloEmpleado();
        return modeloEmpleado.eliminarEmpleado(emp);
    }

    public ArrayList<Empleado> buscarEmpleados() {
        ModeloEmpleado modeloEmpleado = new ModeloEmpleado();
        return modeloEmpleado.buscarEmpleado();
    }

    public ArrayList<Empleado> buscarEmpleadosAsignación() {
        ModeloEmpleado modeloEmpleado = new ModeloEmpleado();
        return modeloEmpleado.buscarEmpleadoAsignacion();
    }

    public ArrayList<Empleado> buscarEmpleadoParametro(int idEmpleado) {
        ModeloEmpleado modeloEmpleado = new ModeloEmpleado();
        return modeloEmpleado.buscarEmpleadoParametro(idEmpleado);
    }
}
