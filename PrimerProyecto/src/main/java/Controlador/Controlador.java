
package Controlador;

import Mapeo.Persona;
import Mapeo.Puesto;
import Mapeo.Usuario;
import Modelo.PersonaDAO;
import Modelo.PuestoDAO;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
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
    
    
    /**
     * Cambia de la vista al formulario de cracion de puestos. 
     */
    @RequestMapping(value="/crearPuesto", method = RequestMethod.GET)
    public ModelAndView creaPuest(ModelMap model, HttpServletRequest request){
        return new ModelAndView("crearPuesto",model);
    }
    
    
    /**
     * Cambia de la vista a la lista de puestos en la base de datos.
     */
    @RequestMapping(value="/leerPuesto", method = RequestMethod.GET)
    public ModelAndView leerPuesto(ModelMap model, HttpServletRequest request){
        String wrong = "";
        List<Puesto> puestos_registrados = puesto.list_puestos();
        
        if(puestos_registrados == null){
            wrong = "Error al cargar la información.";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        
        model.addAttribute("puestos", puestos_registrados);
        
        return new ModelAndView("LeerPuesto",model);
    }
    
    /**
     * Cambia de la vista al formulario de eliminacion de puestos.
     */
    @RequestMapping(value="/elimPuest", method = RequestMethod.POST)
    public ModelAndView elimPuest(ModelMap model, HttpServletRequest request){
        List<Puesto> puest = puesto.list_puestos();
        String wrong = "";
        if(puest == null){
            wrong = "Error al cargar la información.";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        model.addAttribute("puestos",puest);
        return new ModelAndView("eliminarPuesto",model);
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

            if(usuario.es_Admin(email).equals("1")){
                List<Puesto> puestos_registrados = puesto.list_puestos();
        
                if(puestos_registrados == null){
                    wrong = "Error al cargar la información.";
                    model.addAttribute("mensaje",wrong);
                    return new ModelAndView("error",model);
                }
        
                model.addAttribute("puestos", puestos_registrados);
                return new ModelAndView("AdministradorIH", model);
            }

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
    
    /**
     * Metodo para cerrar sesión
     * 
     * @param model-el modelo
     * @param request-la solicitud
     * @param response-la respuesta
     * @return ModelAndView-la página de inicio
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @RequestMapping(value="/cerrarSesion", method = RequestMethod.POST)
    public ModelAndView cerrarSesion(ModelMap model,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession sesion = request.getSession(true);
        //Invalidamos la sesion y desvinculamos los objetos asociados a ella
        sesion.invalidate();
        return new ModelAndView("inicio", model);
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
    
    
    
    /**
     * Metodo para crear nuevos puestos
     */
    @RequestMapping(value="/formularioPuesto", method = RequestMethod.POST)
    public ModelAndView creaPuesto(ModelMap model,HttpServletRequest request){
        String nombre = request.getParameter("nombre");
        String ubicacion = request.getParameter("ubicacion");
        
        Puesto puest = null;
        String wrong = "";
        
        if(nombre.equals("")){
            wrong = "El nombre del puesto no puede estar vacio favor de poner un nombre";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        } else if (ubicacion.equals("")){
            wrong = "La ubicacion no puede estar vacia, favor de poner un nombre";
            model.addAttribute("mensaje", wrong);
            return new ModelAndView("error", model);
        } else {
            puest = puesto.verificaPuesto(nombre);
            if(puest != null){
                wrong = "El puesto ya existe";
                model.addAttribute("mensaje", wrong);
                return new ModelAndView("error",model);
            }else{
                puest = new Puesto(nombre,ubicacion,0);
                puesto.insert(puest);
            }
        }
        
        return new ModelAndView("AdministradorIH",model);
    }
    
    /**
     * Metodo para eliminar un puesto de la base de datos (para el Administrador) 
     */
    @RequestMapping(value="/eliminarPuesto", method = RequestMethod.POST)
    public ModelAndView eliminarPuesto(ModelMap model,HttpServletRequest request){
        String nombre = request.getParameter("puesto");
        
        Puesto puest = puesto.verificaPuesto(nombre);
        String wrong = "";
        
        if(puest == null){
            wrong = "El puesto no esta en la base de datos, favor de verificar el nombre";
            model.addAttribute("mensaje", wrong);
            return new ModelAndView("error",model);
        }else{
            puesto.delete(nombre);
        }
        return new ModelAndView("AdministradorIH",model);
        
    }
    
    /**
     * Regresa a la vista del administrador.
     * @param model
     * @param request
     * @return la vista del administrador.
     */
    @RequestMapping(value="/cancelar", method = RequestMethod.POST)
    public ModelAndView cancelar(ModelMap model, HttpServletRequest request){
        return new ModelAndView("AdministradorIH", model);
    }
    
    /**
     * Regresa a la vista del administrador.
     * @param model
     * @param request
     * @return la vista del puesto a modificar.
     */
    @RequestMapping(value="/modificarPuesto", method = RequestMethod.GET)
    public ModelAndView modificarPuesto(ModelMap model, HttpServletRequest request){
        return new ModelAndView("actualizarPuestoIH", model);
    }
    
    /**
     * redirige a la calificacion de puesto
     */
    @RequestMapping(value="/calificacionPuesto", method = RequestMethod.POST)
    public ModelAndView calificarPuestoP(ModelMap model,HttpServletRequest request){
        return new ModelAndView("calificarPuesto",model);
    }
    
    /*
    Calificacion del puesto
    */
     @RequestMapping(value="/calificarPuesto", method = RequestMethod.POST)
    public ModelAndView calificarPuesto(ModelMap model,HttpServletRequest request){
        String nombre = request.getParameter("nombre");
        String ubicacion = request.getParameter("ubicacion");
        String calificacion = request.getParameter("calificacion");
        
        Puesto puest;
            String wrong = "";
        
        if(nombre.equals("")){
            wrong = "El nombre del puesto no puede estar vacio favor de poner un nombre";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        } else if (ubicacion.equals("")){
            wrong = "La ubicacion no puede estar vacia, favor de poner un número";
            model.addAttribute("mensaje", wrong);
            return new ModelAndView("error", model);
        } else{
            int c = Integer.parseInt(calificacion);
            puest = new Puesto(nombre,ubicacion,c);
            puesto.update(puest);
        }
                   
        return new ModelAndView("verInformacionPuestoRegistrados",model);
    }
    /**
     * Funcion que regresa la informacion de los puestos con un usuario registrado
     * @param model
     * @return 
     */
    @RequestMapping(value="/verInfoRegistrado", method = RequestMethod.POST)
    public ModelAndView verInformacionPuestoUsReg(ModelMap model,HttpServletRequest request){
        
        String wrong = "";
        List<Puesto> puestos_registrados = puesto.list_puestos();
        
        if(puestos_registrados == null){
            wrong = "Error al cargar la información.";
            model.addAttribute("mensaje",wrong);
            return new ModelAndView("error",model);
        }
        
        model.addAttribute("puestos", puestos_registrados);
        
        return new ModelAndView("verInformacionPuestoRegistrados",model);
    }
    
}
