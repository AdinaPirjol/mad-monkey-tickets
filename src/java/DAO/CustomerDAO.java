/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entities.Customer;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author adina.pirjol
 */

public class CustomerDAO {
    public void addCustomer(Customer client) {
        String password = client.getPassword();
        client.setPassword(this.getHash(password));
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("MonkeyPU");
        EntityManager em = emf.createEntityManager();
        
        em.getTransaction().begin();
        try {
            em.persist(client);
            em.getTransaction().commit();
        } catch(Exception e) {
           e.printStackTrace();
           em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    public Customer getCustomer(String name, String password) {
        password = this.getHash(password);
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("MonkeyPU");
        EntityManager em = emf.createEntityManager();
        
        Query query = em
            .createQuery("SELECT c from Customer c where c.name=:name and c.password=:password")
            .setParameter("name", name)
            .setParameter("password", password);
        try {
            Customer c = (Customer) query.getSingleResult();
            return c;
        } catch(NoResultException e) {
            e.printStackTrace();
            return null;
        } 
    }
    
    public String getHash(String password) {
        MessageDigest digest = null;
        try {
            digest = MessageDigest.getInstance("SHA-1");
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        digest.reset();
        try {
            digest.update(password.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }
        return new BigInteger(1, digest.digest()).toString(16);
    }
}
