
package Controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author diego
 */
@Controller
public class Controlador {
    
    @RequestMapping(value="/")
    public String inicio(){
        return "inicio";
    }
}
