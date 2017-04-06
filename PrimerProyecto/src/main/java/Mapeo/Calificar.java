package Mapeo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author diego
 */
@Entity
@Table(name = "calificar")
public class Calificar implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(name = "Correo")
    private Persona persona;
    
    @Id
    @ManyToOne
    @JoinColumn(name = "idNombre")
    private Puesto puesto;
    
    @Column(name = "Comentario")
    private String comentario;

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