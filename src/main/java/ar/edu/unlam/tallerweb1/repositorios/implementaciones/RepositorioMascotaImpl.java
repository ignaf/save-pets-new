package ar.edu.unlam.tallerweb1.repositorios.implementaciones;

import java.util.List;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Mascota;

import javax.transaction.Transactional;

@Transactional
@Repository("repositorioMascota")
public class RepositorioMascotaImpl implements RepositorioMascota {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioMascotaImpl(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void guardar(Mascota mascota) {
        sessionFactory.getCurrentSession().save(mascota);
    }

    @Override
    public Mascota buscar(Long id) {
        return(Mascota) sessionFactory.getCurrentSession().createCriteria(Mascota.class)
                .add(Restrictions.eq("id", id))
                .uniqueResult();
    }

    @Override
    public List<Mascota> buscarNombre(String nombre) {
        return sessionFactory.getCurrentSession().createCriteria(Mascota.class)
                .add(Restrictions.eq("nombre", nombre))
                .list();
    }

    @Override
    public List<Mascota> buscarTodos() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Mascota.class)
                .list();
    }
}
