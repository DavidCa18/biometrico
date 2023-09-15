/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Parametros;
import Clases.Usuario;
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
public class ModeloUsuario extends ModeloConexion {

    public String verificarUsuarios(Usuario usu) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 4));
            lista.add(new Parametros("usuario_id", null));
            lista.add(new Parametros("usuario_nombre", usu.getNombreUsuario().trim()));
            lista.add(new Parametros("usuario_pass", usu.getPasswordsuario().trim()));
            lista.add(new Parametros("usuario_rol", null));

            mensaje = ejecutarFuncion(5, "GestionUsuario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Usuarios");
        }
        return mensaje;
    }

    public String guardarUsuario(Usuario usu) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 1));
            lista.add(new Parametros("usuario_id", usu.getIdUsuario().trim()));
            lista.add(new Parametros("usuario_nombre", usu.getNombreUsuario().trim()));
            lista.add(new Parametros("usuario_pass", usu.getPasswordsuario().trim()));
            lista.add(new Parametros("usuario_rol", usu.getRolUsuario().trim()));

            mensaje = ejecutarFuncion(5, "GestionUsuario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Usuarios");
        }
        return mensaje;
    }

    public String ModificarUsuario(Usuario usu) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 2));
            lista.add(new Parametros("usuario_id", usu.getIdUsuario().trim()));
            lista.add(new Parametros("usuario_nombre", usu.getNombreUsuario().trim()));
            lista.add(new Parametros("usuario_pass", usu.getPasswordsuario().trim()));
            lista.add(new Parametros("usuario_rol", usu.getRolUsuario().trim()));

            mensaje = ejecutarFuncion(5, "GestionUsuario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Usuarios");
        }
        return mensaje;
    }

    public String EliminarUsuario(Usuario usu) {

        String mensaje = null;

        ArrayList<Parametros> lista = new ArrayList<>();
        try {
            lista.add(new Parametros("seleccion", 3));
            lista.add(new Parametros("usuario_id", usu.getIdUsuario().trim()));
            lista.add(new Parametros("usuario_nombre", null));
            lista.add(new Parametros("usuario_pass", null));
            lista.add(new Parametros("usuario_rol", null));

            mensaje = ejecutarFuncion(5, "GestionUsuario", lista);

        } catch (Exception e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Usuarios");
        }
        return mensaje;
    }

    public ArrayList<Usuario> buscarUsuarios() {

        ArrayList<Usuario> listaUsuario = new ArrayList<>();
        Usuario usuario;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM usuario WHERE usuario.usu_estado = 'ACTIVADO'");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                usuario = new Usuario();

                usuario.setIdUsuario(rs.getString(1));
                usuario.setNombreUsuario(rs.getString(2));
                usuario.setPasswordsuario(rs.getString(3));
                usuario.setRolUsuario(rs.getString(4));
                usuario.setEstadoUsuario(rs.getString(5));

                listaUsuario.add(usuario);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
            ModeloError md = new ModeloError();
            md.escribirLog(String.valueOf(e), "Módulo Usuarios");
        } finally {
            this.cerrar();
        }

        return listaUsuario;
    }

    public Clases.Usuario buscarUsuarioPerfil(String user) {

        Clases.Usuario usuario = null;

        try {
            this.conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT\n"
                    + "*\n"
                    + "FROM\n"
                    + "usuario\n"
                    + "WHERE\n"
                    + "usuario.usu_usuario = '" + user + "'");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                usuario = new Clases.Usuario();

                usuario.setIdUsuario(rs.getString(1));
                usuario.setNombreUsuario(rs.getString(2));
                usuario.setPasswordsuario(rs.getString(3));
                usuario.setRolUsuario(rs.getString(4));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloUsuario.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.cerrar();
        }

        return usuario;
    }
}
