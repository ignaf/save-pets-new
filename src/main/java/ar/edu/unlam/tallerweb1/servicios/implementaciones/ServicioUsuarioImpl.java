package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClaveLongitudIncorrectaException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.ClavesDistintasException;
import ar.edu.unlam.tallerweb1.servicios.excepciones.UsuarioYaExisteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;


@Service("servicioUsuario")
@Transactional
public class ServicioUsuarioImpl implements ServicioUsuario {

	private RepositorioUsuario repo;
	
	@Autowired
	public ServicioUsuarioImpl(RepositorioUsuario servicioUsuarioDao){
        this.repo = servicioUsuarioDao;
    }

    public Usuario registrar(DatosRegistro datosRegistro) {
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
        repo.guardar(nuevoUsuario);
        return nuevoUsuario;
    }

    public Boolean lasClavesSonDistintas(DatosRegistro datosRegistro) {
        return !datosRegistro.getClave().equals(datosRegistro.getRepiteClave());
    }

    public Boolean laClaveTieneLongitudIncorrecta(DatosRegistro datosRegistro) {
        return datosRegistro.getClave().length() < 8;
    }
    
}
