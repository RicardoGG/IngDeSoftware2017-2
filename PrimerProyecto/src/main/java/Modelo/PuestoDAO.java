package Modelo;

import Mapeo.Puesto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author diego
 */
public class PuestoDAO {
    // Atributo para iniciar nueva sesion
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Guarda un puesto en la base de datos.
     * @param p El puesto a agregar.
    */
    public void insert(Puesto p){
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
     * Actualiza a un puesto en la base de datos.
     * @param p El puesto a actualizar.
    */
    public void update(Puesto p){
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
     * Elimina un puesto de la base de datos.
     * @param p El puesto a eliminar.
    */
    public void delete(String puesto){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        Puesto p = verificaPuesto(puesto);
        
        try{
            tx = session.beginTransaction();
            session.delete(puesto, p);
            
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    /**
     * Obtenemos la lista de puestos.
     * @return La lista de puestos registrados.
     */
    public List<Puesto> list_puestos(){
        List<Puesto> puestos = null;
        
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try{
            
            tx = session.beginTransaction();
            String hql = "from Puesto";
            Query query = session.createQuery(hql);
            puestos = (List<Puesto>)query.list();
            tx.commit();
            
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return puestos;
    }
    
    
    /**
     * Metodo para verificar si un puesto ya esta
     */
    public Puesto verificaPuesto(String nombre){
        Puesto puesto = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        try{
            
            tx = session.beginTransaction();
            String hql = "from Puesto where idNombre = :nombrePuesto";
            Query query = session.createQuery(hql);
            query.setParameter("nombrePuesto", nombre);
            puesto = (Puesto)query.uniqueResult();
            tx.commit();
            
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return puesto;
    }
    
    
}
