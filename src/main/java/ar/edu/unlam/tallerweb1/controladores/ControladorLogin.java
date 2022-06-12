package ar.edu.unlam.tallerweb1.controladores;


import ar.edu.unlam.tallerweb1.controladores.dtos.DatosLogin;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

import ar.edu.unlam.tallerweb1.servicios.ServicioLogin;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ControladorLogin {

    private ServicioUsuario servicioUsuario;
    private ServicioLogin servicioLogin;
    private ServicioRefugio servicioRefugio;
    private ServicioMascota servicioMascota;

    @Autowired
    public ControladorLogin(ServicioLogin servicioLogin, ServicioUsuario servicioUsuario, ServicioMascota servicioMascota, ServicioRefugio servicioRefugios) {
        this.servicioUsuario = servicioUsuario;
        this.servicioLogin = servicioLogin;
        this.servicioRefugio = servicioRefugios;
        this.servicioMascota = servicioMascota;
    }

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public ModelAndView inicio() {
        return new ModelAndView("redirect:/home");
    }

    @RequestMapping("/home")
    public ModelAndView irAHome() {
        ModelMap modelo = new ModelMap();
        modelo.put("listaDeRefugios", servicioRefugio.listarTodos());
        modelo.put("listaDeMascotas", servicioMascota.listarTodos());
        return new ModelAndView("home", modelo);
    }

    @RequestMapping("/home-admin")
    public ModelAndView irAHomeAdmin(HttpServletRequest request) {
        if (request.getSession().getAttribute("Rol") == "Admin") {
            ModelMap modelo = new ModelMap();
            modelo.put("listaDeRefugios", servicioRefugio.listarTodos());
            modelo.put("listaDeMascotas", servicioMascota.listarTodos());
            return new ModelAndView("home-admin", modelo);
        } else return new ModelAndView("redirect:/home");
    }

    @RequestMapping("/login")
    public ModelAndView irALogin() {

        ModelMap modelo = new ModelMap();
        modelo.put("datosLogin", new DatosLogin());
        return new ModelAndView("login", modelo);
    }

    @RequestMapping(path = "/validar-login", method = RequestMethod.POST)
    public ModelAndView validarLogin(@ModelAttribute("datosLogin") DatosLogin datosLogin, HttpServletRequest request) {
        ModelMap model = new ModelMap();

        Usuario usuarioBuscado = servicioLogin.consultarUsuario(datosLogin.getEmail(), datosLogin.getPassword());
        if (usuarioBuscado == null) {
            model.put("error", "Usuario o clave incorrecta");
        }
        if (usuarioBuscado != null) {
            if (usuarioBuscado.getEsAdmin() == true) {
                request.getSession().setAttribute("Rol", "Admin");
                return new ModelAndView("redirect:/home-admin");
            } else if (usuarioBuscado.getEsAdmin() == false) {
                request.getSession().setAttribute("Rol", "UsuarioEstandar");
                return new ModelAndView("redirect:/home");
            }
        }
        return new ModelAndView("login", model);
    }

}