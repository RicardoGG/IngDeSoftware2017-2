
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
@Table(name = "persona")
public class Persona implements Serializable {
    @Id
    @Column(name = "Correo")
    private String correo;
    
    @Column(name = "nombres")
    private String nombre;
    
    @Column(name = "apPaterno")
    private String apPaterno;
    
    @Column(name = "apMaterno")
    private String apMaterno;
    
    @Column(name = "contrasena")
    private String contrasenia;
    
    /* Constructor de la clase Persona */
    public Persona(String nombre, String apPaterno, String apMaterno, String correo, String contrasenia){
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.correo = correo;
        this.contrasenia = contrasenia;
    }
    
    /* Getters and Setters */
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }
}
