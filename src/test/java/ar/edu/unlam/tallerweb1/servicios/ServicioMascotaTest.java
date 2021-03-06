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

import static org.mockito.Mockito.*;

public class ServicioMascotaTest {

    private RepositorioRefugio repositorioRefugio = mock(RepositorioRefugio.class);
    private RepositorioMascota repositorioMascota = mock(RepositorioMascota.class);
    private RepositorioMensaje repositorioMensaje = mock(RepositorioMensaje.class);
    private MapaService mapaService = mock(MapaService.class);
    private ServicioUsuario servicioUsuario = mock(ServicioUsuario.class);
    private ServicioMascota servicioMascota = new ServicioMascotaImpl(repositorioMascota, repositorioRefugio, mapaService, servicioUsuario, repositorioMensaje);

    @Test
    public void asignarRefugioAUnaMascota(){
        //given
        DatosMascota datosMascota = new DatosMascota("perro","Curupayti 1320, Moron, Buenos Aires", "NombreT","lorem ipsum","idk","largo","img");
        Mascota mascota = givenExisteUnaMascota(datosMascota);

        DatosRefugio datosRefugio = new DatosRefugio("RefugioTest", "Paraguay 5384, Buenos Aires",
                "1173624522", 30, "imgtest");
        Refugio refugio = givenExisteUnRefugioConId(datosRefugio);

        //when
        whenLeAsignoElRefugioALaMascota(mascota, refugio);

        //then
        thenLaMascotaPasaATenerRefugio(mascota, refugio);
    }

    private void thenLaMascotaPasaATenerRefugio(Mascota mascota, Refugio refugio) {
        verify(repositorioMascota).asignarRefugio(mascota);
    }

    private void whenLeAsignoElRefugioALaMascota(Mascota mascota, Refugio refugio) {
        when(repositorioMascota.buscar(mascota.getId())).thenReturn(mascota);
        when(repositorioRefugio.buscar(refugio.getId())).thenReturn(refugio);
        servicioMascota.asignarRefugio(mascota.getId(),refugio.getId());
    }

    private Refugio givenExisteUnRefugioConId(DatosRefugio datosRefugio) {
        Refugio refugio = new Refugio(datosRefugio);
        refugio.setId((long) 2);
        return refugio;
    }

    private Mascota givenExisteUnaMascota(DatosMascota datosMascota) {
        Mascota mascota = new Mascota(datosMascota);
        return mascota;
    }
}
