package Modelo;

import Clases.Cargo;
import Clases.Departamento;
import Clases.Empleado;
import Clases.EstadoCivil;
import Clases.Genero;
import Clases.Nacionalidad;
import Clases.Parametros;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModeloEmpleado extends ModeloConexion {

    public String guardarEmpleado(Empleado emp) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("empleado_id", emp.getIdEmpleado()));
            lista.add(new Parametros("empleado_tipo_doc", emp.getTipoDocumentoEmpleado()));
            lista.add(new Parametros("empleado_numero_doc", emp.getNumeroDocumentoEmpleado()));
            lista.add(new Parametros("empleado_nombre", emp.getNombreEmpleado()));
            lista.add(new Parametros("empleado_email", emp.getEmailEmpleado()));
            lista.add(new Parametros("empleado_nacimiento", emp.getNacimientoEmpleado()));
            lista.add(new Parametros("empleado_enrolamiento", emp.getEnrolamientoEmpleado()));
            lista.add(new Parametros("empleado_celular", emp.getCelularEmpleado()));
            lista.add(new Parametros("empleado_casa", emp.getConvencionalEmpleado()));
            lista.add(new Parametros("empleado_oficina", emp.getOficinaEmpleado()));
            lista.add(new Parametros("empleado_direccion", emp.getDireccionEmpleado()));
            lista.add(new Parametros("empleado_foto", emp.getFotoEmpleado()));
            lista.add(new Parametros("genero_id", emp.getIdGenero().getIdGenero()));
            lista.add(new Parametros("estado_civil_id", emp.getIdEstadoVicil().getIdEstadoCivil()));
            lista.add(new Parametros("departamento_id", emp.getIdDepartamento().getIdDepartamento()));
            lista.add(new Parametros("nacionalidad_id", emp.getIdNacionalidad().getIdNacionalidad()));
            lista.add(new Parametros("cargo_id", emp.getIdCargo().getIdCargo()));

            mensaje = ejecutarFuncion(18, "GestionEmpleado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empleado");
        }
        return mensaje;
    }

    public String modificarEmpleado(Empleado emp) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("empleado_id", emp.getIdEmpleado()));
            lista.add(new Parametros("empleado_tipo_doc", emp.getTipoDocumentoEmpleado()));
            lista.add(new Parametros("empleado_numero_doc", emp.getNumeroDocumentoEmpleado()));
            lista.add(new Parametros("empleado_nombre", emp.getNombreEmpleado()));
            lista.add(new Parametros("empleado_email", emp.getEmailEmpleado()));
            lista.add(new Parametros("empleado_nacimiento", emp.getNacimientoEmpleado()));
            lista.add(new Parametros("empleado_enrolamiento", emp.getEnrolamientoEmpleado()));
            lista.add(new Parametros("empleado_celular", emp.getCelularEmpleado()));
            lista.add(new Parametros("empleado_casa", emp.getConvencionalEmpleado()));
            lista.add(new Parametros("empleado_oficina", emp.getOficinaEmpleado()));
            lista.add(new Parametros("empleado_direccion", emp.getDireccionEmpleado()));
            lista.add(new Parametros("empleado_foto", emp.getFotoEmpleado()));
            lista.add(new Parametros("genero_id", emp.getIdGenero().getIdGenero()));
            lista.add(new Parametros("estado_civil_id", emp.getIdEstadoVicil().getIdEstadoCivil()));
            lista.add(new Parametros("departamento_id", emp.getIdDepartamento().getIdDepartamento()));
            lista.add(new Parametros("nacionalidad_id", emp.getIdNacionalidad().getIdNacionalidad()));
            lista.add(new Parametros("cargo_id", emp.getIdCargo().getIdCargo()));

            mensaje = ejecutarFuncion(18, "GestionEmpleado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empleado");
        }
        return mensaje;
    }

    public String eliminarEmpleado(Empleado emp) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("empleado_id", emp.getIdEmpleado()));
            lista.add(new Parametros("empleado_tipo_doc", null));
            lista.add(new Parametros("empleado_numero_doc", null));
            lista.add(new Parametros("empleado_nombre", null));
            lista.add(new Parametros("empleado_email", null));
            lista.add(new Parametros("empleado_nacimiento", null));
            lista.add(new Parametros("empleado_enrolamiento", null));
            lista.add(new Parametros("empleado_celular", null));
            lista.add(new Parametros("empleado_casa", null));
            lista.add(new Parametros("empleado_oficina", null));
            lista.add(new Parametros("empleado_direccion", null));
            lista.add(new Parametros("empleado_foto", null));
            lista.add(new Parametros("genero_id", null));
            lista.add(new Parametros("estado_civil_id", null));
            lista.add(new Parametros("departamento_id", null));
            lista.add(new Parametros("nacionalidad_id", null));
            lista.add(new Parametros("cargo_id", null));

            mensaje = ejecutarFuncion(18, "GestionEmpleado", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empleado");
        }
        return mensaje;
    }

    public ArrayList<Empleado> buscarEmpleado() {

        ArrayList<Empleado> listaEmpleado = new ArrayList<>();
        Empleado empleado;
        Genero genero;
        EstadoCivil estadoCivil;
        Departamento departamento;
        Nacionalidad nacionalidad;
        Cargo cargo;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM buscar_empleados");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empleado = new Empleado();
                genero = new Genero();
                estadoCivil = new EstadoCivil();
                departamento = new Departamento();
                nacionalidad = new Nacionalidad();
                cargo = new Cargo();

                empleado.setIdEmpleado(rs.getInt(1));
                empleado.setTipoDocumentoEmpleado(rs.getString(2));
                empleado.setNumeroDocumentoEmpleado(rs.getString(3));
                empleado.setNombreEmpleado(rs.getString(4));
                empleado.setEmailEmpleado(rs.getString(5));
                empleado.setNacimientoEmpleado(rs.getString(6));
                empleado.setEnrolamientoEmpleado(rs.getString(7));
                empleado.setCelularEmpleado(rs.getString(8));
                empleado.setConvencionalEmpleado(rs.getString(9));
                empleado.setOficinaEmpleado(rs.getString(10));
                empleado.setDireccionEmpleado(rs.getString(11));
                empleado.setFotoEmpleado(rs.getString(12));
                genero.setIdGenero(rs.getInt(13));
                genero.setDescripcionGenero(rs.getString(14));
                estadoCivil.setIdEstadoCivil(rs.getInt(15));
                estadoCivil.setDescripcionEstadoCivil(rs.getString(16));
                departamento.setIdDepartamento(rs.getInt(17));
                departamento.setNombreDepartamento(rs.getString(18));
                nacionalidad.setIdNacionalidad(rs.getInt(19));
                nacionalidad.setDescripcionNacionalidad(rs.getString(20));
                cargo.setIdCargo(rs.getInt(21));
                cargo.setNombreCargo(rs.getString(22));
                empleado.setIdGenero(genero);
                empleado.setIdEstadoVicil(estadoCivil);
                empleado.setIdDepartamento(departamento);
                empleado.setIdNacionalidad(nacionalidad);
                empleado.setIdCargo(cargo);

                listaEmpleado.add(empleado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empleado");
        } finally {
            this.cerrar();
        }

        return listaEmpleado;
    }

    public ArrayList<Empleado> buscarEmpleadoAsignacion() {

        ArrayList<Empleado> listaEmpleado = new ArrayList<>();
        Empleado empleado;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT\n"
                    + "	empleado.eml_id,\n"
                    + "	empleado.eml_nombre,\n"
                    + "	empleado.eml_num_documento,\n"
                    + "	empleado.eml_foto\n"
                    + "FROM\n"
                    + "empleado\n"
                    + "INNER JOIN horario_empleado ON horario_empleado.eml_id = empleado.eml_id\n"
                    + "WHERE\n"
                    + "	empleado.eml_estado = 'ACTIVO'\n"
                    + "GROUP BY \n"
                    + "empleado.eml_id");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empleado = new Empleado();

                empleado.setIdEmpleado(rs.getInt(1));
                empleado.setNombreEmpleado(rs.getString(2));
                empleado.setNumeroDocumentoEmpleado(rs.getString(3));
                empleado.setFotoEmpleado(rs.getString(4));

                listaEmpleado.add(empleado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empleado");
        } finally {
            this.cerrar();
        }

        return listaEmpleado;
    }

    public ArrayList<Empleado> buscarEmpleadoParametro(int idEmpleado) {

        ArrayList<Empleado> listaEmpleado = new ArrayList<>();
        Empleado empleado;
        Departamento departamento;
        Cargo cargo;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM buscar_empleados WHERE eml_id = " + idEmpleado + "");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                empleado = new Empleado();
                departamento = new Departamento();
                cargo = new Cargo();

                empleado.setIdEmpleado(rs.getInt(1));
                empleado.setNombreEmpleado(rs.getString(4));
                empleado.setNumeroDocumentoEmpleado(rs.getString(3));
                empleado.setFotoEmpleado(rs.getString(12));
                cargo.setNombreCargo(rs.getString(22));
                departamento.setNombreDepartamento(rs.getString(18));
                empleado.setIdCargo(cargo);
                empleado.setIdDepartamento(departamento);

                listaEmpleado.add(empleado);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Empleado");
        } finally {
            this.cerrar();
        }

        return listaEmpleado;
    }

}
