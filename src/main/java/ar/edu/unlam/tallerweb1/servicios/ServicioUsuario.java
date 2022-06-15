package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

import java.util.List;

public interface ServicioUsuario {

	Usuario registrar(DatosRegistro datosRegistro);
	Usuario buscarPorId(Long id);
	Boolean lasClavesSonDistintas(DatosRegistro datosRegistro);
	Boolean laClaveTieneLongitudIncorrecta(DatosRegistro datosRegistro);
	List<Usuario> listarTodos();
}
