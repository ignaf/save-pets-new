package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Mensaje;

public interface RepositorioMensaje {
    Mensaje buscar(Long id);
    void asignarUsuarios(Mensaje mensaje);
    void guardar(Mensaje mensaje);
}
