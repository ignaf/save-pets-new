package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import java.io.IOException;
import java.util.List;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioRefugio;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;

@Service("ServicioMascota")
public class ServicioMascotaImpl implements ServicioMascota {

    private RepositorioMascota repositorioMascota;
    private RepositorioRefugio repositorioRefugio;
    private ServicioMascotaImpl servicioMascota;
    private MapaService mapaService;

    @Autowired
    public ServicioMascotaImpl(RepositorioMascota repositorioMascota, RepositorioRefugio repositorioRefugio, MapaService mapaService) {
        this.repositorioMascota = repositorioMascota;
        this.repositorioRefugio = repositorioRefugio;
        this.mapaService = mapaService;
    }

    @Override
    public Mascota agregarMascota(DatosMascota datosMascota) throws InterruptedException, ApiException, IOException {
        Mascota nuevaMascota = new Mascota(datosMascota);
        nuevaMascota.setCoordenadas(mapaService.convertirDireccionACoordenadas(datosMascota.getDireccion()));
        repositorioMascota.guardar(nuevaMascota);
        return nuevaMascota;
    }


    @Override
    public Mascota asignarRefugio(Long id, Long refugioId) {
        Mascota mascota = repositorioMascota.buscar(id);
        mascota.setRefugio(repositorioRefugio.buscar(refugioId));
        repositorioMascota.asignarRefugio(mascota);
        return mascota;
    }

    @Override
    public List<Mascota> buscarMascota(String nombre) {
        return repositorioMascota.buscarNombre(nombre);
    }

    @Override
    public List<Mascota> listarTodos() {
        return repositorioMascota.buscarTodos();
    }

    @Override
    public void eliminar(Long id) {
        repositorioMascota.eliminar(id);
    }

    @Override
    public List<Mascota> buscarMascotaPorRefugio(Long idRefugio) {
        return repositorioMascota.buscarMascotaPorRefugio(idRefugio);
    }

    @Override
    public List<Mascota> buscarGeneral(String nombre) {
        return repositorioMascota.buscarGeneral(nombre);
    }



}
