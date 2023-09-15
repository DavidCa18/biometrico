package Modelo;

import Clases.Parametros;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ModeloConexion {

    private Connection cn;
    private String host = "172.30.2.10";
    private String port = "3308";
    private String database = "cineto";
    private String user = "root";
    private String password = "12345";

    public Connection getCn() {
        return cn;
    }

    public void setCn(Connection cn) {
        this.cn = cn;
    }

    public void conectar() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/" + database, user, password);

        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(ModeloConexion.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public void cerrar() {

        try {
            if (cn != null) {

                if (cn.isClosed() == false) {
                    cn.close();
                }

            }
        } catch (SQLException e) {
            Logger.getLogger(ModeloConexion.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public String ejecutarFuncion(int numero, String nombreSp, ArrayList<Parametros> lista) throws Exception {

        String mensaje = null;
        try {
            this.conectar();
            CallableStatement stn = this.getCn().prepareCall("{? = call " + nombreSp + "(" + numeroParametros(numero) + ")}");
            stn.registerOutParameter(1, java.sql.Types.VARCHAR);
            for (int i = 0; i < lista.size(); i++) {
                stn.setObject(lista.get(i).nombre, lista.get(i).valor);
            }
            stn.execute();
            mensaje = stn.getString(1);

        } catch (SQLException ex) {
            Logger.getLogger(ModeloConexion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrar();
        }
        return mensaje;
    }

    public static String numeroParametros(int numero) {
        String valor;
        String concatenado = "";
        String total;
        for (int i = 0; i < numero; i++) {
            valor = "?,";
            concatenado = concatenado + valor;
        }
        total = concatenado.substring(0, concatenado.length() - 1);
        return total;
    }

}
