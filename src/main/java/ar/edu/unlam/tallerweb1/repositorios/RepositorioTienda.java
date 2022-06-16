package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Producto;

import java.util.List;

public interface RepositorioTienda {
    void guardar(Producto producto);
    Producto buscar(Long id);
    List<Producto> buscarNombre(String nombre);
    List<Producto> buscarTodos();
    List<Producto> buscarGeneral(String nombre);
}