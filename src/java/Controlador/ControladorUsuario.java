/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Usuario;
import Modelo.ModeloUsuario;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class ControladorUsuario {

    public String verificarUsuario(Usuario usu) {
        ModeloUsuario modeloUsario = new ModeloUsuario();
        return modeloUsario.verificarUsuarios(usu);
    }

    public String guardarUsuario(Usuario usu) {
        ModeloUsuario modeloUsario = new ModeloUsuario();
        return modeloUsario.guardarUsuario(usu);
    }

    public String ModificarUsuario(Usuario usu) {
        ModeloUsuario modeloUsario = new ModeloUsuario();
        return modeloUsario.ModificarUsuario(usu);
    }

    public String EliminarUsuario(Usuario usu) {
        ModeloUsuario modeloUsario = new ModeloUsuario();
        return modeloUsario.EliminarUsuario(usu);
    }

    public ArrayList<Usuario> buscarUsuarios() {
        ModeloUsuario modeloUsuario = new ModeloUsuario();
        return modeloUsuario.buscarUsuarios();
    }

    public Usuario buscarUsuarioPerfil(String user) {
        ModeloUsuario modeloUsuario = new ModeloUsuario();
        return modeloUsuario.buscarUsuarioPerfil(user);
    }
}
