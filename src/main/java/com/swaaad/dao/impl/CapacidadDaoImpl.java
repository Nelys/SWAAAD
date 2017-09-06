package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.CapacidadDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Capacidad;

public class CapacidadDaoImpl implements CapacidadDao {
	/* implementa la interface CapacidadDao */

	/**
	 * se encarga de crear la session con la base de datos
	 */
	private SessionFactory sessionFactory;

	/**
	 * almacenara la session con la base de datos
	 */
	Session sSession = null;

	/**
	 * Permite la transacciones con la base de datos
	 */
	Transaction tTransaction = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCapacidad(Capacidad capacidad) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.persist(capacidad);
			tTransaction.commit();
			sSession.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Capacidad> getAllCapacidad() throws Exception {
		sSession = sessionFactory.openSession();
		List<Capacidad> listarCapacidad = sSession.createCriteria(Capacidad.class).list();
		sSession.close();
		return listarCapacidad;
	}

	@Override
	public Capacidad getCapacidadById(int idCapacidad) throws Exception {
		sSession = sessionFactory.openSession();
		Capacidad capacidad = null;
		try {
			String queryCapacidad = "From Capacidad Where ID_CAPACIDAD= :idCapacidad";
			Query query = sSession.createQuery(queryCapacidad);
			query.setInteger("idCapacidad", idCapacidad);
			capacidad = (Capacidad) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			sSession.flush();
			sSession.close();

		}
		return capacidad;
	}

	@Override
	public void updateCapacidad(Capacidad capacidad) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(capacidad);
			tTransaction.commit();
			System.out.println("se actualizo");
		} catch (RuntimeException e) {

			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e

			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}

	}

	@Override
	public void deleteCapacidad(int idCapacidad) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Capacidad capacidad = (Capacidad) sSession.load(Capacidad.class, new Integer(idCapacidad));// obtiene
			// al
			// alumno
			sSession.delete(capacidad);// elimina al alumno
			tTransaction.commit();// confirma la transacionc

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
		}

	}

}
