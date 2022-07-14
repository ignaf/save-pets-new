package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class ControladorMascotas {

    private MapaService mapaService;
    private ServicioMascota servicioMascota;
    private ServicioRefugio servicioRefugio;
    private ServicioUsuario servicioUsuario;
    private HttpServletRequest request;


    @Autowired
    public ControladorMascotas(ServicioMascota servicioMascota, MapaService mapaService, ServicioRefugio servicioRefugio, HttpServletRequest request, ServicioUsuario servicioUsuario) {
        this.servicioMascota = servicioMascota;
        this.servicioRefugio = servicioRefugio;
        this.mapaService = mapaService;
        this.request = request;
        this.servicioUsuario = servicioUsuario;
    }

    @RequestMapping(path = "/registrar-mascota", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroMascota() {
        if (estaLogueado()) {
            ModelMap model = new ModelMap();
            model.put("datosMascota", new DatosMascota());
            return new ModelAndView("registrar-mascota", model);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(path = "/registrar-mascota", method = RequestMethod.POST)
    public ModelAndView registrarMascota(@ModelAttribute("datosMascota") DatosMascota datosMascota) throws InterruptedException, ApiException, IOException {
        if (estaLogueado()) {
            ModelMap model = new ModelMap();
            servicioMascota.agregarMascota(datosMascota);
            return mostrarMapaMascotas();
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/mapa-mascotas", method = RequestMethod.GET)
    public ModelAndView mostrarMapaMascotas() throws InterruptedException, ApiException, IOException {
        if(estaLogueado()){
            ModelMap model = new ModelMap();
            Long idUsuario = (Long) request.getSession().getAttribute("idUsuario");
            Usuario usuario = servicioUsuario.buscarPorId(idUsuario);
            model.put("mascotas", servicioMascota.listarMascotasSinRefugio());
            model.put("direccionUsuario",usuario.getCoordenadas());
            return new ModelAndView("vistaMapaMascotas",model);
        }else{
            return new ModelAndView("redirect:/login");
        }

    }

    @RequestMapping(path="/mapa-mascotas-cercanas", method = RequestMethod.GET)
    public ModelAndView mostrarMapaCercanas() throws InterruptedException, ApiException, IOException{
        if (estaLogueado()) {
            ModelMap model = new ModelMap();
            Long idUsuario = (Long) request.getSession().getAttribute("idUsuario");
            Usuario usuario = servicioUsuario.buscarPorId(idUsuario);
            model.put("mascotas", mapaService.filtrarMascotasPorDistancia(usuario.getCoordenadas(),servicioMascota.listarMascotasSinRefugio()));
            model.put("direccionUsuario", usuario.getCoordenadas());
            return new ModelAndView("vistaMapaMascotas", model);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }


    @RequestMapping(path = "/buscarMascota", method = RequestMethod.GET)
    public ModelAndView buscarMascota() {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("datosMascota", new DatosMascota());
            return new ModelAndView("buscarMascota", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/buscarMascota", method = RequestMethod.POST)
    public ModelAndView mascotaBuscada(@ModelAttribute("datosMascota") DatosMascota datosMascota) {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("listaDeMascotas", servicioMascota.buscarGeneral(datosMascota));
            return new ModelAndView("buscarMascota", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/mostrar-mascotas", method = RequestMethod.GET)
    public ModelAndView mostrarAnimales() {
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeMascotas", servicioMascota.listarTodos());

        if (estaLogueado() == true && esAdmin() == false) {
            return new ModelAndView("Mascotas", modelo);
        } else if (esAdmin() == true) {
            return new ModelAndView("MascotasAdm", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }
    @RequestMapping(path = "/pet/{id}", method = RequestMethod.GET)
    public ModelAndView detalleMascota(@PathVariable("id") Long id) {
        if (estaLogueado()) {
            ModelMap modelo = new ModelMap();
            modelo.put("mascota", servicioMascota.buscarPorId(id));
            return new ModelAndView("mascotaDetalle", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }

    }
    @RequestMapping(path = "/asignar-refugio", method = RequestMethod.GET)
    public ModelAndView asignarRefugio(@RequestParam(value = "id") String mascota) {
        if (esAdmin()) {
            ModelMap modelo = new ModelMap();
            modelo.put("refugios", servicioRefugio.listarTodos());
            modelo.put("mascota", mascota);
            return new ModelAndView("asignarRefugio", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/asignar-refugio", method = RequestMethod.POST)
    public ModelAndView asignarRefugio(@ModelAttribute("datosMascota") DatosMascota datosMascota) {
        if (esAdmin()) {
            ModelMap modelo = new ModelMap();
            servicioMascota.asignarRefugio(datosMascota.getId(), datosMascota.getRefugioId());
            return new ModelAndView("home-admin", modelo);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/borrar-mascota/{id}", method = RequestMethod.GET)
    public ModelAndView borrarMascota(@PathVariable("id") Long idMascota) {
        if (esAdmin()) {
            servicioMascota.eliminar(idMascota);
            return new ModelAndView("redirect:/adminMascota");
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/adminMascota", method = RequestMethod.GET)
    public ModelAndView mostrarAdminMascota() {
        if(esAdmin()){
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeMascotas", servicioMascota.listarTodos());
        return new ModelAndView("adminMascota", modelo);}
        else{return new ModelAndView("redirect:/login");}
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
