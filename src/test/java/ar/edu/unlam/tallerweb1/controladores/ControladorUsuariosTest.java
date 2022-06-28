package ar.edu.unlam.tallerweb1.controladores;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioMensaje;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class ControladorUsuariosTest {

    private ServicioUsuario servicioUsuario = mock(ServicioUsuario.class);
    private HttpServletRequest request = mock(HttpServletRequest.class);
    private ServicioMensaje servicioMensaje = mock(ServicioMensaje.class);

    private ControladorUsuarios controladorUsuarios = new ControladorUsuarios(servicioUsuario,request,servicioMensaje);
    private ModelAndView mav;
    @Test
    public void enviarMensaje(){
        //given
        givenElUsuarioEsAdmin();
        //when
        whenLlamoAEnviarMensaje();
        //then
        thenMeDevuelveLaVista();
    }

    private void givenElUsuarioEsAdmin() {
       // when(request.getSession().getAttribute("Rol") == "Admin").thenReturn(true);
        when(controladorUsuarios.esAdmin()).thenReturn(true);
    }

    private void whenLlamoAEnviarMensaje() {
        List<Usuario> lista = new ArrayList<>();
        when(servicioUsuario.listarTodos()).thenReturn(lista);
         mav = controladorUsuarios.enviarMensaje();
    }

    private void thenMeDevuelveLaVista() {
        assertEquals("EnviarMensaje",mav.getViewName());
    }

}
