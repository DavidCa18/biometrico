/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Gestion;
import Clases.Parametros;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mario
 */
public class ModeloGestion extends ModeloConexion {

    public String guardarGestion(Gestion ges) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();

        try {

            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("codigo", ges.getCodigoGestion().trim()));

            mensaje = ejecutarFuncion(2, "GestionAut", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloGestion.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Gestión");
        }
        return mensaje;
    }

    public String removerGestion(Gestion ges) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();

        try {

            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("codigo", ges.getCodigoGestion().trim()));

            mensaje = ejecutarFuncion(2, "GestionAut", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloGestion.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Gestión");
        }
        return mensaje;
    }

    public String buscarGestion() {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();

        try {

            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("codigo", ""));

            mensaje = ejecutarFuncion(2, "GestionAut", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloGestion.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Gestión");
        }
        return mensaje;

    }

}
