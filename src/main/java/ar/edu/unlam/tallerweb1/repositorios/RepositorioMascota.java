package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;

public interface RepositorioMascota {
    void guardar(Mascota mascota);
    Mascota buscar(Long id);
    List<Mascota> buscarNombre(String nombre);
    List<Mascota> buscarTodos();
}
