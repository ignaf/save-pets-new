package ar.edu.unlam.tallerweb1.modelo;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosRegistro;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String email;
	private String password;
	private Boolean esAdmin;

	public Usuario(){}
	
	public Usuario(String email, String password){
		this.email=email;
		this.password=password;
		this.esAdmin=false;
	}
	
	public Usuario(DatosRegistro datosRegistro) {
		this.email = datosRegistro.getEmail();
		this.password = datosRegistro.getClave();
		this.esAdmin = false;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getEsAdmin() {return esAdmin;}
	public void setEsAdmin(Boolean esAdmin) {this.esAdmin = esAdmin;}
}
