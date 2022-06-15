package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import java.io.IOException;
import java.util.List;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;

@Service("ServicioMascota")
public class ServicioMascotaImpl implements ServicioMascota {

    private RepositorioMascota repositorioMascota;
    private ServicioMascotaImpl servicioMascota;
    private MapaService mapaService;

    @Autowired
    public ServicioMascotaImpl(RepositorioMascota repositorioMascota, MapaService mapaService){
        this.repositorioMascota = repositorioMascota;
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
    public Mascota agregarMascotaARefugio(DatosMascota datosMascota) {
        Mascota nuevaMascota = new Mascota(datosMascota);
        repositorioMascota.guardar(nuevaMascota);
        return nuevaMascota;
    }

    @Override
    public List<Mascota> buscarMascota(String nombre) {
        return repositorioMascota.buscarNombre(nombre);
    }
    
    @Override
    public List<Mascota> buscarGeneral(String nombre) {
        return repositorioMascota.buscarGeneral(nombre);
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
	public Mascota buscarMascotaPorId(Long idMascota){
		return repositorioMascota.buscarPorId(idMascota);
	}
	
	@Override
	public void asignarRefugioAMascota(Long idMascota, Refugio refugio) {
		Mascota mascotabuscada= buscarMascotaPorId(idMascota);
		mascotabuscada.setRefugio(refugio);
		repositorioMascota.asignarRefugioAMascota(mascotabuscada);
	}
	
	@Override
	public List<Mascota> buscarMascotaPorRefugio(Long idRefugio){
		return repositorioMascota.buscarMascotaPorRefugio(idRefugio);
	}
}
