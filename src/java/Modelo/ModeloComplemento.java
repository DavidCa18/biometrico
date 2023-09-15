/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Cargo;
import Clases.Departamento;
import Clases.EstadoCivil;
import Clases.Genero;
import Clases.Nacionalidad;
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
public class ModeloComplemento extends ModeloConexion {

    public ArrayList<EstadoCivil> buscarEstadoCivil() {

        ArrayList<EstadoCivil> listaEstadoCivil = new ArrayList<>();
        EstadoCivil estadoCivil;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM estado_civil");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                estadoCivil = new EstadoCivil();

                estadoCivil.setIdEstadoCivil(rs.getInt(1));
                estadoCivil.setDescripcionEstadoCivil(rs.getString(2));

                listaEstadoCivil.add(estadoCivil);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloComplemento.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Estado Civil - Complemento");
        } finally {
            this.cerrar();
        }

        return listaEstadoCivil;
    }

    public ArrayList<Genero> buscarGenero() {

        ArrayList<Genero> listaGenero = new ArrayList<>();
        Genero genero;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM genero");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                genero = new Genero();

                genero.setIdGenero(rs.getInt(1));
                genero.setDescripcionGenero(rs.getString(2));

                listaGenero.add(genero);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloComplemento.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Género - Complemento");
        } finally {
            this.cerrar();
        }

        return listaGenero;
    }

    public ArrayList<Nacionalidad> buscarNacionalidad() {

        ArrayList<Nacionalidad> listaNacionalidad = new ArrayList<>();
        Nacionalidad nacionalidad;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM nacionalidad ORDER BY nac_nombre ASC");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                nacionalidad = new Nacionalidad();

                nacionalidad.setIdNacionalidad(rs.getInt(1));
                nacionalidad.setDescripcionNacionalidad(rs.getString(2));

                listaNacionalidad.add(nacionalidad);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloComplemento.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Nacionalidad - Complemento");
        } finally {
            this.cerrar();
        }

        return listaNacionalidad;
    }

    public ArrayList<Cargo> buscarCargo() {

        ArrayList<Cargo> listaCargo = new ArrayList<>();
        Cargo cargo;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT cargo.car_id, cargo.car_nombre FROM cargo");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                cargo = new Cargo();

                cargo.setIdCargo(rs.getInt(1));
                cargo.setNombreCargo(rs.getString(2));

                listaCargo.add(cargo);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloComplemento.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Cargo - Complemento");
        } finally {
            this.cerrar();
        }

        return listaCargo;
    }

    public ArrayList<Departamento> buscarDepartamento() {

        ArrayList<Departamento> listaDepartamento = new ArrayList<>();
        Departamento departamento;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT departamento.dep_id, departamento.dep_nombre FROM departamento");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                departamento = new Departamento();

                departamento.setIdDepartamento(rs.getInt(1));
                departamento.setNombreDepartamento(rs.getString(2));

                listaDepartamento.add(departamento);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloComplemento.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Departamento - Complemento");
        } finally {
            this.cerrar();
        }

        return listaDepartamento;
    }

}
