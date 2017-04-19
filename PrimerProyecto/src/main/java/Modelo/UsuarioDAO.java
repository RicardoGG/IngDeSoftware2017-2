package Modelo;

import Mapeo.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author diego
 */
public class UsuarioDAO {
    // Atributo para iniciar nueva sesion
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Guarda un usuario en la base de datos.
     * @param u El usuario a agregar.
    */
    public void insert(Usuario u){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.persist(u);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    /**
     * Actualiza a un usuario en la base de datos.
     * @param u El usuario a actualizar.
    */
    public void update(Usuario u){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.update(u);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    /**
     * Elimina un usuario de la base de datos.
     * @param u El usuario a eliminar.
    */
    public void delete(Usuario u){
        Session session = sessionFactory.openSession();
        
        Transaction tx = null;
        
        try{
            tx = session.beginTransaction();
            
            session.delete(u);
            tx.commit();
        }
        catch(Exception e){
            if(tx != null){ tx.rollback(); }
            e.printStackTrace();
        }
        finally { session.close(); }
    }
    
    
    public Usuario getUser(String correo, String pas) {
        Usuario user = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = "FROM Usuario WHERE correo_us = :correoPam";
            Query query = session.createQuery(hql);
            query.setParameter("correoPam", correo);
            user = (Usuario)query.uniqueResult();
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
        return user;
    }
    
    /**
     * Revisamos si un usuario es administrador.
     * @param correo correo del usuario a revisar.
    */
    public String es_Admin(String correo){
        String admin = "";
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = "select administrador from Usuario where correo_us = :correoPam";
            Query query = session.createQuery(hql);
            query.setParameter("correoPam", correo);
            admin = (String)query.uniqueResult();
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
        return admin;
    }
    
}
