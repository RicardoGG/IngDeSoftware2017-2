package Mapeo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 *
 * @author diego
 */
@Entity
@Table(name = "calificar")
public class Calificar implements Serializable {
    @Id
    @ManyToOne
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
    @JoinColumn(name = "Correo_fk")
    private Persona persona;
    
    @Id
    @ManyToOne
    @JoinColumn(name = "idNombre_fk")
    private Puesto puesto;
    
    @Column(name = "Comentario")
    private String comentario;
    
    public Calificar(){
        
    }
    
    public Calificar(Persona persona, Puesto puesto, String comentario){
        this.persona = persona;
        this.puesto = puesto;
        this.comentario = comentario;
    }
    

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Puesto getPuesto() {
        return puesto;
    }

    public void setPuesto(Puesto puesto) {
        this.puesto = puesto;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
