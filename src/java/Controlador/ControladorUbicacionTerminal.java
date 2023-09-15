/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.UbicacionTerminal;
import Modelo.ModeloUbicacionTerminal;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorUbicacionTerminal {

    public String guardarUbicacionTerminal(UbicacionTerminal ubi_ter) {
        ModeloUbicacionTerminal modeloUbicacionTerminal = new ModeloUbicacionTerminal();
        return modeloUbicacionTerminal.guardarUbicacionTerminal(ubi_ter);
    }

    public String modificarUbicacionTerminal(UbicacionTerminal ubi_ter) {
        ModeloUbicacionTerminal modeloUbicacionTerminal = new ModeloUbicacionTerminal();
        return modeloUbicacionTerminal.modificarUbicacionTerminal(ubi_ter);
    }

    public String eliminarUbicacionTerminal(UbicacionTerminal ubi_ter) {
        ModeloUbicacionTerminal modeloUbicacionTerminal = new ModeloUbicacionTerminal();
        return modeloUbicacionTerminal.eliminarUbicacionTerminal(ubi_ter);
    }

    public ArrayList<UbicacionTerminal> buscarUbicacionTerminal() {
        ModeloUbicacionTerminal modeloUbicacionTerminal = new ModeloUbicacionTerminal();
        return modeloUbicacionTerminal.buscarUbicacionTerminal();
    }
}
