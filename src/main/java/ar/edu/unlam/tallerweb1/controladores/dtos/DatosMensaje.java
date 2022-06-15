package ar.edu.unlam.tallerweb1.controladores.dtos;

public class DatosMensaje {

    private String contenido;
    private Long idDestinatario;

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Long getIdDestinatario() {
        return idDestinatario;
    }

    public void setIdDestinatario(Long idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    public DatosMensaje(){};

    public DatosMensaje(String contenido, Long idDestinatario){

        this.contenido=contenido;
        this.idDestinatario=idDestinatario;
    }
}
