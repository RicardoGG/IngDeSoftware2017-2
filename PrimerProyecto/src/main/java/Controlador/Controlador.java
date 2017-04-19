
package Controlador;

import Mapeo.Persona;
import Mapeo.Puesto;
import Mapeo.Usuario;
import Modelo.PersonaDAO;
import Modelo.PuestoDAO;
import Modelo.UsuarioDAO;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author diego
 */
@Controller
public class Controlador {
    
    @Autowired
    UsuarioDAO usuario;
    
    @Autowired
    PersonaDAO persona;
    
    @Autowired
    PuestoDAO puesto;
    
    // Expresion regular que verifica el correo.
    private final String PATTERN_EMAIL = "^[\\w-]+(\\.[\\w-]+)*@ciencias.unam.mx$";
    
    /*
     * Carga la pagina de inicio.
    */
    @RequestMapping(value="/")
    public String inicio(){
        return "inicio";
    }
    
    /*
     * Carga los puestos de la base.
    */
    @RequestMapping(value="/verInformacion", method = RequestMethod.GET)
    public ModelAndView verInformacionPuesto(ModelMap model,HttpServletRequest request){
        
        String wrong = "";
        List<Puesto> puestos_registrados = puesto.list_puestos();
        
        if(puestos_registrados == null){
            wrong = "Error al cargar la información.";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        
        model.addAttribute("puestos", puestos_registrados);
        
        return new ModelAndView("verInformacionPuesto",model);
    }
    
    /*
     * Cambia de la vista de inicio a el formulario.
    */
    @RequestMapping(value="/registrarse", method = RequestMethod.GET)
    public ModelAndView registrarse(ModelMap model,HttpServletRequest request){
        return new ModelAndView("registrarse",model);
    }
    
    
    
    /*
     * Iniciar Sesion
    */
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public ModelAndView login(ModelMap model, HttpServletRequest request){
        String email = request.getParameter("correo");
        String pas = request.getParameter("password");
        String wrong = "";
        Usuario u = usuario.getUser(email,pas);
        if(u == null){
            wrong = "usuario no valido";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        Persona p = persona.getPersona(u.getCorreo_us(),pas);
        if(p == null){
            wrong = "correo invalido, favor de verificarlo";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }else if(pas.equals(p.getContrasenia())){

            if(usuario.es_Admin(email).equals("1"))
                return new ModelAndView("registrarse", model);

            String nombre = p.getNombre();
            String apellidoPat = p.getApPaterno();
            String apellidoMat = p.getApMaterno();
            String correo = p.getCorreo();
           
            model.addAttribute("nombre",nombre);
            model.addAttribute("apellidoPat",apellidoPat);
            model.addAttribute("apellidoMat",apellidoMat);
            model.addAttribute("correo",correo);
        }else{
            wrong = "La contraseña es incorrecta, favor de verificarla";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        return new ModelAndView("perfil",model);
    }
    
    /*
     * Metodo encargado de validar correo.
    */
    private boolean valida_email(String correo){
        Pattern pattern = Pattern.compile(PATTERN_EMAIL);

        Matcher matcher = pattern.matcher(correo);
        return matcher.matches();
    }
    
    /*
     * Recibe los valores ingresados en el formulario.
     * Si son correctos se guardara al usuario nuevo.
    */
    @RequestMapping(value="/formulario", method = RequestMethod.POST)
    public ModelAndView registro(ModelMap model,HttpServletRequest request){
        Persona p = null;
        Usuario u = null;
        String wrong = "";
        
        String nombre = request.getParameter("nombre");
        String apPaterno = request.getParameter("paterno");
        String apMaterno = request.getParameter("materno");
        String correo = request.getParameter("email");
        String pass = request.getParameter("password");
        
        if(valida_email(correo) == false){
            wrong = "Correo no valido. Debes usar un correo ciencias.";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        else{
            p = persona.usuario_registrado(correo);
            if(p != null){
                wrong = "Usuario ya registrado.";
                model.addAttribute("mensaje",wrong);
                return new ModelAndView("error",model);
            }
            else{
                p = new Persona(nombre, apPaterno, apMaterno, correo, pass);
                u = new Usuario(correo, "0");
                persona.insert(p);
                usuario.insert(u);
            }
        }
        return new ModelAndView("inicio",model);
    }
    
    
    
}
