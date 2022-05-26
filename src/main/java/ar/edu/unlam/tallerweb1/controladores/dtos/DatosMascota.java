package ar.edu.unlam.tallerweb1.controladores.dtos;

public class DatosMascota {

    private String nombre;
    private String especie;
    private String imagen;
    private String descripcion;
    private String direccion;
    private String raza;
    private String pelaje;

    public String getNombre() {return nombre;}

    public void setNombre(String nombre) {this.nombre = nombre;}

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getImagen() { return imagen; }

    public void setImagen(String imagen) {this.imagen = imagen; }

    public String getDescripcion() {return descripcion; }

    public void setDescripcion(String descripcion) {this.descripcion = descripcion; }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRaza() { return raza;}

    public void setRaza(String raza) {this.raza = raza; }

    public String getPelaje() { return pelaje;}

    public void setPelaje(String pelaje) {this.pelaje = pelaje;}

    public DatosMascota(){}

    public DatosMascota(String especie, String direccion){
        this.especie = especie;
        this.direccion = direccion;
    }

    public DatosMascota(String especie, String direccion, String nombre, String descripcion, String raza, String pelaje){
        this.especie = especie;
        this.descripcion = descripcion;
        this.direccion = direccion;
        this.nombre = nombre;
        this.raza = raza;
        this.pelaje = pelaje;
    }
}
