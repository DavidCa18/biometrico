/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Cargo;
import Clases.Departamento;
import Clases.EstadoCivil;
import Clases.Genero;
import Clases.Nacionalidad;
import Modelo.ModeloComplemento;

/**
 *
 * @author mario
 */
public class ControladorComplemento {

    public String buscarEstadoCivil() {

        ModeloComplemento modeloComplemento = new ModeloComplemento();
        String htmlCode = "";

        for (EstadoCivil estadoCivil : modeloComplemento.buscarEstadoCivil()) {

            htmlCode += "<option value='" + estadoCivil.getIdEstadoCivil() + "'>" + estadoCivil.getDescripcionEstadoCivil() + "</option>\n";

        }

        return htmlCode;
    }

    public String buscarGenero() {

        ModeloComplemento modeloComplemento = new ModeloComplemento();
        String htmlCode = "";

        for (Genero genero : modeloComplemento.buscarGenero()) {

            htmlCode += "<option value='" + genero.getIdGenero() + "'>" + genero.getDescripcionGenero() + "</option>\n";

        }

        return htmlCode;
    }

    public String buscarNacionalidad() {

        ModeloComplemento modeloComplemento = new ModeloComplemento();
        String htmlCode = "";

        for (Nacionalidad nacionalidad : modeloComplemento.buscarNacionalidad()) {

            htmlCode += "<option value='" + nacionalidad.getIdNacionalidad() + "'>" + nacionalidad.getDescripcionNacionalidad() + "</option>\n";

        }

        return htmlCode;
    }

    public String buscarCargo() {

        ModeloComplemento modeloComplemento = new ModeloComplemento();
        String htmlCode = "";

        for (Cargo cargo : modeloComplemento.buscarCargo()) {

            htmlCode += "<option value='" + cargo.getIdCargo() + "'>" + cargo.getNombreCargo() + "</option>\n";

        }

        return htmlCode;
    }

    public String buscarDepartamento() {

        ModeloComplemento modeloComplemento = new ModeloComplemento();
        String htmlCode = "";

        for (Departamento departamento : modeloComplemento.buscarDepartamento()) {

            htmlCode += "<option value='" + departamento.getIdDepartamento() + "'>" + departamento.getNombreDepartamento() + "</option>\n";

        }

        return htmlCode;
    }

}
