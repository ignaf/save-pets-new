package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import com.google.maps.errors.ApiException;


import java.io.IOException;
import java.util.List;

public interface MapaService {

    String convertirDireccionACoordenadas(String direccion) throws InterruptedException, ApiException, IOException;
    Double obtenerDistancia(String direccionA, String direccionB);
    List<Mascota> filtrarMascotasPorDistancia(String coordenadasUsuario, List<Mascota> mascotas) throws InterruptedException, ApiException, IOException;
}

