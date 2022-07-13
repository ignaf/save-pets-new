package ar.edu.unlam.tallerweb1.repositorios;
import ar.edu.unlam.tallerweb1.SpringTest;
import ar.edu.unlam.tallerweb1.controladores.dtos.DatosMascota;
import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class RepositorioMascotaTest extends SpringTest {

    @Autowired
    private RepositorioMascota respositorioMascota;

    @Test
    @Transactional
    @Rollback
    public void asignarRefugioTest(){
        //given tengo una mascota ya guardada y luego le seteo un refugio
        DatosMascota datosMascota = new DatosMascota("perro","Curupayti 1320, Moron, Buenos Aires", "NombreT","lorem ipsum","idk","largo","img");
        Mascota mascota = new Mascota(datosMascota);
        mascota.setId((long) 1);
        session().save(mascota);
        Refugio refugio = new Refugio();
        refugio.setId((long) 1);
        mascota.setRefugio(refugio);


        //when llamo a asignar refugio
        respositorioMascota.asignarRefugio(mascota);

        //then se realiza el update
        Mascota mascota1 = (Mascota) session().createCriteria(Mascota.class)
                .createAlias("refugio","refugio")
                .add(Restrictions.eq("refugio.id",1))
                .uniqueResult();
        assertNotNull(mascota1);

    }

}
