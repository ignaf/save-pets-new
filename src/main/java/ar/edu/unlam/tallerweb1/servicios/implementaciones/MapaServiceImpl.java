package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import ar.edu.unlam.tallerweb1.servicios.MapaService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service("mapaService")
public class MapaServiceImpl implements MapaService {
    private final String APIKEY = "AIzaSyDfZngbmKvsGihBpDOula__FPbJ7jspyrA";
    GeoApiContext context = new GeoApiContext.Builder().apiKey(APIKEY).build();

    private MapaServiceImpl mapaService;

    @Override
    public String convertirDireccionACoordenadas(String direccion) throws InterruptedException, ApiException, IOException {
        GeocodingResult[] results = GeocodingApi.geocode(context, direccion).await();
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
      //  String coordenadas =  results[0].geometry.location.toString();
         return gson.toJson(results[0].geometry.location).toString();
    }


}
