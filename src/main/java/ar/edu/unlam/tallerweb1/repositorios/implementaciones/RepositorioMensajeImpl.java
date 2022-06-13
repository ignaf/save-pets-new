package ar.edu.unlam.tallerweb1.repositorios.implementaciones;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Mensaje;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioMensaje;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Transactional
@Repository("repositorioMensaje")
public class RepositorioMensajeImpl implements RepositorioMensaje {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioMensajeImpl(SessionFactory sessionFactory){
        this.sessionFactory=sessionFactory;
    }

    @Override
    public Mensaje buscar(Long id) {
        return(Mensaje) sessionFactory.getCurrentSession().createCriteria(Mensaje.class)
                .add(Restrictions.eq("id", id))
                .uniqueResult();
    }

    @Override
    public void asignarUsuarios(Mensaje mensaje) {
        sessionFactory.getCurrentSession().update(mensaje);
    }

    @Override
    public void guardar(Mensaje mensaje) {
        sessionFactory.getCurrentSession().save(mensaje);
    }
}