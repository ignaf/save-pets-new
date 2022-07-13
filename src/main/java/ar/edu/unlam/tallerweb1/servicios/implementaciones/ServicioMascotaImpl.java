package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMensaje;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioRefugio;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;

@Service("ServicioMascota")
public class ServicioMascotaImpl implements ServicioMascota {

    private RepositorioMascota repositorioMascota;
    private RepositorioRefugio repositorioRefugio;
    private RepositorioMensaje repositorioMensaje;
    private ServicioMascotaImpl servicioMascota;
    private MapaService mapaService;
    private ServicioUsuario servicioUsuario;

    @Autowired
    public ServicioMascotaImpl(RepositorioMascota repositorioMascota, RepositorioRefugio repositorioRefugio, MapaService mapaService, ServicioUsuario servicioUsuario, RepositorioMensaje repositorioMensaje) {
        this.repositorioMascota = repositorioMascota;
        this.repositorioRefugio = repositorioRefugio;
        this.mapaService = mapaService;
        this.servicioUsuario = servicioUsuario;
        this.repositorioMensaje = repositorioMensaje;
    }

    @Override
    public Mascota agregarMascota(DatosMascota datosMascota) throws InterruptedException, ApiException, IOException {
        Mascota nuevaMascota = new Mascota(datosMascota);
        nuevaMascota.setCoordenadas(mapaService.convertirDireccionACoordenadas(datosMascota.getDireccion()));
        repositorioMascota.guardar(nuevaMascota);
        List<Usuario> listaUsuarios = servicioUsuario.listarTodos();
        for (Usuario usuario: listaUsuarios) {
            Double distancia = mapaService.obtenerDistancia(usuario.getCoordenadas(),nuevaMascota.getCoordenadas());
            if(distancia<5){
                Mensaje mensaje = new Mensaje();
                mensaje.setIdDestinatario(usuario);
                mensaje.setContenido("Se registro un nuevo animal en su area");
                repositorioMensaje.guardar(mensaje);
            }
        }


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
    public List<Mascota> listarMascotasSinRefugio() {
        return repositorioMascota.listarMascotasSinRefugio();
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
    public List<Mascota> buscarGeneral(DatosMascota datos) {
        return repositorioMascota.buscarGeneral(
        		datos.getEspecie(),
        		datos.getDireccion(),
        		datos.getDescripcion(),
        		datos.getRaza(),
        		datos.getPelaje()
        		);
    }

    @Override
    public Mascota buscarPorId(Long id) {
        return repositorioMascota.buscar(id);
    }


}
