/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Horario;
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
public class ModeloHorario extends ModeloConexion {

    public String guardarHorario(Horario hor) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("horario_id", null));
            lista.add(new Parametros("horario_turno", hor.getTurnoHorario().trim()));
            lista.add(new Parametros("horario_entrada", hor.getEntradaHorario().trim()));
            lista.add(new Parametros("horario_salida", hor.getSalidaHorario().trim()));
            lista.add(new Parametros("horario_espera", hor.getEsperaHorario().trim()));

            mensaje = ejecutarFuncion(6, "GestionHorario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario");
        }
        return mensaje;
    }

    public String modificarHorario(Horario hor) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("horario_id", hor.getIdHorario()));
            lista.add(new Parametros("horario_turno", hor.getTurnoHorario().trim()));
            lista.add(new Parametros("horario_entrada", hor.getEntradaHorario().trim()));
            lista.add(new Parametros("horario_salida", hor.getSalidaHorario().trim()));
            lista.add(new Parametros("horario_espera", hor.getEsperaHorario().trim()));

            mensaje = ejecutarFuncion(6, "GestionHorario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario");
        }
        return mensaje;
    }

    public String eliminarHorario(Horario hor) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("horario_id", hor.getIdHorario()));
            lista.add(new Parametros("horario_turno", null));
            lista.add(new Parametros("horario_entrada", null));
            lista.add(new Parametros("horario_salida", null));
            lista.add(new Parametros("horario_espera", null));

            mensaje = ejecutarFuncion(6, "GestionHorario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario");
        }
        return mensaje;
    }

    public ArrayList<Horario> buscarHorarios() {

        ArrayList<Horario> listaHorario = new ArrayList<>();
        Horario horario;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM horario");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                horario = new Horario();

                horario.setIdHorario(rs.getInt(1));
                horario.setTurnoHorario(rs.getString(2));
                horario.setEntradaHorario(rs.getString(3));
                horario.setSalidaHorario(rs.getString(4));
                horario.setEsperaHorario(rs.getString(5));

                listaHorario.add(horario);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario");
        } finally {
            this.cerrar();
        }

        return listaHorario;
    }

    public ArrayList<Horario> buscarHorariosParametros(int idEmpleado) {

        ArrayList<Horario> listaHorario = new ArrayList<>();
        Horario horario;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM buscar_horarios_empleado WHERE eml_id = '" + idEmpleado + "'  AND eml_estado = 'ACTIVO'");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                horario = new Horario();

                horario.setIdHorario(rs.getInt(1));
                horario.setTurnoHorario(rs.getString(2));
                horario.setEntradaHorario(rs.getString(3));
                horario.setSalidaHorario(rs.getString(4));
                horario.setEsperaHorario(rs.getString(5));

                listaHorario.add(horario);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario");
        } finally {
            this.cerrar();
        }

        return listaHorario;
    }

    public ArrayList<Horario> buscarHorariosParametrosModal(int idHorario) {

        ArrayList<Horario> listaHorario = new ArrayList<>();
        Horario horario;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM horario WHERE hor_id = " + idHorario + "");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                horario = new Horario();

                horario.setIdHorario(rs.getInt(1));
                horario.setTurnoHorario(rs.getString(2));
                horario.setEntradaHorario(rs.getString(3));
                horario.setSalidaHorario(rs.getString(4));
                horario.setEsperaHorario(rs.getString(5));

                listaHorario.add(horario);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario");
        } finally {
            this.cerrar();
        }

        return listaHorario;
    }

}
