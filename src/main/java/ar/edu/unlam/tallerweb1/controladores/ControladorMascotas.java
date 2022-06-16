package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class ControladorMascotas {

    private MapaService mapaService;
    private ServicioMascota servicioMascota;
    private ServicioRefugio servicioRefugio;
    private HttpServletRequest request;


    @Autowired
    public ControladorMascotas(ServicioMascota servicioMascota, MapaService mapaService, ServicioRefugio servicioRefugio, HttpServletRequest request) {
        this.servicioMascota = servicioMascota;
        this.servicioRefugio = servicioRefugio;
        this.mapaService = mapaService;
        this.request = request;
    }

    @RequestMapping(path = "/registrar-mascota", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroMascota() {
        if(estaLogueado()){
            ModelMap model = new ModelMap();
            model.put("datosMascota", new DatosMascota());
            return new ModelAndView("registrar-mascota", model);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(path = "/registrar-mascota", method = RequestMethod.POST)
    public ModelAndView registrarMascota(@ModelAttribute("datosMascota") DatosMascota datosMascota) throws InterruptedException, ApiException, IOException {
        if(estaLogueado()){
        ModelMap model = new ModelMap();
        servicioMascota.agregarMascota(datosMascota);
        return mostrarMapaMascotas();}else{
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/mapa-mascotas", method = RequestMethod.GET)
    public ModelAndView mostrarMapaMascotas() throws InterruptedException, ApiException, IOException {
        if(estaLogueado()){
        ModelMap model = new ModelMap();
        model.put("mascotas", servicioMascota.listarTodos());
        return new ModelAndView("vistaMapaMascotas", model);}else{
            return new ModelAndView("redirect:/login");
        }

    }


    @RequestMapping(path = "/buscarMascota", method = RequestMethod.GET)
    public ModelAndView buscarMascota(){
        ModelMap modelo = new ModelMap();
        modelo.put("datosMascota", new DatosMascota());
        return new ModelAndView("buscarMascota", modelo);
    }

    @RequestMapping(path = "/buscarMascota", method = RequestMethod.POST)
    public ModelAndView mascotaBuscada(@ModelAttribute("datosMascota") DatosMascota datosMascota){
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeMascotas", servicioMascota.buscarGeneral(datosMascota.getNombre()));
        return new ModelAndView("buscarMascota", modelo);
    }

    @RequestMapping(path = "/mostrar-mascotas", method = RequestMethod.GET)
    public ModelAndView mostrarAnimales() {
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeMascotas", servicioMascota.listarTodos());

        if(estaLogueado()==true && esAdmin()==false){
            return new ModelAndView("Mascotas", modelo);}
        else if(esAdmin()==true){
            return new ModelAndView("MascotasAdm", modelo);
        }else{
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/mostrar-descripcion", method = RequestMethod.GET)
    public ModelAndView mascotaDescripcion() {
        if(estaLogueado()){
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeMascotas", servicioMascota.listarTodos());
        return new ModelAndView("mascota-descripcion", modelo);}else{
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/registrar-mascota-en-refugio", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroMascotaEnRefugio(){
        ModelMap model = new ModelMap();
        model.put("datosMascota", new DatosMascota());
        return new ModelAndView("registrar-mascota-en-refugio", model);
    }

    @RequestMapping(path = "/registrar-mascota-en-refugio", method = RequestMethod.POST)
    public ModelAndView registrarMascotaEnRefugio(@ModelAttribute("datosMascota") DatosMascota datosMascota){
        ModelMap model = new ModelMap();
        servicioMascota.agregarMascotaARefugio(datosMascota);
        return mostrarFormularioRegistroMascotaEnRefugio();
    }
    
    @RequestMapping(path = "/borrar-mascota/{id}", method = RequestMethod.GET)
    public ModelAndView borrarMascota(@PathVariable("id") Long idMascota){
        servicioMascota.eliminar(idMascota);
        return new ModelAndView("redirect:/adminMascota");
    }

    @RequestMapping(path = "/asignar-mascota/{id}", method = RequestMethod.GET)
    public ModelAndView asignarMascota(@PathVariable("id") Long idMascota){
    	ModelMap modelo = new ModelMap();
    	modelo.put("listaDeRefugios", servicioRefugio.listarTodos());
    	modelo.put("idAModificar", idMascota);
        return new ModelAndView("asignarRefugioAMascota", modelo);
    }
    
    @RequestMapping(path = "/asignar-mascota/asignarMascotaARefugio/{idRefugio}/{idMascota}", method = RequestMethod.GET)
    public ModelAndView asignarMascotaARefugio(@PathVariable("idRefugio") Long idRefugio,@PathVariable("idMascota") Long idMascota){
    	ModelMap modelo = new ModelMap();
    	Refugio refugio=servicioRefugio.buscarRefugioPorId(idRefugio);
    	servicioMascota.asignarRefugioAMascota(idMascota, refugio);
        return new ModelAndView("redirect:/adminMascota");
    }

	@RequestMapping(path = "/adminMascota", method = RequestMethod.GET)
    public ModelAndView mostrarAdminMascota(){
	    ModelMap modelo = new ModelMap();
	    modelo.put("listaDeMascotas", servicioMascota.listarTodos());
	    return new ModelAndView("adminMascota", modelo);
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
