package ar.edu.unlam.tallerweb1.servicios;

import java.io.IOException;
import java.util.List;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import com.google.maps.errors.ApiException;

public interface ServicioMascota {

    Mascota agregarMascota(DatosMascota datosMascota) throws InterruptedException, ApiException, IOException;
    Mascota asignarRefugio(Long idMascota, Long idRefugio);
    List<Mascota> buscarMascota(String nombre);
    List<Mascota> listarTodos();
    List<Mascota> listarMascotasSinRefugio();
    void eliminar(Long id);
    List<Mascota> buscarMascotaPorRefugio(Long idRefugio);
    List<Mascota> buscarGeneral(String nombre);
    Mascota buscarPorId(Long id);

}
