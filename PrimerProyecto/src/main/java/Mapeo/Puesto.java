package Mapeo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author diego
 */
@Entity
@Table(name = "puesto")
public class Puesto implements Serializable {
    @Id
    @Column(name = "idNombre")
    private String idNombre;
    
    @Column(name = "Ubicacion")
    private String ubicacion;
    
    @Column(name = "Calificacion")
    private int calificacion;
    
    public Puesto(){}
    
    public Puesto(String idnombre, String ubicacion, int calificacion){
        this.idNombre = idnombre;
        this.ubicacion = ubicacion;
        this.calificacion = calificacion;
    }
    
    public Puesto(String idnombre){
        this.idNombre = idnombre;
        this.ubicacion = "Desconocido";
        this.calificacion = 0;
    }

    public String getIdNombre() {
        return idNombre;
    }

    public void setIdNombre(String idNombre) {
        this.idNombre = idNombre;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }
    
    
}
