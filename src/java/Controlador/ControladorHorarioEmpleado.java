/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.HorarioEmpleado;
import Modelo.ModeloHorarioEmpleado;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorHorarioEmpleado {

    public String guadarHorarioEmpleado(HorarioEmpleado hor_emp) {
        ModeloHorarioEmpleado modeloHorarioEmpleado = new ModeloHorarioEmpleado();
        return modeloHorarioEmpleado.guardarHorarioEmpleado(hor_emp);
    }

    public String modificarHorarioEmpleado(HorarioEmpleado hor_emp) {
        ModeloHorarioEmpleado modeloHorarioEmpleado = new ModeloHorarioEmpleado();
        return modeloHorarioEmpleado.modificarHorarioEmpleado(hor_emp);
    }

    public String eliminarHorarioEmpleado(HorarioEmpleado hor_emp) {
        ModeloHorarioEmpleado modeloHorarioEmpleado = new ModeloHorarioEmpleado();
        return modeloHorarioEmpleado.eliminarHorarioEmpleado(hor_emp);
    }

    public ArrayList<HorarioEmpleado> buscarHorarioEmpleado() {
        ModeloHorarioEmpleado modeloHorarioEmpleado = new ModeloHorarioEmpleado();
        return modeloHorarioEmpleado.buscarHorariosEmpleados();
    }
}
