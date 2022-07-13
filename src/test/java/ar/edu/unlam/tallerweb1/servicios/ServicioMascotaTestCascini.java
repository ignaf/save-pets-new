package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRefugio;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMensaje;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioRefugio;
import ar.edu.unlam.tallerweb1.servicios.implementaciones.ServicioMascotaImpl;
import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

import java.util.List;

public class ServicioMascotaTestCascini {

    private RepositorioRefugio repositorioRefugio = mock(RepositorioRefugio.class);
    private RepositorioMascota repositorioMascota = mock(RepositorioMascota.class);
    private RepositorioMensaje repositorioMensaje = mock(RepositorioMensaje.class);
    private MapaService mapaService = mock(MapaService.class);
    private ServicioUsuario servicioUsuario = mock(ServicioUsuario.class);
    private ServicioMascota servicioMascota = new ServicioMascotaImpl(repositorioMascota, repositorioRefugio, mapaService, servicioUsuario, repositorioMensaje);

    @Test
    public void buscarUnaMascota(){
        //given
        DatosMascota datosMascota = givenExisteUnaMascota();
        
        //when
        List<Mascota> mascota = whenBuscoUnaMascota(datosMascota);

        //then
        thenEncuentroLaMascota(mascota);
    }

    private DatosMascota givenExisteUnaMascota() {
        DatosMascota datosMascota = new DatosMascota("Perro", "", "", "", "", "", "");
        return datosMascota;
    }
    
    private List<Mascota> whenBuscoUnaMascota(DatosMascota datosMascota) {
		return servicioMascota.buscarGeneral(datosMascota);
	}
    
    private void thenEncuentroLaMascota(List<Mascota> mascota) {
		verify(repositorioMascota, times(1)).buscarGeneral("Perro", "", "", "", "");
	}
  
}
