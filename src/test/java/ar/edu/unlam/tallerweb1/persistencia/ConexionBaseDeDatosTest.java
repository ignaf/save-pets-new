package ar.edu.unlam.tallerweb1.persistencia;

import ar.edu.unlam.tallerweb1.SpringTest;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import static org.assertj.core.api.Assertions.*;

// Clase que prueba la conexion a la base de datos. Hereda de SpringTest por lo que corre dentro del contexto
// de spring
public class ConexionBaseDeDatosTest extends SpringTest{

    @Test
    @Transactional @Rollback
    public void pruebaConexion(){
        assertThat(session().isConnected()).isTrue();
        //aca

    }

    @Test
    @Transactional @Rollback
    public void crearUsuario(){
        Usuario usuario = new Usuario();
        usuario.setEmail("leandronicolas1177@gmail.com");
        usuario.setPassword("1177");
       // usuario.setRol("ADMIN");
        session().save(usuario);
        assertThat(usuario.getId()).isNotNull();
    }


    }


