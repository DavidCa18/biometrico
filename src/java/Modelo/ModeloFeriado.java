/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Cargo;
import Clases.Feriado;
import Clases.Parametros;
import Modelo.ModeloConexion;
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
public class ModeloFeriado extends ModeloConexion {

    public String GuardarFeriado(Feriado fer) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("id_feriado", null));
            lista.add(new Parametros("fecha_feriado", fer.getFechaFeriado()));

            mensaje = ejecutarFuncion(3, "GestionFeriado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloFeriado.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Feriado");
        }
        return mensaje;
    }

    public String modificarFeriado(Feriado fer) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("id_feriado", fer.getIdFeriado()));
            lista.add(new Parametros("fecha_feriado", fer.getFechaFeriado()));

            mensaje = ejecutarFuncion(3, "GestionFeriado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloFeriado.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Feriado");
        }
        return mensaje;
    }

    public String eliminarFeriado(Feriado fer) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("id_feriado", fer.getIdFeriado()));
            lista.add(new Parametros("fecha_feriado", null));

            mensaje = ejecutarFuncion(3, "GestionFeriado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloFeriado.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Feriado");
        }
        return mensaje;
    }

    public ArrayList<Feriado> buscarFeriados() {

        ArrayList<Feriado> listaFeriado = new ArrayList<>();
        Feriado feriado;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT\n"
                    + "	feriado.fer_id,\n"
                    + "	feriado.fer_fecha,\n"
                    + "	DATE_FORMAT(feriado.fer_fecha, \"%Y\"),\n"
                    + "	CONCAT(TraduccionMesesDias(2,null,DATE_FORMAT(feriado.fer_fecha,\"%W\")), ' ',DATE_FORMAT(feriado.fer_fecha,\"%d\") , ' de ' ,TraduccionMesesDias(1,DATE_FORMAT(feriado.fer_fecha,\"%M\") ,null), ' del ',DATE_FORMAT(feriado.fer_fecha,\"%Y\") )\n"
                    + "	AS 'fer_fecha_completa'\n"
                    + "FROM\n"
                    + "	feriado");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                feriado = new Feriado();

                feriado.setIdFeriado(rs.getInt(1));
                feriado.setFechaFeriado(rs.getString(2));
                feriado.setAnioFeriado(rs.getString(3));
                feriado.setFechaCompletaFeriado(rs.getString(4));
                listaFeriado.add(feriado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloFeriado.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Feriado");
        } finally {
            this.cerrar();
        }

        return listaFeriado;
    }
}
