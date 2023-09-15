package Modelo;

import Clases.Cargo;
import Clases.Parametros;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModeloCargo extends ModeloConexion {

    public String guardarCargo(Cargo car) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("cargo_id", null));
            lista.add(new Parametros("cargo_nombre", car.getNombreCargo()));
            lista.add(new Parametros("cargo_salario", car.getSalarioCargo()));

            mensaje = ejecutarFuncion(4, "GestionCargo", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Cargo");
        }
        return mensaje;
    }

    public String modificarCargo(Cargo car) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("cargo_id", car.getIdCargo()));
            lista.add(new Parametros("cargo_nombre", car.getNombreCargo()));
            lista.add(new Parametros("cargo_salario", car.getSalarioCargo()));

            mensaje = ejecutarFuncion(4, "GestionCargo", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Cargo");
        }
        return mensaje;
    }

    public String eliminarCargo(Cargo car) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("cargo_id", car.getIdCargo()));
            lista.add(new Parametros("cargo_nombre", null));
            lista.add(new Parametros("cargo_salario", null));

            mensaje = ejecutarFuncion(4, "GestionCargo", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Cargo");
        }
        return mensaje;
    }

    public ArrayList<Cargo> buscarCargos() {

        ArrayList<Cargo> listaCargo = new ArrayList<>();
        Cargo cargo;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM cargo");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                cargo = new Cargo();

                cargo.setIdCargo(rs.getInt(1));
                cargo.setNombreCargo(rs.getString(2));
                cargo.setSalarioCargo(rs.getString(3));

                listaCargo.add(cargo);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Cargo");
        } finally {
            this.cerrar();
        }

        return listaCargo;
    }
}
