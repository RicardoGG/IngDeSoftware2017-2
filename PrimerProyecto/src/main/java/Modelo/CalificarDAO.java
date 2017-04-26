package Modelo;

import Mapeo.Calificar;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author diego
 */
public class CalificarDAO {
    // Atributo para iniciar nueva sesion
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Guarda un comentario en la base de datos.
     * @param c El comentario a agregar.
    */
    public void insert(Calificar c){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.persist(c);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    /**
     * Elimina un comentario de la base de datos.
     * @param c El comentario a eliminar.
    */
    public void delete(Calificar c){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.delete(c);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    
    public void update(Calificar c){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.update(c);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
   
    public Calificar buscar(String nombre){
        Calificar cal = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try{
            
            tx = session.beginTransaction();
            String hql = "from Puesto p where p.puesto.idNombre = :nombrePuesto";
            Query query = session.createQuery(hql);
            query.setParameter("nombrePuesto", nombre);
            cal = (Calificar)query.uniqueResult();
            tx.commit();
            
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return cal;
    }
    
   
}
