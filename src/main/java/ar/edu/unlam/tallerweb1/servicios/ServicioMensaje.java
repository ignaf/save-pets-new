package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMensaje;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;

import java.util.List;

public interface ServicioMensaje {
    Mensaje agregarMensaje(DatosMensaje datosMensaje);
    Mensaje asignarUsuarios(Long idMensaje, Long idDestinatario);
    List<Mensaje> buscarMensajes(Long idDestinatario);
}
