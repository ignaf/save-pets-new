package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioRefugio;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClavesDistintasException;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class ControladorMascotaTestCascini {
	
    private MapaService mapaService = mock(MapaService.class);
    private ServicioMascota servicioMascota = mock(ServicioMascota.class);
    private ServicioRefugio servicioRefugio = mock(ServicioRefugio.class);
    private ServicioUsuario servicioUsuario = mock(ServicioUsuario.class);
    private HttpServletRequest request = mock(HttpServletRequest.class);
    private ModelAndView mav;
    
    private ControladorMascotas controladorMascota = new ControladorMascotas(servicioMascota, mapaService, servicioRefugio, request, servicioUsuario);
    
    @Test
    public void buscarUnaMascota() {
    	//request.getSession().setAttribute("Rol", "Admin");
        DatosMascota datosMascota = givenExisteMascotas();
        
    	whenBuscoUnaMacota(datosMascota);
    	
    	thenEncuentroLaMascotaBuscada();
    		
    }

	private DatosMascota givenExisteMascotas() {
        return new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
	}
	
	private void whenBuscoUnaMacota(DatosMascota datosMascota) {
		mav = controladorMascota.mascotaBuscada(datosMascota);
	}
	
	private void thenEncuentroLaMascotaBuscada() {
		assertThat(mav.getViewName()).isEqualTo("buscarMascota");
	}


}