/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Clases.Gestion;
import Controlador.ControladorGestion;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mario
 */
public class ServletValidarExpiracion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        String JSONGestion = "";
        PrintWriter out = response.getWriter();

        String gestion = gestionExpiracion();

        JSONGestion
                += "[{"
                + "\"msm\":\"" + gestion + "\""
                + "}]";

        out.println(JSONGestion);
    }

    public String buscarLicenciaDB() {

        String msm;

        ControladorGestion controladorGestion = new ControladorGestion();
        msm = controladorGestion.buscarGestion();

        return msm;
    }

    public String expirarLicenciaAPI(String codigo) {
        String msm = null;

        try {

            URL url = new URL("https://loctel.herokuapp.com/ExpiracionCodigo/" + codigo + "");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            if (conn.getResponseCode() != 200) {
                msm = ("Failed : HTTP error code : " + conn.getResponseCode());
            }

            BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

            String output;

            while ((output = br.readLine()) != null) {

                msm = (output);
            }
            conn.disconnect();
        } catch (MalformedURLException e) {
            msm = String.valueOf(e);
        } catch (IOException e) {
            msm = String.valueOf(e);
        }
        return msm;
    }

    public String eliminarLicenciaDB(String codigo) {

        String msm;

        ControladorGestion controladorGestion = new ControladorGestion();
        Gestion gestion = new Gestion();
        gestion.setCodigoGestion(codigo);

        msm = controladorGestion.removerGestion(gestion);

        return msm;
    }

    public String gestionExpiracion() {

        String msm = null;

        String LicenciaLocal = buscarLicenciaDB();
        String ComprobacionExpiracion = expirarLicenciaAPI(LicenciaLocal);

        if (!leerJSON(ComprobacionExpiracion).equals("VIGENTE")) {
            msm = eliminarLicenciaDB(LicenciaLocal);
        } else {
            msm = "VIGENTE";
        }

        return msm;
    }

    public String leerJSON(String json) {
        String msm = null;

        JsonParser parser = new JsonParser();

        JsonArray gsonArr = parser.parse(json).getAsJsonArray();

        for (JsonElement obj : gsonArr) {

            JsonObject gsonObj = obj.getAsJsonObject();
            String jsonresult = gsonObj.get("msm").getAsString();
            msm = (jsonresult);
        }

        return msm;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
