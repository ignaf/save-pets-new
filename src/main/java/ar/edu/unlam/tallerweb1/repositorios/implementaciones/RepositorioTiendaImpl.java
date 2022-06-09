package ar.edu.unlam.tallerweb1.repositorios.implementaciones;

import java.util.List;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioMascota;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioTienda;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Producto;

import javax.transaction.Transactional;

@Transactional
@Repository("repositorioTienda")
public class RepositorioTiendaImpl implements RepositorioTienda {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioTiendaImpl(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void guardar(Producto producto) {
        sessionFactory.getCurrentSession().save(producto);
    }

    @Override
    public Producto buscar(Long id) {
        return(Producto) sessionFactory.getCurrentSession().createCriteria(Producto.class)
                .add(Restrictions.eq("id", id))
                .uniqueResult();
    }

    @Override
    public List<Producto> buscarNombre(String nombre) {
        return sessionFactory.getCurrentSession().createCriteria(Producto.class)
                .add(Restrictions.eq("nombre", nombre))
                .list();
    }

    
    @Override
    public List<Producto> buscarGeneral(String nombre) {
    return sessionFactory.getCurrentSession().createCriteria(Producto.class)
    	    .add(Restrictions.disjunction()
    	            .add(Restrictions.like("nombre", nombre,MatchMode.ANYWHERE))
    	            .add(Restrictions.like("animales", nombre,MatchMode.ANYWHERE))
    	            .add(Restrictions.like("descripcion", nombre,MatchMode.ANYWHERE))
    	        )
    	    .list();

    }
    
    @Override
    public List<Producto> buscarTodos() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Producto.class)
                .list();
    }
}
