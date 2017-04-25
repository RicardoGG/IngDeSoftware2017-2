package Mapeo;



import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 *
 * @author diego
 */
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
    @Id
    @Cascade({CascadeType.SAVE_UPDATE, CascadeType.DELETE})
    @Column(name="Correo_us")
    private String correo_us;
    
    @Column(name = "administrador")
    private String administrador;
    
    public Usuario(){
        
    }
    
    public Usuario(String correo, String administrador){
        this.correo_us = correo;
        this.administrador = administrador;
    }

    public String getCorreo_us() {
        return correo_us;
    }

    public void setCorreo_us(String correo_us) {
        this.correo_us = correo_us;
    }

    public String getAdministrador() {
        return administrador;
    }

    public void setAdministrador(String administrador) {
        this.administrador = administrador;
    }

    

}
