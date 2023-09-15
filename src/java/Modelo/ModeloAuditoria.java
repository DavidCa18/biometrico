/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Auditoria;
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
public class ModeloAuditoria extends ModeloConexion {

    public ArrayList<Auditoria> buscarAuditoria() {

        ArrayList<Auditoria> listaAuditoria = new ArrayList<>();
        Auditoria auditoria;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM evento");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                auditoria = new Auditoria();

                auditoria.setTipoAuditoria(rs.getString(2));
                auditoria.setFechaAuditoria(rs.getString(3));
                auditoria.setTablaAuditoria(rs.getString(4));
                auditoria.setCampoAuditoria(rs.getString(5));
                auditoria.setAnteriorAuditoria(rs.getString(6));
                auditoria.setNuevoAuditoria(rs.getString(7));
                auditoria.setUsuarioAuditoria(rs.getString(8));

                listaAuditoria.add(auditoria);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Evento");
        } finally {
            this.cerrar();
        }

        return listaAuditoria;
    }
}
