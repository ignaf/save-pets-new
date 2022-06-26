package ar.edu.unlam.tallerweb1.controladores.dtos;

public class DatosProducto {private String nombre;
    private Double precio;
    private String imagen;
    private String descripcion;
    private String animales;

    public DatosProducto() {}

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
