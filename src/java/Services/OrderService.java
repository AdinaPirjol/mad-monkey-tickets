/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Entities.Customer;
import Entities.CustomerOrder;
import Entities.EventTicket;
import Entities.OrderTicket;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author adina.pirjol
 */
public class OrderService {
    public float computeTotalCost(CustomerOrder order) {
        List<OrderTicket> tickets = order.getTickets();
        float total = 0;
        
        for(OrderTicket t:tickets) {
            total += t.getQuantity()*t.getEventTicket().getPrice();
        }
        
        return total;
    }
    
    public boolean createCustomerOrder(Map<String, String[]> param) {
        EntityManager em = Persistence.createEntityManagerFactory("MonkeyPU").createEntityManager();
        
        CustomerOrder order = new CustomerOrder();
        
        Customer c = new Customer();
        c.setName("Adina");
        c.setEmail("adinapirjol@gmail.com");
        
        for (Map.Entry<String, String[]> p : param.entrySet())
        {
            if(p.getValue() != null) {
                int quantity = Integer.parseInt(p.getValue()[0]);
                OrderTicket t = new OrderTicket();
                
                EventTicket et = em.find(EventTicket.class, p.getKey());
                t.setEventTicket(et);
                t.setEvent(et.getEvent());
                t.setCustomerOrder(order);
                t.setCustomer(null);
                t.setQuantity(quantity);
                
                order.addTicket(t);
            }
        }
        
        if(!order.getTickets().isEmpty()) {
            OrderService or = new OrderService();
            float cost = or.computeTotalCost(order);
            order.setTotalCost(cost);
            order.setCustomer(c);
            order.setDate(GregorianCalendar.getInstance());
            
            em.getTransaction().begin();
            
            try{
                em.persist(order);
            } catch(Exception e) {
                e.printStackTrace();
                em.getTransaction().rollback();
                em.close();
                return false;
            } 
            
            em.close();
            return true;
        } else {
            return false;
        }
    }
}
