package ar.edu.unlam.tallerweb1.servicios;

import com.google.maps.errors.ApiException;


import java.io.IOException;

public interface MapaService {

    String convertirDireccionACoordenadas(String direccion) throws InterruptedException, ApiException, IOException;
    Double obtenerDistancia(String direccionA, String direccionB);
}

