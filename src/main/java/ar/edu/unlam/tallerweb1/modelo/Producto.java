package ar.edu.unlam.tallerweb1.modelo;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosProducto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private Double precio;
    private String imagen;
    private String descripcion;
    private String animales;

    public Producto() {}

    public Producto(DatosProducto datosProducto) {
        this.nombre=datosProducto.getNombre();
        this.precio=datosProducto.getPrecio();
        this.descripcion=datosProducto.getDescripcion();
        this.animales=datosProducto.getAnimales();
        this.imagen=datosProducto.getImagen();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getAnimales() {
        return animales;
    }

    public void setAnimales(String animales) {
        this.animales = animales;
    }

}