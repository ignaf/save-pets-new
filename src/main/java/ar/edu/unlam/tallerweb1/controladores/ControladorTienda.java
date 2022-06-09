package ar.edu.unlam.tallerweb1.controladores;


import ar.edu.unlam.tallerweb1.controladores.dtos.DatosLogin;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosProducto;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

import ar.edu.unlam.tallerweb1.servicios.ServicioLogin;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import ar.edu.unlam.tallerweb1.servicios.ServicioTienda;
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
public class ControladorTienda {

	private ServicioTienda servicioTienda;

	@Autowired
	public ControladorTienda(ServicioTienda servicioTienda){
		this.servicioTienda = servicioTienda;
	}

    @RequestMapping(path = "/registrar-producto", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioRegistroProducto(){
        ModelMap model = new ModelMap();
        model.put("datosProducto", new DatosProducto());
        return new ModelAndView("registrar-producto", model);
    }

    @RequestMapping(path="/registrar-producto", method = RequestMethod.POST)
    public ModelAndView registrarProducto(@ModelAttribute("datosProducto") DatosProducto datosProducto) {
        servicioTienda.agregarProducto(datosProducto);
        return new ModelAndView("redirect:/registrar-producto");
    }
    
    @RequestMapping(path="/tienda", method = RequestMethod.GET)
    public ModelAndView mostrarTienda() {
        ModelMap model = new ModelMap();
        model.put("productos", servicioTienda.listarTodos());
        model.put("datosProducto", new DatosProducto());
        return new ModelAndView("tienda", model);
    }
    
    @RequestMapping(path = "/buscarProducto", method = RequestMethod.POST)
    public ModelAndView productoBuscado(@ModelAttribute("datosProducto") DatosProducto datosProducto){
        ModelMap modelo = new ModelMap();
        modelo.put("productos", servicioTienda.buscarGeneral(datosProducto.getNombre()));
        return new ModelAndView("tienda", modelo);
    }
}