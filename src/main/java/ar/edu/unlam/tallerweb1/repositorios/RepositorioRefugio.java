package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Refugio;

public interface RepositorioRefugio {
	void guardar(Refugio refugio);
	Refugio buscar(Long id);
	Refugio buscarNombre(String nombre);
	Refugio buscarCoordenadas(String coordenadas);
	List<Refugio> buscarTodos();
	void eliminar(Long id);
	List<Refugio> buscarGeneral(String nombre, String direccion);
}
