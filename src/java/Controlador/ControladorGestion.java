/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Gestion;
import Modelo.ModeloGestion;

/**
 *
 * @author mario
 */
public class ControladorGestion {

    public String guardarGestion(Gestion ges) {
        ModeloGestion modeloGestion = new ModeloGestion();
        return modeloGestion.guardarGestion(ges);
    }

    public String removerGestion(Gestion ges) {
        ModeloGestion modeloGestion = new ModeloGestion();
        return modeloGestion.removerGestion(ges);
    }

    public String buscarGestion() {
        ModeloGestion modeloGestion = new ModeloGestion();
        return modeloGestion.buscarGestion();
    }
}
