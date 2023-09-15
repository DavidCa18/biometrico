/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Inicio;
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
public class ModeloInicio extends ModeloConexion {

    public ArrayList<Inicio> buscarTimbradasMensual(String anio) {

        ArrayList<Inicio> listaInicio = new ArrayList<>();
        Inicio inicio;

        try {

            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("CALL buscar_timbradas_mesuales('" + anio + "')");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                inicio = new Inicio();

                inicio.setMes(rs.getString(1));
                inicio.setNumeroTimbradas(rs.getString(2));

                listaInicio.add(inicio);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloInicio.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Inicio");
        } finally {
            this.cerrar();
        }

        return listaInicio;
    }

    public ArrayList<Inicio> buscarAnios() {

        ArrayList<Inicio> listaInicio = new ArrayList<>();
        Inicio inicio;

        try {

            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT DISTINCT YEAR(terminal.ter_fecha_tiempo) AS 'anio' FROM terminal");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                inicio = new Inicio();

                inicio.setAnios(rs.getString(1));

                listaInicio.add(inicio);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloInicio.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Inicio");
        } finally {
            this.cerrar();
        }

        return listaInicio;
    }

    public String buscarNumEmpleados() {

        String empleados = "";

        try {

            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT Count(empleado.eml_id) FROM empleado");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empleados = (rs.getString(1));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloInicio.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Inicio");
        } finally {
            this.cerrar();
        }

        return empleados;
    }

    public String buscarNumHorarios() {

        String horarios = "";

        try {

            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT Count(horario.hor_id) FROM horario");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                horarios = (rs.getString(1));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloInicio.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Inicio");
        } finally {
            this.cerrar();
        }

        return horarios;
    }

    public String buscarNumUsuarios() {

        String usuarios = "";

        try {

            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT Count(usuario.usu_id) FROM usuario");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                usuarios = (rs.getString(1));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloInicio.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Inicio");
        } finally {
            this.cerrar();
        }

        return usuarios;
    }

    public String buscarNumTimbradas() {

        String timbradas = "";

        try {

            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT Count(terminal.ter_id) FROM terminal");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                timbradas = (rs.getString(1));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloInicio.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Inicio");
        } finally {
            this.cerrar();
        }

        return timbradas;
    }
}
