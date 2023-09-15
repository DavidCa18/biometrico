/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Departamento;
import Clases.Parametros;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModeloDepartamento extends ModeloConexion {

    public String guardarDepartamento(Departamento dep) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("departamento_id", null));
            lista.add(new Parametros("departamento_nombre", dep.getNombreDepartamento().trim()));
            lista.add(new Parametros("departamento_descrip", dep.getDescripDepartamento().trim()));

            mensaje = ejecutarFuncion(4, "GestionDepartamento", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Departamento");
        }
        return mensaje;
    }

    public String modificarDepartamento(Departamento dep) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("departamento_id", dep.getIdDepartamento()));
            lista.add(new Parametros("departamento_nombre", dep.getNombreDepartamento().trim()));
            lista.add(new Parametros("departamento_descrip", dep.getDescripDepartamento().trim()));

            mensaje = ejecutarFuncion(4, "GestionDepartamento", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Departamento");
        }
        return mensaje;
    }

    public String eliminarDepartamento(Departamento dep) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("departamento_id", dep.getIdDepartamento()));
            lista.add(new Parametros("departamento_nombre", null));
            lista.add(new Parametros("departamento_descrip", null));

            mensaje = ejecutarFuncion(4, "GestionDepartamento", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Departamento");
        }
        return mensaje;
    }

    public ArrayList<Departamento> buscarDepartamentos() {

        ArrayList<Departamento> listaDepartamento = new ArrayList<>();
        Departamento pepartamento;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM departamento");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                pepartamento = new Departamento();

                pepartamento.setIdDepartamento(rs.getInt(1));
                pepartamento.setNombreDepartamento(rs.getString(2));
                pepartamento.setDescripDepartamento(rs.getString(3));

                listaDepartamento.add(pepartamento);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Departamento");
        } finally {
            this.cerrar();
        }

        return listaDepartamento;
    }

}
