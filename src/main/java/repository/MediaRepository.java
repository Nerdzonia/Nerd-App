package repository;

import javax.persistence.EntityManager;

import model.Media;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import util.FactoryManager;

public class MediaRepository {

    public void saveMedia(Media media) {
        EntityManager em = FactoryManager.getManager();
        try {
            em.getTransaction().begin();
            em.persist(media);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }

    public void deleteMedia(Media media) {
        EntityManager em = FactoryManager.getManager();
        try {
            em.getTransaction().begin();
            em.remove(media);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }

    public Media searchMediaByName(String name) {
        EntityManager em = FactoryManager.getManager();
        try {
            Session session = (Session) em.getDelegate();
            Criteria c = session.createCriteria(Media.class);
            c.add(Restrictions.ilike("name", name, MatchMode.ANYWHERE));
            return (Media) c.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            em.close();
        }
    }

    public void updateMedia(Media media) {
        EntityManager em = FactoryManager.getManager();
        try {
            em.getTransaction().begin();
            em.merge(media);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }

}
