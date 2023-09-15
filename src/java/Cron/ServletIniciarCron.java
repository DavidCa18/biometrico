///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package Cron;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Date;
//import java.util.Locale;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.quartz.CronScheduleBuilder;
//import org.quartz.CronTrigger;
//import org.quartz.Scheduler;
//import org.quartz.Trigger;
//import org.quartz.TriggerBuilder;
//import org.quartz.TriggerKey;
//import org.quartz.impl.StdSchedulerFactory;
//
///**
// *
// * @author LENOVO LEGION
// */
//public class ServletIniciarCron extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//
//        response.setContentType("text/html");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            ServletContext ctx = request.getServletContext();
//            StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QuartzListener.QUARTZ_FACTORY_KEY);
//            Scheduler scheduler = factory.getScheduler();
//            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(new TriggerKey("simple"));
//            out.println("<form action=edit method=post>");
//            out.printf("Expresi\u00f3n Cron: <input type=text name=exp value=\"%s\" required>",
//                    trigger.getCronExpression());
//            out.println("<button>Enviar</button>");
//            out.println("</form>");
//        } catch (Exception e) {
//            out.print("<pre>");
//            e.printStackTrace(out);
//            out.print("</pre>");
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//
//        response.setContentType("text/html");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            String cronExpression = request.getParameter("exp");
//            ServletContext ctx = request.getServletContext();
//            StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QuartzListener.QUARTZ_FACTORY_KEY);
//            Scheduler scheduler = factory.getScheduler();
//            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("simple").withSchedule(
//                    CronScheduleBuilder.cronSchedule(cronExpression)).startNow().build();
//            Date date = scheduler.rescheduleJob(new TriggerKey("simple"), trigger);
//            out.printf(new Locale("es", "MX"), "<li><label>Trabajo re-calendarizado</label></li> <li><label>Próxima ejecución:</label></li> <li><label>%tc</label></li>", date);
//        } catch (Exception e) {
//            out.print("<pre>");
//            e.printStackTrace(out);
//            out.print("</pre>");
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
