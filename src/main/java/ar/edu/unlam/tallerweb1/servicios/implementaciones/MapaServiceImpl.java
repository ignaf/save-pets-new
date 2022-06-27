package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.DistanceMatrixApi;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.Distance;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.GeocodingResult;
import com.mysql.cj.x.protobuf.Mysqlx;
import okhttp3.*;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public Double obtenerDistancia(String coordenadasA, String coordenadasB) {

        String latA = coordenadasA.substring(0, coordenadasA.indexOf(","));
        String lonA = coordenadasA.substring(coordenadasA.indexOf(","),coordenadasA.indexOf("}"));
        latA = latA.replace("{","");
        latA = latA.replace("\"","");
        latA = latA.replace(":","");
        latA = latA.replace("lat","");
        lonA = lonA.replace(",","");
        lonA = lonA.replace("\"","");
        lonA = lonA.replace(":","");
        lonA = lonA.replace("lng","");

        String latB = coordenadasB.substring(0, coordenadasB.indexOf(","));
        String lonB = coordenadasB.substring(coordenadasB.indexOf(","),coordenadasB.indexOf("}"));
        latB = latB.replace("{","");
        latB = latB.replace("\"","");
        latB = latB.replace(":","");
        latB = latB.replace("lat","");
        lonB = lonB.replace(",","");
        lonB = lonB.replace("\"","");
        lonB = lonB.replace(":","");
        lonB = lonB.replace("lng","");

        Double doublelatA = Double.valueOf(latA);
        Double doublelonA = Double.valueOf(lonA);
        Double doublelatB = Double.valueOf(latB);
        Double doublelonB = Double.valueOf(lonB);

        double radioTierra = 6371;
        double dLat = Math.toRadians(doublelatB - doublelatA);
        double dLon = Math.toRadians(doublelonB - doublelonA);
        double sindLat = Math.sin(dLat / 2);
        double sindLon = Math.sin(dLon / 2);
        double va1 = Math.pow(sindLat, 2) + Math.pow(sindLon, 2)
                * Math.cos(Math.toRadians(doublelatA))*Math.cos(Math.toRadians(doublelatB));
        double va2 = 2 * Math.atan2(Math.sqrt(va1),Math.sqrt(1 - va1));
        double distancia = radioTierra * va2;

        return distancia;
    }

    @Override
    public List<Mascota> filtrarMascotasPorDistancia(String coordenadasUsuario, List<Mascota> mascotas) throws InterruptedException, ApiException, IOException {
        List<Mascota> mascotasFiltradas = new ArrayList<>();
        
        for (Mascota mascota: mascotas) {
            Double distancia = obtenerDistancia(coordenadasUsuario, mascota.getCoordenadas());
            if(distancia<5){
                mascotasFiltradas.add(mascota);
            }
        }
        return mascotasFiltradas;
    }


}
