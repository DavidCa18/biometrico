package Controlador;

import Clases.ErrorLog;
import Modelo.ModeloError;

public class ControladorError {

    public String buscarErrores() {

        ModeloError mp = new ModeloError();
        String htmlCode = "";

        for (ErrorLog errorLog : mp.buscarErrores()) {

            htmlCode += "<tr>\n"
                    + "                                                <td>" + errorLog.getFechaError() + "</td>\n"
                    + "                                                <td>" + errorLog.getTipoError() + "</td>\n"
                    + "                                                <td>" + errorLog.getModuloError() + "</td>\n"
                    + "                                                <td>" + errorLog.getMensajeError() + "</td>\n"
                    + "                                            </tr>";

        }

        return htmlCode;
    }

}
