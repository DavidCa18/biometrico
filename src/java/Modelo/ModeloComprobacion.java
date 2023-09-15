/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Empleado;
import Clases.Parametros;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModeloComprobacion extends ModeloConexion {

    public ArrayList<Empleado> buscarEmpleadoCodigo() {

        ArrayList<Empleado> listaEmpleado = new ArrayList<>();
        Empleado empleado;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT empleado.eml_id FROM empleado");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empleado = new Empleado();

                empleado.setIdEmpleado(rs.getInt(1));

                listaEmpleado.add(empleado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloComprobacion.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Comprobación");
        } finally {
            this.cerrar();
        }

        return listaEmpleado;
    }

    public String comprobarAsitencia(int idEmpleado, String fechaActual) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("id_empleado", idEmpleado));
            lista.add(new Parametros("fecha", fechaActual));

            mensaje = ejecutarFuncion(2, "AsignacionFaltas", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloComprobacion.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Comprobación");
        }
        return mensaje;
    }

//    public String Comparar(String fecha) {
//        String msm = "";
//
//        List<Empleado> lstEmpleadoCodigo = buscarEmpleadoCodigo();
//        for (int i = 0; i < lstEmpleadoCodigo.size(); i++) {
//            msm += comprobarAsitencia(lstEmpleadoCodigo.get(i).getIdEmpleado(), fecha) + " - ";
//        }
//
//        return msm;
//    }
//    
//    public static void main(String[] args) {
//        ModeloComprobacion mo = new ModeloComprobacion();
//        System.out.println(mo.Comparar("2017-10-25"));
//    }

}
