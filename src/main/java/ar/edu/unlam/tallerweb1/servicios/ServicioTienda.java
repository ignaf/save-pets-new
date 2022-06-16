package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosProducto;
import ar.edu.unlam.tallerweb1.modelo.Producto;

import java.util.List;

public interface ServicioTienda {

    Producto agregarProducto(DatosProducto datosProducto);
    List<Producto> buscarProducto(String nombre);
    List<Producto> buscarGeneral(String nombre);
    List<Producto> listarTodos();

}
