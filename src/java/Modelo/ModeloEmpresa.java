/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Empresa;
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
public class ModeloEmpresa extends ModeloConexion {

    public String guardarEmpresa(Empresa emr) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();

        try {
            
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("empresa_nombre", emr.getNombreEmpresa().trim()));
            lista.add(new Parametros("empresa_ruc", emr.getRucEmpresa().trim()));
            lista.add(new Parametros("empresa_direccion", emr.getDireccionEmpresa().trim()));
            lista.add(new Parametros("empresa_telefono", emr.getTelefonoEmpresa().trim()));
            lista.add(new Parametros("empresa_logo", emr.getLogoEmpresa()));

            mensaje = ejecutarFuncion(6, "GestionEmpresa", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloEmpresa.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empresa");
        }
        return mensaje;
    }

    public Empresa buscarEmpresa() {

        Empresa empresa = null;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM empresa");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empresa = new Empresa();

                empresa.setNombreEmpresa(rs.getString(2));
                empresa.setRucEmpresa(rs.getString(3));
                empresa.setDireccionEmpresa(rs.getString(4));
                empresa.setTelefonoEmpresa(rs.getString(5));
                empresa.setLogoEmpresa(rs.getString(6));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empresa");
        } finally {
            this.cerrar();
        }

        return empresa;
    }
}
