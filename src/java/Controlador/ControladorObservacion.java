/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Observacion;
import Modelo.ModeloObservacion;

/**
 *
 * @author mario
 */
public class ControladorObservacion {

    public String guardarObservacion(Observacion obs) {
        ModeloObservacion modeloObservacion = new ModeloObservacion();
        return modeloObservacion.guardarObservacion(obs);
    }

    public Observacion buscarObservacion(String documento, int terminal) {
        ModeloObservacion modeloObservacion = new ModeloObservacion();
        return modeloObservacion.buscarObservacion(documento, terminal);
    }
}
