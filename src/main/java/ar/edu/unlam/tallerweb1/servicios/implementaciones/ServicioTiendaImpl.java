package ar.edu.unlam.tallerweb1.servicios.implementaciones;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosProducto;
import ar.edu.unlam.tallerweb1.modelo.Producto;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioTienda;
import ar.edu.unlam.tallerweb1.servicios.ServicioTienda;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("servicioTienda")
public class ServicioTiendaImpl implements ServicioTienda {

    private RepositorioTienda repositorioTienda;

    @Autowired
    public ServicioTiendaImpl(RepositorioTienda servicioTienda){
        this.repositorioTienda = servicioTienda;
    }

    @Override
    public Producto agregarProducto(DatosProducto datosProducto){
        Producto nuevaProducto = new Producto(datosProducto);
        repositorioTienda.guardar(nuevaProducto);
        return nuevaProducto;
    }

    @Override
    public List<Producto> buscarProducto(String nombre) {
        return repositorioTienda.buscarNombre(nombre);
    }

    @Override
    public List<Producto> buscarGeneral(String nombre) {
        return repositorioTienda.buscarGeneral(nombre);
    }

    @Override
    public List<Producto> listarTodos() {
        return repositorioTienda.buscarTodos();
    }
}
