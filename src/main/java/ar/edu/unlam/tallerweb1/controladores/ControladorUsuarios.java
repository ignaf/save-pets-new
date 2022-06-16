package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMensaje;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;
import ar.edu.unlam.tallerweb1.servicios.ServicioMensaje;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ControladorUsuarios {
    private ServicioUsuario servicioUsuario;
    private HttpServletRequest request;
    private ServicioMensaje servicioMensaje;

    @Autowired
    public ControladorUsuarios(ServicioUsuario servicioUsuario, HttpServletRequest request, ServicioMensaje servicioMensaje) {
        this.servicioUsuario = servicioUsuario;
        this.request = request;
        this.servicioMensaje = servicioMensaje;
    }

    @RequestMapping(path = "/enviar-mensaje", method = RequestMethod.GET)
    public ModelAndView enviarMensaje() {
        if(esAdmin()){
            ModelMap modelo = new ModelMap();
            modelo.put("usuarios", servicioUsuario.listarTodos());
            modelo.put("datosMensaje", new DatosMensaje());
            return new ModelAndView("enviarMensaje", modelo);
        }else{
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/enviar-mensaje", method = RequestMethod.POST)
    public ModelAndView enviarMensaje(@ModelAttribute("datosMensaje") DatosMensaje datosMensaje){
        if(esAdmin()){
           Mensaje mensaje = servicioMensaje.agregarMensaje(datosMensaje);
           servicioMensaje.asignarUsuarios(mensaje.getId(),datosMensaje.getIdDestinatario());
           return new ModelAndView("redirect:/home-admin");
        }else{
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path="/borrar-mensaje/{id}", method = RequestMethod.GET)
    public ModelAndView borrarMensaje(@PathVariable("id") Long idMensaje){
        if(estaLogueado()) {
            servicioMensaje.eliminar(idMensaje);
            return new ModelAndView("redirect:/home");
        }else{
            return new ModelAndView("redirect:/login");
        }
    }

    public boolean estaLogueado() {
        if (request.getSession().getAttribute("Rol") == "Admin" || request.getSession().getAttribute("Rol") == "UsuarioEstandar") {
            return true;
        } else {
            return false;
        }
    }

    public boolean esAdmin() {
        if (request.getSession().getAttribute("Rol") == "Admin") {
            return true;
        }
        return false;
    }


}
