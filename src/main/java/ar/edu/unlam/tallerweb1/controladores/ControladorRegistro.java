package ar.edu.unlam.tallerweb1.controladores;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;
import ar.edu.unlam.tallerweb1.servicios.*;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClaveLongitudIncorrectaException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClavesDistintasException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.UsuarioYaExisteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControladorRegistro {

    private ServicioUsuario servicioUsuario;

    @Autowired
    public ControladorRegistro(ServicioUsuario servicioUsuario){
        this.servicioUsuario = servicioUsuario;
    }

    @RequestMapping(path="/registrar-usuario", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioDeRegistro(){
        ModelMap model = new ModelMap();
        model.put("datosRegistro", new DatosRegistro());
        return new ModelAndView("registrar-usuario", model);
    }

    @RequestMapping(path="/registrar-usuario", method = RequestMethod.POST)
    public ModelAndView registrar(@ModelAttribute("datosRegistro") DatosRegistro datosRegistro){
        ModelMap model = new ModelMap();
        try{
            servicioUsuario.registrar(datosRegistro);
        }catch(ClavesDistintasException e){
            return registroFallido(model, "Las claves deben coincidir");
        }catch(ClaveLongitudIncorrectaException e){
            return registroFallido(model, "La clave debe tener al menos 8 caracteres");
        }catch (UsuarioYaExisteException e){
            return registroFallido(model, "El usuario ya se encuentra registrado");
        }
        return registroExitoso();
    }

    private ModelAndView registroExitoso(){
        return new ModelAndView("redirect:/login");
    }

    private ModelAndView registroFallido(ModelMap model, String mensaje){
        model.put("error", mensaje);
        return new ModelAndView("registrar-usuario", model);
    }

}
