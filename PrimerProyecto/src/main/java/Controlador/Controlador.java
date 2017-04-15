
package Controlador;

import Mapeo.Persona;
import Mapeo.Usuario;
import Modelo.PersonaDAO;
import Modelo.UsuarioDAO;
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
    
    @RequestMapping(value="/")
    public String inicio(){
        return "inicio";
    }
    
    
    @RequestMapping(value="/verInformacion", method = RequestMethod.GET)
    public ModelAndView verInformacionPuesto(ModelMap model,HttpServletRequest request){
        return new ModelAndView("verInformacionPuesto",model);
    }
    
    
    @RequestMapping(value="/registrarse", method = RequestMethod.GET)
    public ModelAndView registrarse(ModelMap model,HttpServletRequest request){
        return new ModelAndView("registrarse",model);
    }
    
    
    
    
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
    
    
    @RequestMapping(value="/formulario", method = RequestMethod.POST)
    public ModelAndView registro(ModelMap model,HttpServletRequest request){
        String nombre = request.getParameter("nombre");
        String apPaterno = request.getParameter("paterno");
        String apMaterno = request.getParameter("materno");
        String correo = request.getParameter("email");
        String pass = request.getParameter("password");
        //Falta terminar
        return new ModelAndView("inicio",model);
    }
    
    
    
}
