package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Mensaje;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMensaje;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;
import ar.edu.unlam.tallerweb1.servicios.implementaciones.ServicioMensajeImpl;
import org.junit.Test;

import static org.mockito.Mockito.*;

public class ServicioMensajeTest {

    private RepositorioMensaje repositorioMensaje = mock(RepositorioMensaje.class);
    private RepositorioUsuario repositorioUsuario = mock(RepositorioUsuario.class);

    private ServicioMensaje servicioMensaje = new ServicioMensajeImpl(repositorioMensaje, repositorioUsuario);
    private Mensaje mensaje = new Mensaje();
    private Usuario usuario = new Usuario();
    @Test
    public void asignarUsuarios(){
        //given tengo los Ids de usuario y de mensaje
        Long idUsuario = Long.valueOf(1);
        Long idMensaje = Long.valueOf(1);

        //when
        whenLlamoAlMetodoAsignarUsuarios(idUsuario, idMensaje);

        //then
        thenElRepositorioAsignaLosUsuarios();
    }



    private void whenLlamoAlMetodoAsignarUsuarios(Long idMensaje, Long idUsuario) {

        when(repositorioMensaje.buscar(idMensaje)).thenReturn(mensaje);
        when(repositorioUsuario.buscarId(idUsuario)).thenReturn(usuario);
        servicioMensaje.asignarUsuarios(idMensaje,idUsuario);
    }

    private void thenElRepositorioAsignaLosUsuarios() {
        verify(repositorioMensaje).asignarUsuarios(mensaje);
    }
}
