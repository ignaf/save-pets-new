package ar.edu.unlam.tallerweb1.repositorios.implementaciones;

import java.util.List;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
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
    public void asignarRefugio(Mascota mascota) {
        sessionFactory.getCurrentSession().update(mascota);
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

    @Override
    public void eliminar(Long id) {
        Mascota mascotaABorrar = this.buscar(id);
        sessionFactory.getCurrentSession().delete(mascotaABorrar);
    }

    @Override
    public List<Mascota> buscarMascotaPorRefugio(Long id) {
        return sessionFactory.getCurrentSession()
                .createCriteria(Mascota.class)
                .createAlias("refugio", "refugio")
                .add(Restrictions.eq("refugio.id", id))
                .list();
    }


    @Override
    public List<Mascota> buscarGeneral(String especie, String direccion, String descripcion, String raza, String pelaje) {
        return sessionFactory.getCurrentSession().createCriteria(Mascota.class)
                .add(Restrictions.like("especie", especie,MatchMode.ANYWHERE))
                .add(Restrictions.like("direccion", direccion,MatchMode.ANYWHERE))
                .add(Restrictions.like("raza", raza,MatchMode.ANYWHERE))
                .add(Restrictions.like("pelaje", pelaje,MatchMode.ANYWHERE))
                .add(Restrictions.like("descripcion", descripcion,MatchMode.ANYWHERE))
                .list();
    }

    @Override
    public List<Mascota> listarMascotasSinRefugio() {
        return sessionFactory.getCurrentSession().createQuery(
                "from Mascota where refugio=null"
        ).list();
    }


}
