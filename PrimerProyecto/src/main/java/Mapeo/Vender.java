package Mapeo;

import java.io.Serializable;
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
@Table(name = "vender")
public class Vender implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(name = "idAlimento")
    private Alimentos alimentos;
    
    @Id
    @ManyToOne
    @JoinColumn(name = "idNombre")
    private Puesto puesto;

    
    public Alimentos getAlimentos() {
        return alimentos;
    }

    public void setAlimentos(Alimentos alimentos) {
        this.alimentos = alimentos;
    }

    public Puesto getPuesto() {
        return puesto;
    }

    public void setPuesto(Puesto puesto) {
        this.puesto = puesto;
    }
    
    
}
