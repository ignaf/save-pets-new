package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Mensaje;

import java.util.List;

public interface RepositorioMensaje {
    Mensaje buscar(Long id);
    List<Mensaje> buscarTodos(Long idDestinatario);
    void asignarUsuarios(Mensaje mensaje);
    void guardar(Mensaje mensaje);
}
