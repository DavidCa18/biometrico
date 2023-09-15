/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Cargo;
import Clases.ErrorLog;
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
public class ModeloError extends ModeloConexion {

    public void escribirLog(String error, String clase) {

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("error_tipo", "Error"));
            lista.add(new Parametros("error_modulo", clase));
            lista.add(new Parametros("error_mensaje", error));

            ejecutarFuncion(4, "GestionError", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloError.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Error");
        }
    }

    public ArrayList<ErrorLog> buscarErrores() {

        ArrayList<ErrorLog> listaErrorLog = new ArrayList<>();
        ErrorLog errorLog;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM error");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                errorLog = new ErrorLog();

                errorLog.setFechaError(rs.getString(2));
                errorLog.setTipoError(rs.getString(3));
                errorLog.setModuloError(rs.getString(4));
                errorLog.setMensajeError(rs.getString(5));

                listaErrorLog.add(errorLog);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Error");
        } finally {
            this.cerrar();
        }

        return listaErrorLog;
    }

}
