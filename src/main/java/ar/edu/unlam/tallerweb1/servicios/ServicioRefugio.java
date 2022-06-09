package ar.edu.unlam.tallerweb1.servicios;

import java.io.IOException;
import java.util.List;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRefugio;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import com.google.maps.errors.ApiException;

public interface ServicioRefugio {

	Refugio agregarRefugio(DatosRefugio datosRefugio) throws InterruptedException, ApiException, IOException;
	Refugio buscarRefugioPorNombre(String nombre);
	void eliminar(Long id);
	void modificar(DatosRefugio datosRefugio);
	List<Refugio> listarTodos();
	List<Refugio> buscarGeneral(String nombre);
}
