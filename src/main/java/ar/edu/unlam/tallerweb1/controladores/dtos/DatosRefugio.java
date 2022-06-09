package ar.edu.unlam.tallerweb1.controladores.dtos;

public class DatosRefugio {

    //nombre direccion numerotelefono cap max imagen

	private Long id;
    private String nombre;
    private String direccion;
    private String numeroTelefono;
    private Integer capmax;
    private String urlimagen;

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

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    public Integer getCapmax() {
        return capmax;
    }

    public void setCapmax(Integer capmax) {
        this.capmax = capmax;
    }

    public String getUrlimagen() {
        return urlimagen;
    }

    public void setUrlimagen(String urlimagen) {
        this.urlimagen = urlimagen;
    }

    public DatosRefugio(){}
    
    public DatosRefugio(Long id){
    	this.id=id;
    }

    public DatosRefugio(String nombre, String direccion, String numeroTelefono, Integer capmax, String urlimagen){
        this.nombre = nombre;
        this.direccion = direccion;
        this.capmax = capmax;
        this.urlimagen = urlimagen;
    }
}


