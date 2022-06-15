package ar.edu.unlam.tallerweb1.repositorios.implementaciones;

import java.util.List;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioRefugio;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Mascota;
import ar.edu.unlam.tallerweb1.modelo.Refugio;

@Repository("repositorioRefugio")
public class RepositorioRefugioImpl implements RepositorioRefugio {

	private SessionFactory sessionFactory;

    @Autowired
	public RepositorioRefugioImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
    
    @Override
	public void guardar(Refugio refugio) {
		sessionFactory.getCurrentSession().save(refugio);
	}
    
    @Override
	public void eliminar(Long id) {
    	Refugio refugioABorrar = this.buscar(id);
		sessionFactory.getCurrentSession().delete(refugioABorrar);
	}
    
    @Override
	public void modificar(Refugio refugio) {
		sessionFactory.getCurrentSession().update(refugio);
	}


	@Override
	public Refugio buscar(Long id) {
		return (Refugio) sessionFactory.getCurrentSession().createCriteria(Refugio.class)
				.add(Restrictions.eq("id", id))
				.uniqueResult();
	}

	@Override
	public Refugio buscarNombre(String nombre) {
		return (Refugio) sessionFactory.getCurrentSession().createCriteria(Refugio.class)
				.add(Restrictions.eq("nombre", nombre))
				.uniqueResult();
	}

	@Override
	public Refugio buscarCoordenadas(String coordenadas) {
		return (Refugio) sessionFactory.getCurrentSession().createCriteria(Refugio.class)
				.add(Restrictions.eq("coordenadas", coordenadas))
				.uniqueResult();
	}

	@Override
    public List<Refugio> buscarTodos() {
        return sessionFactory.getCurrentSession()
                .createCriteria(Refugio.class)
                .list();
    }
	
    @Override
    public List<Refugio> buscarGeneral(String nombre) {
    return sessionFactory.getCurrentSession().createCriteria(Refugio.class)
    	    .add(Restrictions.disjunction()
    	            .add(Restrictions.like("nombre", nombre,MatchMode.ANYWHERE))
    	            .add(Restrictions.like("direccion", nombre,MatchMode.ANYWHERE))
    	            .add(Restrictions.like("coordenadas", nombre,MatchMode.ANYWHERE))
    	            .add(Restrictions.like("numeroTelefono", nombre,MatchMode.ANYWHERE))
    	        )
    	    .list();
    }
    
	@Override
	public Refugio buscarPorId(Long id) {
		return (Refugio) sessionFactory.getCurrentSession().createCriteria(Refugio.class)
				.add(Restrictions.eq("id", id))
				.uniqueResult();
	}
}
