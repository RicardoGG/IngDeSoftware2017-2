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
@Table(name = "alimentos")
public class Alimentos implements Serializable {
    @Id
    @Column(name = "idAlimento")
    private int idAlimento;
    
    @Column(name = "nombreAlim")
    private String nombreAlim;

    public int getIdAlimento() {
        return idAlimento;
    }

    public void setIdAlimento(int idAlimento) {
        this.idAlimento = idAlimento;
    }

    public String getNombreAlim() {
        return nombreAlim;
    }

    public void setNombreAlim(String nombreAlim) {
        this.nombreAlim = nombreAlim;
    }
}
