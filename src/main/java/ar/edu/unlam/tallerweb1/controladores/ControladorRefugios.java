package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.controladores.dtos.*;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.excepciones.RefugioCoordenadasYaExisteException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.RefugioNombreYaExisteException;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class ControladorRefugios {

    private MapaService mapaService;
    private ServicioRefugio servicioRefugio;
    private HttpServletRequest request;

    @Autowired
    public ControladorRefugios(ServicioRefugio servicioRefugio, MapaService mapaService, HttpServletRequest request) {
        this.servicioRefugio = servicioRefugio;
        this.mapaService = mapaService;
        this.request = request;
    }

    @RequestMapping(path = "/registrar-refugio", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroRefugio() {
        if (esAdmin()) {
            ModelMap model = new ModelMap();
            model.put("datosRefugio", new DatosRefugio());
            return new ModelAndView("registrar-refugio", model);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/registrar-refugio", method = RequestMethod.POST)
    public ModelAndView registrarRefugio(@ModelAttribute("datosRefugio") DatosRefugio datosRefugio) throws InterruptedException, ApiException, IOException {
        if (esAdmin()) {
            ModelMap model = new ModelMap();
            try {
                servicioRefugio.agregarRefugio(datosRefugio);
            } catch (RefugioCoordenadasYaExisteException e) {
                return registroFallido(model, "Ya existe un refugio en esa ubicación");
            } catch (RefugioNombreYaExisteException e) {
                return registroFallido(model, "Ya existe un refugio con ese nombre");
            }
            return mostrarRefugios();
        } else {
            return new ModelAndView("redirect:/login");
        }
    }


    @RequestMapping(path = "/mapa-refugios", method = RequestMethod.GET)
    public ModelAndView mostrarMapaRefugios() throws InterruptedException, ApiException, IOException {
        if (estaLogueado()) {
            ModelMap model = new ModelMap();
            model.put("refugios", servicioRefugio.listarTodos());
            return new ModelAndView("vistaMapaRefugios", model);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(path = "/mostrar-refugios", method = RequestMethod.GET)
    public ModelAndView mostrarRefugios() {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("listaDeRefugios", servicioRefugio.listarTodos());
            return new ModelAndView("Refugios", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(path = "/mostrar-animales", method = RequestMethod.GET)
    public ModelAndView mostrarAnimales() {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("listaDeAnimales", servicioRefugio.listarTodos());
            return new ModelAndView("Refugios", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }

    private ModelAndView registroFallido(ModelMap model, String mensaje) {
        model.put("error", mensaje);
        return new ModelAndView("registrar-refugio", model);
    }

    @RequestMapping(path = "/buscarRefugio", method = RequestMethod.GET)
    public ModelAndView buscarRefugio() {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("datosRefugio", new DatosRefugio());
            return new ModelAndView("buscarRefugio", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(path = "/buscarRefugio", method = RequestMethod.POST)
    public ModelAndView buscarRefugio(@ModelAttribute("datosRefugio") DatosRefugio datosRefugio) {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("refugio", servicioRefugio.buscarRefugioPorNombre(datosRefugio.getNombre()));
            return new ModelAndView("buscarRefugio", modelo);
        } else {
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
