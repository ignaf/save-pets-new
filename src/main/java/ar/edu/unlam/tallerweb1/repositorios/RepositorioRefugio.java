package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Refugio;

public interface RepositorioRefugio {
	void guardar(Refugio refugio);
	void eliminar(Long id);
	void modificar(Refugio refugio);
	Refugio buscar(Long id);
	Refugio buscarNombre(String nombre);
	Refugio buscarCoordenadas(String coordenadas);
	List<Refugio> buscarTodos();
	List<Refugio> buscarGeneral(String nombre);
}
