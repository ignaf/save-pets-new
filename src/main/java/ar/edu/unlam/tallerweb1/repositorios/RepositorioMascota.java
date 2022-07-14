package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;

public interface RepositorioMascota {
    void guardar(Mascota mascota);
    void asignarRefugio(Mascota mascota);
    Mascota buscar(Long id);
    List<Mascota> buscarNombre(String nombre);
    List<Mascota> buscarTodos();
    void eliminar(Long id);
    List<Mascota> buscarMascotaPorRefugio(Long idRefugio);
    List<Mascota> buscarGeneral(String especie, String direccion, String descripcion, String raza, String pelaje);
    List<Mascota> listarMascotasSinRefugio();
}
