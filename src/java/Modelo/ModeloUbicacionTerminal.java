/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Parametros;
import Clases.UbicacionTerminal;
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
public class ModeloUbicacionTerminal extends ModeloConexion {

    public String guardarUbicacionTerminal(UbicacionTerminal ubi_ter) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("numero_terminal_id", ubi_ter.getIdUbicacionTerminal()));
            lista.add(new Parametros("numero_terminal_nombre", ubi_ter.getNombreUbicacionTerminal()));

            mensaje = ejecutarFuncion(3, "GestionUbicacionTerminal", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUbicacionTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Ubicación Terminal");
        }
        return mensaje;
    }

    public String modificarUbicacionTerminal(UbicacionTerminal ubi_ter) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("numero_terminal_id", ubi_ter.getIdUbicacionTerminal()));
            lista.add(new Parametros("numero_terminal_nombre", ubi_ter.getNombreUbicacionTerminal()));

            mensaje = ejecutarFuncion(3, "GestionUbicacionTerminal", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUbicacionTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Ubicación Terminal");
        }
        return mensaje;
    }

    public String eliminarUbicacionTerminal(UbicacionTerminal ubi_ter) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("numero_terminal_id", ubi_ter.getIdUbicacionTerminal()));
            lista.add(new Parametros("numero_terminal_nombre", null));

            mensaje = ejecutarFuncion(3, "GestionUbicacionTerminal", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUbicacionTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Ubicación Terminal");
        }
        return mensaje;
    }

    public ArrayList<UbicacionTerminal> buscarUbicacionTerminal() {

        ArrayList<UbicacionTerminal> listaUbicacionTerminal = new ArrayList<>();
        UbicacionTerminal ubicacionTerminal;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM numero_terminal");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                ubicacionTerminal = new UbicacionTerminal();

                ubicacionTerminal.setIdUbicacionTerminal(rs.getInt(1));
                ubicacionTerminal.setNombreUbicacionTerminal(rs.getString(2));

                listaUbicacionTerminal.add(ubicacionTerminal);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUbicacionTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Ubicación Terminal");
        } finally {
            this.cerrar();
        }

        return listaUbicacionTerminal;
    }

}
