/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Departamento;
import Modelo.ModeloDepartamento;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorDepartamento {

    public String guardarDepartamento(Departamento dep) {
        ModeloDepartamento modeloDepartamento = new ModeloDepartamento();
        return modeloDepartamento.guardarDepartamento(dep);
    }

    public String modificarDepartamento(Departamento dep) {
        ModeloDepartamento modeloDepartamento = new ModeloDepartamento();
        return modeloDepartamento.modificarDepartamento(dep);
    }

    public String eliminarDepartamento(Departamento dep) {
        ModeloDepartamento modeloDepartamento = new ModeloDepartamento();
        return modeloDepartamento.eliminarDepartamento(dep);
    }

    public ArrayList<Departamento> buscarDepartamentos() {
        ModeloDepartamento modeloDepartamento = new ModeloDepartamento();
        return modeloDepartamento.buscarDepartamentos();
    }
}
