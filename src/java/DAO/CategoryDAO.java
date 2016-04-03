/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entities.Category;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author adina.pirjol
 */
public class CategoryDAO {
    
    public List<Category> getCategories() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("MonkeyPU");
        EntityManager em = emf.createEntityManager();
        
        Query query = em.createQuery("select c from Category c");

        return query.getResultList();
    }
}
