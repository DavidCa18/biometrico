/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.DescansoEmpleado;
import Modelo.ModeloDescansoEmpleado;
import java.util.ArrayList;

/**
 *
 * @author LENOVO LEGION
 */
public class ControladorDescansoEmpleado {

    public String guardarDescansoEmpleado(String valores) {
        ModeloDescansoEmpleado modeloDescansoEmpleado = new ModeloDescansoEmpleado();
        return modeloDescansoEmpleado.guardarDescansoEmpleado(valores);
    }

    public ArrayList<DescansoEmpleado> buscarDescansoEmpleadoParametro(int idEmpleado) {
        ModeloDescansoEmpleado modeloDescansoEmpleado = new ModeloDescansoEmpleado();
        return modeloDescansoEmpleado.buscarDescansoEmpleadoParametro(idEmpleado);
    }
}
