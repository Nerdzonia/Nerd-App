/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import javax.persistence.EntityManager;
import model.Tag;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import util.FactoryManager;

/**
 *
 * @author Lucas
 */
public class TagRepository {
    
    public void saveTag(Tag tag) {
        EntityManager em = FactoryManager.getManager();
        try {
            em.getTransaction().begin();
            em.persist(tag);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }
    
    public void deleteTag(Tag tag) {
        EntityManager em = FactoryManager.getManager();
        try {
            em.getTransaction().begin();
            em.remove(tag);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }
    
    public void updateTag(Tag tag) {
        EntityManager em = FactoryManager.getManager();
        try {
            em.getTransaction().begin();
            em.merge(tag);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }
    
    public Tag searchTagByName(String tag) {
        EntityManager em = FactoryManager.getManager();
        try {
            Session session = (Session) em.getDelegate();
            Criteria c = session.createCriteria(Tag.class);
            c.add(Restrictions.ilike("tag", tag, MatchMode.ANYWHERE));
            return (Tag) c.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            em.close();
        }
    }
}