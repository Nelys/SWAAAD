package com.swaaad.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.dao.UnidadDao;
import com.swaaad.model.Unidad;

/**
 * 
 * @author Nelys
 * @version 1.0.0, 01/09/2017
 * @see AlumnosDao
 * 
 */
public class UnidadDaoImpl implements UnidadDao {
	/* implementa la interface UnidadDao */

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

	/**
	 * @see UnidadDao#addUnidad(Unidad)
	 */
	@Override
	public void addUnidad(Unidad unidad) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.persist(unidad);
			tTransaction.commit();
			sSession.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see UnidadDao#getUnidadById(int)
	 */
	@Override
	public Unidad getUnidadById(int idUnidad) throws Exception {
		sSession = sessionFactory.openSession();
		Unidad unidad = null;
		try {
			String queryUnidad = "From Unidad Where ID_UNIDAD= :idUnidad";
			Query query = sSession.createQuery(queryUnidad);
			query.setInteger("idUnidad", idUnidad);
			unidad = (Unidad) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}

		return unidad;
	}

	/**
	 * @see UnidadDao#updateUnidad(Unidad)
	 */
	@Override
	public void updateUnidad(Unidad unidad) throws Exception {
		// TODO Auto-generated method stub
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(unidad);
			tTransaction.commit();
		} catch (RuntimeException e) {
			if (tTransaction != null) {
				tTransaction.rollback();
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}
	}

	/**
	 * @see UnidadDao#deleteUnidad(int)
	 */
	@Override
	public void deleteUnidad(int idUnidad) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			Unidad unidad = (Unidad) sSession.load(Unidad.class, new Integer(idUnidad));
			sSession.delete(unidad);
			tTransaction.commit();
		} catch (RuntimeException e) {
			if (tTransaction != null) {
				tTransaction.rollback();
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}
	}

}
