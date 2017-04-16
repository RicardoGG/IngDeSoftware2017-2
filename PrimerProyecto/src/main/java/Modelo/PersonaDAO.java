package Modelo;

import Mapeo.Persona;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author diego
 */
public class PersonaDAO {
    // Atributo para iniciar nueva sesion
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Guarda una persona en la base de datos.
     * @param p La persona a agregar.
    */
    public void insert(Persona p){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.persist(p);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    /**
     * Actualiza a una persona en la base de datos.
     * @param p La persona a actualizar.
    */
    public void update(Persona p){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.update(p);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    /**
     * Elimina una persona de la base de datos.
     * @param p La persona a eliminar.
    */
    public void delete(Persona p){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.delete(p);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    
    public Persona getPersona(String correo, String con) {
        Persona per = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = " FROM Persona WHERE correo = :correoParam";
            Query query = session.createQuery(hql);
            query.setParameter("correoParam", correo);
            per = (Persona)query.uniqueResult();
            tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){ 
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
        return per;
    }
    
    
    public Persona usuario_registrado(String correo){
        Persona person = null;
        
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try{
            
            tx = session.beginTransaction();
            String hql = " from Persona where correo = :correo";
            Query query = session.createQuery(hql);
            query.setParameter("correo_persona", correo);
            person = (Persona)query.uniqueResult();
            tx.commit();
            
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return person;
    }
}
