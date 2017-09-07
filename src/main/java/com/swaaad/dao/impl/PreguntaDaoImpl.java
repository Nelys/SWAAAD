package com.swaaad.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.PreguntaDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Pregunta;

public class PreguntaDaoImpl implements PreguntaDao {
	/* implementa la interface PreguntaDao */
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
	public void addPregunta(Pregunta pregunta) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(pregunta);
		tTransaction.commit();
		sSession.close();

	}

	@Override
	public Pregunta getPreguntaById(int idPregunta) throws Exception {

		sSession = sessionFactory.openSession();
		Pregunta pregunta = null;
		try {
			String queryPregunta = "From Pregunta Where ID_PREGUNTA= :idPregunta";
			Query query = sSession.createQuery(queryPregunta);
			query.setInteger("idPregunta", idPregunta);
			pregunta = (Pregunta) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			sSession.flush();
			sSession.close();

		}
		return pregunta;
	}

	@Override
	public void updatePregunta(Pregunta pregunta) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(pregunta);
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
	public void deletePregunta(int idPregunta) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Pregunta pregunta = (Pregunta) sSession.load(Pregunta.class, new Integer(idPregunta));// obtiene
			// al
			// alumno
			sSession.delete(pregunta);// elimina al alumno
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
