package Controlador;

import Clases.Auditoria;
import Modelo.ModeloAuditoria;

public class ControladorAuditoria {

    public String buscarAuditoria() {

        ModeloAuditoria mp = new ModeloAuditoria();
        String htmlCode = "";

        for (Auditoria auditoria : mp.buscarAuditoria()) {

            htmlCode += "<tr>\n"
                    + "                                                <td>" + auditoria.getTipoAuditoria() + "</td>\n"
                    + "                                                <td>" + auditoria.getFechaAuditoria()+ "</td>\n"
                    + "                                                <td>" + auditoria.getTablaAuditoria()+ "</td>\n"
                    + "                                                <td>" + auditoria.getCampoAuditoria()+ "</td>\n"
                    + "                                                <td>" + auditoria.getAnteriorAuditoria()+ "</td>\n"
                    + "                                                <td>" + auditoria.getNuevoAuditoria() + "</td>\n"
                    + "                                                <td>" + auditoria.getUsuarioAuditoria()+ "</td>\n"
                    + "                                            </tr>";

        }

        return htmlCode;
    }

}
