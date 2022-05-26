package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

public interface ServicioUsuario {

	Usuario registrar(DatosRegistro datosRegistro);
	Boolean lasClavesSonDistintas(DatosRegistro datosRegistro);
	Boolean laClaveTieneLongitudIncorrecta(DatosRegistro datosRegistro);
}
