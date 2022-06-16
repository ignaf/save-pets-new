package ar.edu.unlam.tallerweb1.modelo;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRefugio;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

@Entity
public class Refugio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nombre;
	private String direccion;
	private String coordenadas;
	private String numeroTelefono;
	private Integer capMax;
	private String imagen;
	
	public Refugio() {}
	
	public Refugio(DatosRefugio datosRefugio) {
		this.nombre=datosRefugio.getNombre();
		this.direccion=datosRefugio.getDireccion();
		this.numeroTelefono=datosRefugio.getNumeroTelefono();
		this.capMax=datosRefugio.getCapmax();
		this.imagen=datosRefugio.getUrlimagen();
	}

	public Refugio(Long id, String nombre, String numeroTelefono, String urlimagen, String direccion,
			Integer capmax) {
		this.id=id;
		this.nombre=nombre;
		this.numeroTelefono=numeroTelefono;
		this.imagen=urlimagen;
		this.direccion=direccion;
		this.capMax=capmax;
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

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Integer getCapMax() {
		return capMax;
	}

	public void setCapMax(Integer capMax) {
		this.capMax = capMax;
	}

	public String getNumeroTelefono() {
		return numeroTelefono;
	}

	public void setNumeroTelefono(String numeroTelefono) {
		this.numeroTelefono = numeroTelefono;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getCoordenadas() {return coordenadas;	}

	public void setCoordenadas(String coordenadas) {this.coordenadas = coordenadas;	}

}
