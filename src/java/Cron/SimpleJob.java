//package Cron;
//
//import Clases.Empleado;
//import Modelo.ModeloComprobacion;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//import org.quartz.Job;
//import org.quartz.JobExecutionContext;
//import org.quartz.JobExecutionException;
//
//public class SimpleJob implements Job {
//
//    public void execute(JobExecutionContext ctx) throws JobExecutionException {
//        System.out.printf(new Locale("es", "MX"), "%tc Ejecutando tarea...%n   " + Comparar(), new java.util.Date());
//    }
//
//    public String Comparar() {
//        String msm = "";
//        Date myDate = new Date();
//        String fecha = new SimpleDateFormat("yyyy-MM-dd").format(myDate);
//        ModeloComprobacion modeloComprobacion = new ModeloComprobacion();
//
//        List<Empleado> lstEmpleadoCodigo = modeloComprobacion.buscarEmpleadoCodigo();
//        for (int i = 0; i < lstEmpleadoCodigo.size(); i++) {
//            msm += modeloComprobacion.comprobarAsitencia(lstEmpleadoCodigo.get(i).getIdEmpleado(), fecha) + " - ";
//        }
//
//        return msm;
//    }
//
//}
