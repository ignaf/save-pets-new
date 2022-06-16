package ar.edu.unlam.tallerweb1;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.doThrow;
import java.io.IOException;
import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;
import com.google.maps.errors.ApiException;
import ar.edu.unlam.tallerweb1.controladores.ControladorRefugios;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRefugio;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import ar.edu.unlam.tallerweb1.servicios.excepciones.RefugioNombreYaExisteException;

public class ControladorRefugio_test {

	private MapaService mapaService = mock(MapaService.class);
	private ServicioMascota servicioMascota = mock(ServicioMascota.class);
	private ServicioRefugio servicioRefugio = mock(ServicioRefugio.class);
	/*private ControladorRefugios controladorRefugios = new ControladorRefugios(servicioMascota,servicioRefugio,mapaService);
	
	ModelAndView mav;
	
	@Test
	public void queSePuedaCrearUnRefugio() throws InterruptedException, ApiException, IOException{
		givenNoExisteUnRefugio();
		
		DatosRefugio datosRefugio= new DatosRefugio("Refugio1","Charlone 269, la tablada", "44548932", 20, "https://www.hogarmania.com/archivos/202011/cosas-donar-refugio-animales-portada-668x400x80xX-1.jpg");
		
		whenCreoUnRefugio(datosRefugio);
		
		thenElRegistroEsExitoso();
	}
	
	@Test
	public void queNoSePuedaCrearUnRefugioConUnNombreRepetido() throws InterruptedException, ApiException, IOException{
		givenNoExisteUnRefugio();
		
		DatosRefugio datosRefugio= new DatosRefugio("Refugio1","Charlone 269, la tablada", "44548932", 20, "https://www.hogarmania.com/archivos/202011/cosas-donar-refugio-animales-portada-668x400x80xX-1.jpg");
		
		doThrow(RefugioNombreYaExisteException.class)
			.when(servicioRefugio)
			.agregarRefugio(datosRefugio);
		
		whenCreoUnRefugio(datosRefugio);
		
		thenElRegistroFallaPorqueElNombreYaExiste();
	}
	
	private void thenElRegistroFallaPorqueElNombreYaExiste() {
		assertThat(mav.getViewName()).isEqualTo("registrar-refugio");
	}

	private void thenElRegistroEsExitoso() {
		assertThat(mav.getViewName()).isEqualTo("Refugios");
	}

	private void whenCreoUnRefugio(DatosRefugio datosRefugio) throws InterruptedException, ApiException, IOException{
		mav = controladorRefugios.registrarRefugio(datosRefugio);
	}

	private void givenNoExisteUnRefugio() {

	}*/
}
