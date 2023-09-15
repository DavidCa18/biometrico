/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Horario;
import Modelo.ModeloHorario;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorHorario {

    public String guardarHorario(Horario hor) {
        ModeloHorario modeloHorario = new ModeloHorario();
        return modeloHorario.guardarHorario(hor);
    }

    public String modificarHorario(Horario hor) {
        ModeloHorario modeloHorario = new ModeloHorario();
        return modeloHorario.modificarHorario(hor);
    }

    public String eliminarHorario(Horario hor) {
        ModeloHorario modeloHorario = new ModeloHorario();
        return modeloHorario.eliminarHorario(hor);
    }

    public ArrayList<Horario> buscarHorario() {
        ModeloHorario modeloHorario = new ModeloHorario();
        return modeloHorario.buscarHorarios();
    }

    public ArrayList<Horario> buscarHorarioParametros(int idEmpleado) {
        ModeloHorario modeloHorario = new ModeloHorario();
        return modeloHorario.buscarHorariosParametros(idEmpleado);
    }

    public ArrayList<Horario> buscarHorarioParametrosModal(int idHorario) {
        ModeloHorario modeloHorario = new ModeloHorario();
        return modeloHorario.buscarHorariosParametrosModal(idHorario);
    }
}
