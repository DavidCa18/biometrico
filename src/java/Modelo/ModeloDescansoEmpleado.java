/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Descanso;
import Clases.DescansoEmpleado;
import Clases.Empleado;
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
public class ModeloDescansoEmpleado extends ModeloConexion {

    public String guardarDescansoEmpleado(String valores) {
        String msm = "";
        try {
            conectar();
            PreparedStatement st = getCn().prepareStatement("INSERT INTO `descanso_empleado` (`eml_id`, `des_id`) VALUES " + valores);

            st.execute();
            msm = "Descanso Empleado Registrado Exitosamente";
        } catch (SQLException e) {
            msm = "Error al Registrar Descanso Empleado";
            Logger.getLogger(ModeloDescansoEmpleado.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Descanso Empleado");
        } finally {
            cerrar();
        }
        return msm;
    }
    
    public ArrayList<DescansoEmpleado> buscarDescansoEmpleadoParametro(int idEmpleado) {

        ArrayList<DescansoEmpleado> listaDescansoEmpleado = new ArrayList<>();
        DescansoEmpleado descansoEmpleado;
        Descanso descanso;
        Empleado empleado;
        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM buscar_descanso WHERE eml_id = " + idEmpleado + " ");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                descansoEmpleado = new DescansoEmpleado();
                empleado = new Empleado();
                descanso = new Descanso();

                descansoEmpleado.setIdDescansoEmpleado(rs.getInt(1));
                empleado.setIdEmpleado(rs.getInt(2));
                descanso.setIdDescanso(rs.getInt(3));
                descansoEmpleado.setIdEmpleadoDE(empleado);
                descansoEmpleado.setIdDescansoDE(descanso);

                listaDescansoEmpleado.add(descansoEmpleado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloDescansoEmpleado.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Descanso Empleado");
        } finally {
            this.cerrar();
        }

        return listaDescansoEmpleado;
    }
}
