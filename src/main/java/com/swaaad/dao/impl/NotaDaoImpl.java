package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.NotaDao;
import com.swaaad.model.Nota;

public class NotaDaoImpl implements NotaDao {
	/* implementa la interface NotaDao */

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
	public void addNota(Nota nota) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(nota);
		tTransaction.commit();
		sSession.close();
	}

	@Override
	public Nota getNotaById(int idNota) throws Exception {
		sSession = sessionFactory.openSession();
		Nota nota = null;
		try {
			String queryNota = "From Nota Where ID_NOTA= :idNota";
			Query query = sSession.createQuery(queryNota);
			query.setInteger("idNota", idNota);
			nota = (Nota) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}

		return nota;
	}

	@Override
	public void updateNota(Nota nota) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(nota);
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
	public void deleteNota(int idNota) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Nota nota = (Nota) sSession.load(Nota.class, new Integer(idNota));// obtiene
			// al
			// alumno
			sSession.delete(nota);// elimina al alumno
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Nota> getAllNotas() throws Exception {
		@SuppressWarnings("unchecked")
		List<Nota> listarNota = sSession.createCriteria(Nota.class).list();
		sSession.close();
		return listarNota;
	}

}
