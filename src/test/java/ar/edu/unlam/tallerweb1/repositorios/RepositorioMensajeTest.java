package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.SpringTest;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.assertj.core.api.Java6Assertions.assertThat;


public class RepositorioMensajeTest extends SpringTest {
    @Autowired
    private RepositorioMensaje repositorioMensaje;

    @Test
    @Transactional
    @Rollback
    public void asignarUsuarios(){
        //given existe un mensaje
        Mensaje mensaje = new Mensaje();
        //when
        whenLlamoAlMetodoAsignarUsuarios(mensaje);
        //then
        thenSeRealizaElUpdate();
    }

    @Test
    @Transactional
    @Rollback
    public void buscarTodos(){
        //preparacion
        Long idDestinatario = Long.valueOf(1);
        Usuario usuario1 = new Usuario();
        usuario1.setId(idDestinatario);
        Mensaje mensaje1 = new Mensaje();
        mensaje1.setContenido("hola");
        mensaje1.setIdDestinatario(usuario1);
        Mensaje mensaje2 = new Mensaje();
        mensaje2.setContenido("chau");
        mensaje2.setIdDestinatario(usuario1);
        session().save(mensaje1);
        session().save(mensaje2);

        List<Mensaje> mensajes = whenLlamoAlMetodoBuscarTodos(idDestinatario);

        //comprobacion
        assertThat(mensajes).hasSize(2);
    }

    private List<Mensaje> whenLlamoAlMetodoBuscarTodos(Long idDestinatario) {
        return repositorioMensaje.buscarTodos(idDestinatario);
    }



    private void whenLlamoAlMetodoAsignarUsuarios(Mensaje mensaje) {
        repositorioMensaje.asignarUsuarios(mensaje);
    }

    private void thenSeRealizaElUpdate() {

    }
}
