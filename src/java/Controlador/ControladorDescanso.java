/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Descanso;
import Modelo.ModeloDescanso;
import java.util.ArrayList;

/**
 *
 * @author LENOVO LEGION
 */
public class ControladorDescanso {

    public ArrayList<Descanso> buscarDescanso() {
        ModeloDescanso modeloDescanso = new ModeloDescanso();
        return modeloDescanso.buscarDescanso();
    }
}
