package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Producto;
import ar.edu.unlam.tallerweb1.modelo.Refugio;

public interface RepositorioTienda {
    void guardar(Producto producto);
    Producto buscar(Long id);
    List<Producto> buscarNombre(String nombre);
    List<Producto> buscarTodos();
    List<Producto> buscarGeneral(String nombre);
}
