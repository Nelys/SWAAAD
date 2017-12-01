package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.ActividadPedagogicaDao;
import com.swaaad.model.ActividadPedagogica;

public class ActividadPedagogicaDaoImpl implements ActividadPedagogicaDao {
	
	private SessionFactory sessionFactory;
	Session sSesion = null;
	Transaction tTransaction = null;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addActividad(ActividadPedagogica pedagogica) throws Exception {
		sSesion = sessionFactory.openSession();
		tTransaction = sSesion.beginTransaction();
		sSesion.persist(pedagogica);
		tTransaction.commit();
		sSesion.close();
	}

	@Override
	public ActividadPedagogica getActividadById(int idActividad) throws Exception {
		sSesion = sessionFactory.openSession();
		ActividadPedagogica actividad = null;

		try {

			String queryActividad = "SELECT ap FROM ActividadPedagogica ap WHERE ap.idActividad =:idActividad ";
			Query query = sSesion.createQuery(queryActividad);
			query.setInteger("idActividad", idActividad);
			actividad = (ActividadPedagogica) query.uniqueResult();

			System.out.println("Actividad"+ actividad.getDescripcion());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSesion.flush();
			sSesion.close();
		}
		return actividad;
	}

	@Override
	public void updateActividad(ActividadPedagogica actividad) throws Exception {
		sSesion = sessionFactory.openSession();
		try {
			tTransaction = sSesion.beginTransaction();
			sSesion.update(actividad);
			tTransaction.commit();
			System.out.println("se actualizo docente");
		} catch (Exception e) {
			if (tTransaction != null) {
				tTransaction.rollback();
			}
			e.printStackTrace();
		} finally {
			sSesion.flush();
			sSesion.close();
		}
	}

	@Override
	public void deleteActividad(int idActividad) throws Exception {
		sSesion = sessionFactory.openSession();
		try {
			tTransaction = sSesion.beginTransaction();
			ActividadPedagogica actividad = (ActividadPedagogica) sSesion.load(ActividadPedagogica.class,
					new Integer(idActividad));

			sSesion.delete(actividad);
			tTransaction.commit();

		} catch (Exception e) {
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
			}
			e.printStackTrace();
		} finally {
			sSesion.flush();
			sSesion.close();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ActividadPedagogica> getAllActividad() throws Exception {
		sSesion = sessionFactory.openSession();

		List<ActividadPedagogica> listaActividades = sSesion.createCriteria(ActividadPedagogica.class).list();
		sSesion.close();
		return listaActividades;
	}

}
