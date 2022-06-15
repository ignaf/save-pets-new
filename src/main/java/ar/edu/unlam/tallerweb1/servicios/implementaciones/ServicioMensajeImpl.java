package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMensaje;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMensaje;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioMensaje;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ServicioMensaje")
public class ServicioMensajeImpl implements ServicioMensaje {

    private RepositorioMensaje repositorioMensaje;
    private RepositorioUsuario repositorioUsuario;

    @Autowired
    public ServicioMensajeImpl(RepositorioMensaje repositorioMensaje, RepositorioUsuario repositorioUsuario){
        this.repositorioMensaje = repositorioMensaje;
        this.repositorioUsuario = repositorioUsuario;
    }

    @Override
    public Mensaje agregarMensaje(DatosMensaje datosMensaje) {
        Mensaje mensaje = new Mensaje(datosMensaje);
        repositorioMensaje.guardar(mensaje);
        return mensaje;
    }

    @Override
    public Mensaje asignarUsuarios(Long idMensaje, Long idDestinatario) {
        Mensaje mensaje = repositorioMensaje.buscar(idMensaje);
        mensaje.setIdDestinatario(repositorioUsuario.buscarId(idDestinatario));
        repositorioMensaje.asignarUsuarios(mensaje);
        return mensaje;
    }

    @Override
    public List<Mensaje> buscarMensajes(Long idDestinatario) {
        return repositorioMensaje.buscarTodos(idDestinatario);
    }

}
