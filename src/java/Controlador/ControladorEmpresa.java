/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Empresa;
import Modelo.ModeloEmpresa;

/**
 *
 * @author mario
 */
public class ControladorEmpresa {

    public String guardarEmpresa(Empresa emr) {
        ModeloEmpresa modeloEmpresa = new ModeloEmpresa();
        return modeloEmpresa.guardarEmpresa(emr);
    }

    public Empresa buscarEmpresa() {
        ModeloEmpresa modeloEmpresa = new ModeloEmpresa();
        return modeloEmpresa.buscarEmpresa();
    }

    public String buscarLogoEmpresa() {
        String html;

        ModeloEmpresa modeloEmpresa = new ModeloEmpresa();
        Empresa empresa = modeloEmpresa.buscarEmpresa();

        html = "<img id=\"imagen_logo\" style=\"max-width: 25%; max-height: 35px; top: 0; left: 0;\" class=\"thumb\" src=\"" + empresa.getLogoEmpresa() + "\"/>";

        return html;
    }

}
