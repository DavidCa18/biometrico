/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Empleado;
import Clases.Horario;
import Clases.HorarioEmpleado;
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
public class ModeloHorarioEmpleado extends ModeloConexion {

    public String guardarHorarioEmpleado(HorarioEmpleado hor_emp) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("horario_empleado_id", null));
            lista.add(new Parametros("empleado_id", hor_emp.getIdEmpleado().getIdEmpleado()));
            lista.add(new Parametros("horario_id", hor_emp.getIdHorario().getIdHorario()));

            mensaje = ejecutarFuncion(4, "GestionHorarioEmpleado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario-Empleado");
        }
        return mensaje;
    }

    public String modificarHorarioEmpleado(HorarioEmpleado hor_emp) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("horario_empleado_id", hor_emp.getIdHorarioEmpleado()));
            lista.add(new Parametros("empleado_id", hor_emp.getIdEmpleado().getIdEmpleado()));
            lista.add(new Parametros("horario_id", hor_emp.getIdHorario().getIdHorario()));

            mensaje = ejecutarFuncion(4, "GestionHorarioEmpleado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario-Empleado");
        }
        return mensaje;
    }

    public String eliminarHorarioEmpleado(HorarioEmpleado hor_emp) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("horario_empleado_id", hor_emp.getIdHorarioEmpleado()));
            lista.add(new Parametros("empleado_id", null));
            lista.add(new Parametros("horario_id", null));

            mensaje = ejecutarFuncion(4, "GestionHorarioEmpleado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario-Empleado");
        }
        return mensaje;
    }

    public ArrayList<HorarioEmpleado> buscarHorariosEmpleados() {

        ArrayList<HorarioEmpleado> listaHorarioEmpleado = new ArrayList<>();
        HorarioEmpleado horarioEmpleado;
        Horario horario;
        Empleado empleado;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM buscar_asignaciones");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                horarioEmpleado = new HorarioEmpleado();
                horario = new Horario();
                empleado = new Empleado();
                
                horarioEmpleado.setIdHorarioEmpleado(rs.getInt(1));
                
                empleado.setIdEmpleado(rs.getInt(2));
                empleado.setNombreEmpleado(rs.getString(3));
                empleado.setNumeroDocumentoEmpleado(rs.getString(4));
                
                horario.setIdHorario(rs.getInt(5));
                horario.setTurnoHorario(rs.getString(6));
                horario.setEntradaHorario(rs.getString(7));
                horario.setSalidaHorario(rs.getString(8));
                horario.setEsperaHorario(rs.getString(9));
                
                horarioEmpleado.setIdHorario(horario);
                horarioEmpleado.setIdEmpleado(empleado);

                listaHorarioEmpleado.add(horarioEmpleado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloHorario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Horario-Empleado");
        } finally {
            this.cerrar();
        }

        return listaHorarioEmpleado;
    }

}
