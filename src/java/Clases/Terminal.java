/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author mario
 */
public class Terminal {
    
    private int idTerminal;
    private Empleado empleadoTerminal;
    private String fechaTerminal;
    private String tipoTerminal;
    private String horaTerminal;
    private String observacionTerminal;
    private String estadoTerminal;
    private TerminalNumero numeroTerminal;
   
    public int getIdTerminal() {
        return idTerminal;
    }

    public void setIdTerminal(int idTerminal) {
        this.idTerminal = idTerminal;
    }

    public TerminalNumero getNumeroTerminal() {
        return numeroTerminal;
    }

    public void setNumeroTerminal(TerminalNumero numeroTerminal) {
        this.numeroTerminal = numeroTerminal;
    }

    public Empleado getEmpleadoTerminal() {
        return empleadoTerminal;
    }

    public void setEmpleadoTerminal(Empleado empleadoTerminal) {
        this.empleadoTerminal = empleadoTerminal;
    }

    public String getFechaTerminal() {
        return fechaTerminal;
    }

    public void setFechaTerminal(String fechaTerminal) {
        this.fechaTerminal = fechaTerminal;
    }

    public String getTipoTerminal() {
        return tipoTerminal;
    }

    public void setTipoTerminal(String tipoTerminal) {
        this.tipoTerminal = tipoTerminal;
    }

    public String getHoraTerminal() {
        return horaTerminal;
    }

    public void setHoraTerminal(String horaTerminal) {
        this.horaTerminal = horaTerminal;
    }

    public String getObservacionTerminal() {
        return observacionTerminal;
    }

    public void setObservacionTerminal(String observacionTerminal) {
        this.observacionTerminal = observacionTerminal;
    }

    public String getEstadoTerminal() {
        return estadoTerminal;
    }

    public void setEstadoTerminal(String estadoTerminal) {
        this.estadoTerminal = estadoTerminal;
    }
    
    
    
    
}
