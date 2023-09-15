/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Observacion;
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
public class ModeloObservacion extends ModeloConexion {

    public String guardarObservacion(Observacion obs) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("observacion_id", null));
            lista.add(new Parametros("detalle", obs.getDetalleObservacion()));
            lista.add(new Parametros("terminal_id", obs.getIdTerminal()));
            lista.add(new Parametros("empleado_num", obs.getNumeroDocumentoEmpleado()));

            mensaje = ejecutarFuncion(5, "GestionObservacion", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloObservacion.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Observación");
        }
        return mensaje;
    }

    public Observacion buscarObservacion(String documento, int terminal) {

        Observacion observacion = null;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT\n"
                    + "obs_detalle\n"
                    + "FROM\n"
                    + "observacion\n"
                    + "WHERE \n"
                    + "observacion.eml_numero_documento = '" + documento + "'\n"
                    + "AND\n"
                    + "observacion.ter_id = '" + terminal + "'");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                observacion = new Observacion();

                observacion.setDetalleObservacion(rs.getString(1));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Observación");
        } finally {
            this.cerrar();
        }

        return observacion;
    }

}
