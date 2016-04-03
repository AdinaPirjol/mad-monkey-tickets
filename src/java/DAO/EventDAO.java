/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entities.Event;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author adina.pirjol
 */

public class EventDAO {
    public List<Event> getTopEvents() {
        Calendar c = new GregorianCalendar();
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);
    
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("MonkeyPU");
        EntityManager em = emf.createEntityManager();
        
        Query query = em
                .createQuery("select e from Event e where e.startDate>=:date")
                .setParameter("date", c);
                
        return query.getResultList();
    }
    
    public boolean persist(Event event) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("MonkeyPU");
        EntityManager em = emf.createEntityManager();
        
        em.getTransaction().begin();
        try {
            em.persist(event);
            em.getTransaction().commit();
        } catch(Exception e) {
           e.printStackTrace();
           em.getTransaction().rollback();
           return false;
        } finally {
            em.close();
        }
        
        return true;
    }
}
