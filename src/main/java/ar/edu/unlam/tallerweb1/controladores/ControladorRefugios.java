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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;

import java.io.IOException;

@Controller
public class ControladorRefugios {

    private MapaService mapaService;
	private ServicioRefugio servicioRefugio;

	@Autowired
	public ControladorRefugios(ServicioRefugio servicioRefugio, MapaService mapaService){
		this.servicioRefugio=servicioRefugio;
		this.mapaService = mapaService;
	}

	@RequestMapping(path = "/registrar-refugio", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroRefugio(){
	    ModelMap model = new ModelMap();
	    model.put("datosRefugio", new DatosRefugio());
	    return new ModelAndView("registrar-refugio", model);
    }

    @RequestMapping(path = "/registrar-refugio", method = RequestMethod.POST)
    public ModelAndView registrarRefugio(@ModelAttribute("datosRefugio") DatosRefugio datosRefugio) throws InterruptedException, ApiException, IOException {
	    ModelMap model = new ModelMap();
	    try{
	    servicioRefugio.agregarRefugio(datosRefugio);}
	    catch(RefugioCoordenadasYaExisteException e){
	        return registroFallido(model, "Ya existe un refugio en esa ubicación");
        }
	    catch(RefugioNombreYaExisteException e ){
	        return registroFallido(model, "Ya existe un refugio con ese nombre");
        }
	    return mostrarRefugios();
    }


    @RequestMapping(path="/mapa-refugios", method = RequestMethod.GET)
    public ModelAndView mostrarMapaRefugios() throws InterruptedException, ApiException, IOException {
        ModelMap model = new ModelMap();
        model.put("refugios", servicioRefugio.listarTodos());
        return new ModelAndView("vistaMapaRefugios", model);
    }

    @RequestMapping(path = "/mostrar-refugios", method = RequestMethod.GET)
    public ModelAndView mostrarRefugios(){
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeRefugios", servicioRefugio.listarTodos());
        return new ModelAndView("Refugios",modelo);
    }
    
    @RequestMapping(path = "/mostrar-animales", method = RequestMethod.GET)
    public ModelAndView mostrarAnimales(){
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeAnimales", servicioRefugio.listarTodos());
        return new ModelAndView("Refugios",modelo);
    }

    private ModelAndView registroFallido(ModelMap model, String mensaje){
        model.put("error", mensaje);
        return new ModelAndView("registrar-refugio", model);
    }

    @RequestMapping(path = "/buscarRefugio", method = RequestMethod.GET)
    public ModelAndView buscarRefugio(){
        ModelMap modelo = new ModelMap();
        modelo.put("datosRefugio", new DatosRefugio());
        return new ModelAndView("buscarRefugio", modelo);
    }
    
    @RequestMapping(path = "/buscarRefugio", method = RequestMethod.POST)
    public ModelAndView refugioBuscado(@ModelAttribute("datosRefugio") DatosRefugio datosRefugio){
        ModelMap modelo = new ModelMap();
        modelo.put("refugio", servicioRefugio.buscarGeneral(datosRefugio.getNombre()));
        return new ModelAndView("buscarRefugio", modelo);
    }
    
    
    @RequestMapping(path = "/mostrar-animales-refugio/{id}", method = RequestMethod.GET)
    public ModelAndView mostrarAnimalesDeRefugio(@PathVariable("id") int idRefugio){
        ModelMap modelo = new ModelMap();
        modelo.put("refugio", "ola");
        return new ModelAndView("mostrar-animales-refugio", modelo);
    }
    
    @RequestMapping(path = "/borrar-refugio/{id}", method = RequestMethod.GET)
    public ModelAndView borrarRefugio(@PathVariable("id") Long idRefugio){
        servicioRefugio.eliminar(idRefugio);
        return new ModelAndView("redirect:/homeAdmin");
    }
    
    @RequestMapping(path = "/modificar-refugio/{id}", method = RequestMethod.GET)
    public ModelAndView modificarRefugioId(@PathVariable("id") Long idRefugio){
        ModelMap modelo = new ModelMap();
        DatosRefugio refugio = new DatosRefugio(idRefugio);
        modelo.put("datosRefugio", refugio);
        return new ModelAndView("modificar-refugio", modelo);
    }
    
    @RequestMapping(path = "/modificar-refugio", method = RequestMethod.GET)
    public ModelAndView modificarRefugio(@ModelAttribute("datosRefugio") DatosRefugio datosRefugio){
        servicioRefugio.modificar(datosRefugio);
        return new ModelAndView("redirect:/homeAdmin");
    }
	
}
