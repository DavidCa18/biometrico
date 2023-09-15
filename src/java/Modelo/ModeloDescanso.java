/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Descanso;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO LEGION
 */
public class ModeloDescanso extends ModeloConexion{
    
    public ArrayList<Descanso> buscarDescanso() {

        ArrayList<Descanso> listaDescanso = new ArrayList<>();
        Descanso descanso;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM descanso");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                descanso = new Descanso();

                descanso.setIdDescanso(rs.getInt(1));
                descanso.setDiaDescanso(rs.getString(2));

                listaDescanso.add(descanso);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Descanso");
        } finally {
            this.cerrar();
        }

        return listaDescanso;
    }
    
}
