package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClaveLongitudIncorrectaException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClavesDistintasException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.UsuarioYaExisteException;
import com.google.maps.errors.ApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;

import java.io.IOException;
import java.util.List;


@Service("servicioUsuario")
@Transactional
public class ServicioUsuarioImpl implements ServicioUsuario {

	private RepositorioUsuario repo;
    private MapaService mapaService;
	
	@Autowired
	public ServicioUsuarioImpl(RepositorioUsuario servicioUsuarioDao, MapaService mapaService){
        this.repo = servicioUsuarioDao;
        this.mapaService = mapaService;
    }

    public Usuario registrar(DatosRegistro datosRegistro) throws InterruptedException, ApiException, IOException {
    	if(lasClavesSonDistintas(datosRegistro)){
            throw new ClavesDistintasException();
        }
        if(laClaveTieneLongitudIncorrecta(datosRegistro)){
            throw new ClaveLongitudIncorrectaException();
        }
        if(repo.buscar(datosRegistro.getEmail()) != null){
            throw new UsuarioYaExisteException();
        }
        Usuario nuevoUsuario = new Usuario(datosRegistro);
        nuevoUsuario.setCoordenadas(mapaService.convertirDireccionACoordenadas(datosRegistro.getDireccion()));
        repo.guardar(nuevoUsuario);
        return nuevoUsuario;
    }

    @Override
    public Usuario buscarPorId(Long id) {
        return repo.buscarId(id);
    }

    public Boolean lasClavesSonDistintas(DatosRegistro datosRegistro) {
        return !datosRegistro.getClave().equals(datosRegistro.getRepiteClave());
    }

    public Boolean laClaveTieneLongitudIncorrecta(DatosRegistro datosRegistro) {
        return datosRegistro.getClave().length() < 8;
    }

    @Override
    public List<Usuario> listarTodos() {
        return repo.buscarTodos();
    }

}
