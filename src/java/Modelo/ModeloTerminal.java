/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Calendario;
import Clases.Cargo;
import Clases.Departamento;
import Clases.Empleado;
import Clases.Terminal;
import Clases.TerminalNumero;
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
public class ModeloTerminal extends ModeloConexion {

    public ArrayList<Terminal> buscarHistorialDetalleEmpleados(String fechaInicio, String fechaFinal, String empleados) {

        ArrayList<Terminal> listaTerminal = new ArrayList<>();
        Terminal terminal;
        Empleado empleado;
        TerminalNumero terminalNumero;
        Cargo cargo;
        Departamento departamento;
        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("CALL buscar_historial_detalle_empleados('" + fechaInicio + "','" + fechaFinal + "','" + empleados + "')");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                terminal = new Terminal();
                empleado = new Empleado();
                terminalNumero = new TerminalNumero();
                cargo = new Cargo();
                departamento = new Departamento();

                terminal.setIdTerminal(rs.getInt(1));
                empleado.setNombreEmpleado(rs.getString(2));
                empleado.setNumeroDocumentoEmpleado(rs.getString(3));
                empleado.setFotoEmpleado(rs.getString(12));
                cargo.setNombreCargo(rs.getString(4));
                departamento.setNombreDepartamento(rs.getString(5));
                empleado.setIdCargo(cargo);
                empleado.setIdDepartamento(departamento);
                terminal.setEmpleadoTerminal(empleado);
                terminal.setFechaTerminal(rs.getString(6));
                terminal.setTipoTerminal(rs.getString(7));
                terminal.setHoraTerminal(rs.getString(8));
                terminal.setObservacionTerminal(rs.getString(9));
                terminal.setEstadoTerminal(rs.getString(10));
                terminalNumero.setNombreTerminalNumero(rs.getString(11));
                terminal.setNumeroTerminal(terminalNumero);

                listaTerminal.add(terminal);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Historial detalle empleados - Terminal");
        } finally {
            this.cerrar();
        }

        return listaTerminal;
    }

    public ArrayList<Terminal> buscarHistorialResumenEmpleados(String fechaInicio, String fechaFinal, String empleados) {

        ArrayList<Terminal> listaTerminal = new ArrayList<>();
        Terminal terminal;
        Empleado empleado;
        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("CALL buscar_historial_resumen_empleados('" + fechaInicio + "','" + fechaFinal + "','" + empleados + "')");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                terminal = new Terminal();
                empleado = new Empleado();

                empleado.setIdEmpleado(rs.getInt(1));
                empleado.setNombreEmpleado(rs.getString(2));
                terminal.setEmpleadoTerminal(empleado);
                terminal.setIdTerminal(rs.getInt(3));

                listaTerminal.add(terminal);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Historial resumen empleados - Terminal");
        } finally {
            this.cerrar();
        }

        return listaTerminal;
    }

    public ArrayList<Terminal> buscarHistorialResumenEstadoEmpleados(String fechaInicio, String fechaFinal, String empleados) {

        ArrayList<Terminal> listaTerminal = new ArrayList<>();
        Terminal terminal;
        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("CALL buscar_historial_resumen_empleados_estado('" + fechaInicio + "','" + fechaFinal + "','" + empleados + "')");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                terminal = new Terminal();

                terminal.setIdTerminal(rs.getInt(1));
                terminal.setEstadoTerminal(rs.getString(2));

                listaTerminal.add(terminal);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Historial resumen empleados estado - Terminal");
        } finally {
            this.cerrar();
        }

        return listaTerminal;
    }

    public ArrayList<Calendario> buscarCalendarioEmpleado(int empleado, int mes, int anio) {

        ArrayList<Calendario> listaCalendario = new ArrayList<>();
        Calendario calendario;
        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("CALL buscar_historial_calendario_empleado('" + empleado + "','" + mes + "','" + anio + "')");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                calendario = new Calendario();

                calendario.setFechaCalendario(rs.getString(1));
                calendario.setHoraCalendario(rs.getString(2));
                calendario.setTipoCalendario(rs.getString(3));
                calendario.setEstadoCalendario(rs.getString(4));
                calendario.setObservacionCalendario(rs.getString(5));

                listaCalendario.add(calendario);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Historial Calendario - Terminal");
        } finally {
            this.cerrar();
        }

        return listaCalendario;
    }

    public ArrayList<Terminal> buscarTipoEntradaResumenEmpleado(String fechaInicio, String fechaFinal, String empleados) {

        ArrayList<Terminal> listaTerminal = new ArrayList<>();
        Empleado empleado;
        Terminal terminal;
        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("CALL buscar_historial_resumen_empleados_tipo_entrada('" + fechaInicio + "','" + fechaFinal + "','" + empleados + "')");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empleado = new Empleado();
                terminal = new Terminal();

                empleado.setNumeroDocumentoEmpleado(rs.getString(1));
                empleado.setNombreEmpleado(rs.getString(2));
                terminal.setTipoTerminal(rs.getString(3));
                terminal.setIdTerminal(rs.getInt(4));
                terminal.setEstadoTerminal(rs.getString(5));
                terminal.setEmpleadoTerminal(empleado);

                listaTerminal.add(terminal);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloTerminal.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Resumen Tiempo Entrada - Terminal");
        } finally {
            this.cerrar();
        }

        return listaTerminal;
    }
}
