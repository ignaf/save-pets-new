package ar.edu.unlam.tallerweb1.modelo;

import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMensaje;

import javax.persistence.*;

@Entity
public class Mensaje {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String contenido;
    @ManyToOne
    @JoinColumn(name = "idDestinatario ", nullable=true)
    private Usuario idDestinatario;

    public Mensaje(DatosMensaje datosMensaje){
        this.contenido=datosMensaje.getContenido();
    }

    public Mensaje(){};

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Usuario getIdDestinatario() {
        return idDestinatario;
    }

    public void setIdDestinatario(Usuario idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    public Long getId() {
        return id;
    }


}
