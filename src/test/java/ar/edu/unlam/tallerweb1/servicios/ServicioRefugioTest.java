package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRefugio;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioRefugio;
import ar.edu.unlam.tallerweb1.servicios.implementaciones.*;
import com.google.maps.errors.ApiException;
import org.junit.Test;
import org.mockito.Matchers;

import java.io.IOException;


import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.*;

public class ServicioRefugioTest {

    private RepositorioRefugio repositorioRefugio = mock(RepositorioRefugio.class);
    private MapaService mapaService = mock(MapaService.class);
    private ServicioRefugio servicioRefugio = new ServicioRefugioImpl(repositorioRefugio, mapaService);

    @Test
    public void siNoExisteElNombreNiLaUbicacionElRegistroEsExitoso() throws InterruptedException, ApiException, IOException {
        //given
        givenNoExisteUnRefugio();
        //when
        DatosRefugio datosRefugio = new DatosRefugio("RefugioTest", "Paraguay 5384, Buenos Aires",
                "1173624522", 30, "imgtest");
        Refugio refugio = whenCreoUnRefugioYLoAgrego(datosRefugio);
        //then
        thenElRegistroEsExitoso(refugio);

    }

    private void thenElRegistroEsExitoso(Refugio refugio) {
        verify(repositorioRefugio, times(1)).guardar(refugio);
    }

    private Refugio whenCreoUnRefugioYLoAgrego(DatosRefugio datosRefugio) throws InterruptedException, ApiException, IOException {
        return servicioRefugio.agregarRefugio(datosRefugio);

    }

    private void givenNoExisteUnRefugio() {
    }
}
