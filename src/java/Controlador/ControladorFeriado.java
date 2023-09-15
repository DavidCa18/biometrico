/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Feriado;
import Modelo.ModeloFeriado;
import java.util.ArrayList;

/**
 *
 * @author LENOVO LEGION
 */
public class ControladorFeriado {

    public String guardarFeriado(Feriado fer) {
        ModeloFeriado modeloFeriado = new ModeloFeriado();
        return modeloFeriado.GuardarFeriado(fer);
    }

    public String modificarFeriado(Feriado fer) {
        ModeloFeriado modeloFeriado = new ModeloFeriado();
        return modeloFeriado.modificarFeriado(fer);
    }

    public String eliminarFeriado(Feriado fer) {
        ModeloFeriado modeloFeriado = new ModeloFeriado();
        return modeloFeriado.eliminarFeriado(fer);
    }

    public ArrayList<Feriado> buscarFeriados() {
        ModeloFeriado modeloFeriado = new ModeloFeriado();
        return modeloFeriado.buscarFeriados();
    }
}
