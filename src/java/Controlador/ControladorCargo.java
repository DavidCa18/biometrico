
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Cargo;
import Modelo.ModeloCargo;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorCargo {

    public String guardarCargo(Cargo car) {
        ModeloCargo modeloCargo = new ModeloCargo();
        return modeloCargo.guardarCargo(car);
    }
    
    public String modificarCargo(Cargo car) {
        ModeloCargo modeloCargo = new ModeloCargo();
        return modeloCargo.modificarCargo(car);
    }
    
    public String eliminarCargo(Cargo car) {
        ModeloCargo modeloCargo = new ModeloCargo();
        return modeloCargo.eliminarCargo(car);
    }

    public ArrayList<Cargo> buscarDepartamentos() {
        ModeloCargo modeloCargo = new ModeloCargo();
        return modeloCargo.buscarCargos();
    }
}
