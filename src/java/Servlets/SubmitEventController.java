/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DAO.EventDAO;
import Entities.Category;
import Entities.Event;
import Entities.Location;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adina.pirjol
 */
public class SubmitEventController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String eventName = request.getParameter("event-name").trim();
        String eventDesc = request.getParameter("event-description").trim();
        String eventShortDesc = request.getParameter("event-short-description").trim();
        String eventStartdate = request.getParameter("event-startdate").trim();
        String eventEnddate = request.getParameter("event-enddate").trim();
        
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Calendar cal  = Calendar.getInstance();
        try {
            cal.setTime(df.parse(eventStartdate));
        } catch (ParseException ex) {
            Logger.getLogger(SubmitEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Event e = new Event();
        e.setDescription(eventDesc);
        e.setName(eventName);
        e.setShortDescription(eventShortDesc);
        e.setStartDate(cal);
        
        try {
            cal.setTime(df.parse(eventEnddate));
        } catch (ParseException ex) {
            Logger.getLogger(SubmitEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        e.setEndDate(cal);
        
        String locationName = request.getParameter("location-name").trim();
        String locationAddress = request.getParameter("location-address").trim();
        String locationCity = request.getParameter("location-city").trim();
        
        Location l = new Location();
        l.setAddress(locationAddress);
        l.setName(locationName);
        l.setCity(locationCity);
        
        String category = request.getParameter("category-name");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("MonkeyPU");
        EntityManager em = emf.createEntityManager();
        Query q = em.createQuery("select c from Category c where c.name=:name")
                .setParameter("name", category);
        Category c = (Category) q.getSingleResult();
        
        e.setLocation(l);
        e.setCategory(c);
        
        EventDAO ev = new EventDAO();
        boolean ok = ev.persist(e);
        
        if(ok) request.setAttribute("newEvent", e.getId());
        
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
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
