package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMensaje;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;

public interface ServicioMensaje {
    Mensaje agregarMensaje(DatosMensaje datosMensaje);
    Mensaje asignarUsuarios(Long idMensaje, Long idDestinatario);
}
