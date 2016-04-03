/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listeners;

import DAO.CategoryDAO;
import DAO.EventDAO;
import Entities.Category;
import Entities.Event;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author adina.pirjol
 */
public class MonkeyContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        EventDAO ev = new EventDAO();
        CategoryDAO cat = new CategoryDAO();
        List<Category> categories = cat.getCategories();
        List<Event> events = ev.getTopEvents();
        context.setAttribute("upcomingEvents", events);
        context.setAttribute("categories", categories);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
