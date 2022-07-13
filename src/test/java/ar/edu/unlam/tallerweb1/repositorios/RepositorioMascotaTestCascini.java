package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.SpringTest;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;
import ar.edu.unlam.tallerweb1.repositorios.implementaciones.RepositorioMascotaImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class RepositorioMascotaTestCascini extends SpringTest{

    @Autowired
    RepositorioMascota repositorioMascota;

    @Test
    @Transactional
    @Rollback
    public void siPuedoBuscarMascotasPorUnValorDadoEnElFormularioDeBuscar(){
        DatosMascota datosMascota2 = new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva2 = new Mascota(datosMascota2);

        session().save(mascotaNueva2);

        DatosMascota mascotaBuscada = new DatosMascota("Perro", "", "", "", "", "", "");
        
        List<Mascota> mascotas =repositorioMascota.buscarGeneral(
        		mascotaBuscada.getEspecie(),
        		mascotaBuscada.getDireccion(),
        		mascotaBuscada.getDescripcion(),
        		mascotaBuscada.getRaza(),
        		mascotaBuscada.getPelaje());

        assertThat(mascotas.size()).isEqualTo(1);
    }
    
    @Test
    @Transactional
    @Rollback
    public void siHabiendoVariasMascotasSoloEncuentraLaQueQuieroBuscar(){
        DatosMascota datosMascota2 = new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva2 = new Mascota(datosMascota2);
        
        DatosMascota datosMascota3 = new DatosMascota("Gato", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva3 = new Mascota(datosMascota3);

        session().save(mascotaNueva2);
        session().save(mascotaNueva3);

        DatosMascota mascotaBuscada = new DatosMascota("Perro", "", "", "", "", "", "");
        
        List<Mascota> mascotas =repositorioMascota.buscarGeneral(
        		mascotaBuscada.getEspecie(),
        		mascotaBuscada.getDireccion(),
        		mascotaBuscada.getDescripcion(),
        		mascotaBuscada.getRaza(),
        		mascotaBuscada.getPelaje());

        assertThat(mascotas.size()).isEqualTo(1);
    }
    
    @Test
    @Transactional
    @Rollback
    public void siHabiendoVariasMascotasPuedeTraerMasDeUna(){
        DatosMascota datosMascota = new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Largo", "Imagen");
    	Mascota mascotaNueva = new Mascota(datosMascota);
    	
        DatosMascota datosMascota2 = new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva2 = new Mascota(datosMascota2);
        
        DatosMascota datosMascota3 = new DatosMascota("Gato", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva3 = new Mascota(datosMascota3);

        session().save(mascotaNueva);
        session().save(mascotaNueva2);
        session().save(mascotaNueva3);

        DatosMascota mascotaBuscada = new DatosMascota("Perro", "", "", "", "", "", "");
        
        List<Mascota> mascotas =repositorioMascota.buscarGeneral(
        		mascotaBuscada.getEspecie(),
        		mascotaBuscada.getDireccion(),
        		mascotaBuscada.getDescripcion(),
        		mascotaBuscada.getRaza(),
        		mascotaBuscada.getPelaje());

        assertThat(mascotas.size()).isEqualTo(2);
    }
    
    @Test
    @Transactional
    @Rollback
    public void siHabiendoVariasMascotasPuedeTraerSoloUnaPoniendoMasDeUnValorEnElFormulario(){
        DatosMascota datosMascota = new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Largo", "Imagen");
    	Mascota mascotaNueva = new Mascota(datosMascota);
    	
        DatosMascota datosMascota2 = new DatosMascota("Perro", "Direccion", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva2 = new Mascota(datosMascota2);
        
        DatosMascota datosMascota3 = new DatosMascota("Perro", "NoDirec", "Pepe", "Descripcion", "Raza", "Corto", "Imagen");
        Mascota mascotaNueva3 = new Mascota(datosMascota3);

        session().save(mascotaNueva);
        session().save(mascotaNueva2);
        session().save(mascotaNueva3);

        DatosMascota mascotaBuscada = new DatosMascota("Perro", "Direccion", "", "", "", "", "");
        
        List<Mascota> mascotas =repositorioMascota.buscarGeneral(
        		mascotaBuscada.getEspecie(),
        		mascotaBuscada.getDireccion(),
        		mascotaBuscada.getDescripcion(),
        		mascotaBuscada.getRaza(),
        		mascotaBuscada.getPelaje());

        assertThat(mascotas.size()).isEqualTo(2);
    }
}