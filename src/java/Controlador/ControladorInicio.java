/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Inicio;
import Modelo.ModeloInicio;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorInicio {

    public ArrayList<Inicio> buscarTimbradasMensual(String anio) {
        ModeloInicio modeloInicio = new ModeloInicio();
        return modeloInicio.buscarTimbradasMensual(anio);
    }

    public String buscarAnios() {

        ModeloInicio modeloInicio = new ModeloInicio();
        String htmlCode = "";

        for (Inicio inicio : modeloInicio.buscarAnios()) {

            htmlCode += "<option value='" + inicio.getAnios() + "'>" + inicio.getAnios() + "</option>";

        }

        return htmlCode;
    }

    public String buscarNumEmpleados() {

        ModeloInicio modeloInicio = new ModeloInicio();
        String htmlCode = "";

        htmlCode += "<h2 class=\"font-bold\">" + modeloInicio.buscarNumEmpleados() + "</h2>";

        return htmlCode;
    }

    public String buscarNumHorarios() {

        ModeloInicio modeloInicio = new ModeloInicio();
        String htmlCode = "";

        htmlCode += "<h2 class=\"font-bold\">" + modeloInicio.buscarNumHorarios() + "</h2>";

        return htmlCode;
    }

    public String buscarNumUsuarios() {

        ModeloInicio modeloInicio = new ModeloInicio();
        String htmlCode = "";

        htmlCode += "<h2 class=\"font-bold\">" + modeloInicio.buscarNumUsuarios() + "</h2>";

        return htmlCode;
    }

    public String buscarNumTimbradas() {

        ModeloInicio modeloInicio = new ModeloInicio();
        String htmlCode = "";

        htmlCode += "<h2 class=\"font-bold\">" + modeloInicio.buscarNumTimbradas() + "</h2>";

        return htmlCode;
    }
}
