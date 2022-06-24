package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import com.google.maps.errors.ApiException;

import java.io.IOException;
import java.util.List;

public interface ServicioUsuario {

	Usuario registrar(DatosRegistro datosRegistro) throws InterruptedException, ApiException, IOException;
	Usuario buscarPorId(Long id);
	Boolean lasClavesSonDistintas(DatosRegistro datosRegistro);
	Boolean laClaveTieneLongitudIncorrecta(DatosRegistro datosRegistro);
	List<Usuario> listarTodos();
}
