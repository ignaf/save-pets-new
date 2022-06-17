package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosProducto;
import ar.edu.unlam.tallerweb1.servicios.ServicioTienda;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ControladorTienda {

    private ServicioTienda servicioTienda;
    private HttpServletRequest request;

    @Autowired
    public ControladorTienda(ServicioTienda servicioTienda, HttpServletRequest request) {
        this.servicioTienda = servicioTienda;
        this.request = request;
    }

    @RequestMapping(path = "/registrar-producto", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroProducto() {
        if (esAdmin()) {
            ModelMap model = new ModelMap();
            model.put("datosProducto", new DatosProducto());
            return new ModelAndView("registrar-producto", model);
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/registrar-producto", method = RequestMethod.POST)
    public ModelAndView registrarProducto(@ModelAttribute("datosProducto") DatosProducto datosProducto) {
        if (esAdmin()) {
            servicioTienda.agregarProducto(datosProducto);
            return new ModelAndView("redirect:/tienda");
        } else {
            return new ModelAndView("redirect:/login");
        }
    }

    @RequestMapping(path = "/tienda", method = RequestMethod.GET)
    public ModelAndView mostrarTienda() {
        ModelMap model = new ModelMap();
        model.put("productos", servicioTienda.listarTodos());
        model.put("datosProducto", new DatosProducto());
        return new ModelAndView("tienda", model);
    }

    @RequestMapping(path = "/buscarProducto", method = RequestMethod.POST)
    public ModelAndView productoBuscado(@ModelAttribute("datosProducto") DatosProducto datosProducto) {
        ModelMap modelo = new ModelMap();
        modelo.put("productos", servicioTienda.buscarGeneral(datosProducto.getNombre()));
        return new ModelAndView("tienda", modelo);
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
