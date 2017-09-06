package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.CompetenciaDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Competencia;

public class CompetenciaDaoImpl implements CompetenciaDao {
	/* implementa la interface AlumnoDAO */

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
	public void addCompetencia(Competencia competencia) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(competencia);
		tTransaction.commit();
		sSession.close();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Competencia> getAllCompetencia() throws Exception {
		sSession = sessionFactory.openSession();
		List<Competencia> listarCompetencia = sSession.createCriteria(Competencia.class).list();
		sSession.close();
		return listarCompetencia;
	}

	@Override
	public Competencia getCompetenciaById(int idCompetencia) throws Exception {
		sSession = sessionFactory.openSession();
		Competencia competencia = null;
		try {
			String queryCompetencia = "From Competencia Where ID_COMPETENCIA= :idCompetencia";
			Query query = sSession.createQuery(queryCompetencia);
			query.setInteger("idCompetencia", idCompetencia);
			competencia = (Competencia) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			sSession.flush();
			sSession.close();

		}

		return competencia;
	}

	@Override
	public void updateCompetencia(Competencia competencia) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(competencia);
			tTransaction.commit();

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
	public void deleteCompetencia(int idCompetencia) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Competencia competencia = (Competencia) sSession.load(Competencia.class, new Integer(idCompetencia));// obtiene
			// al
			// alumno
			sSession.delete(competencia);// elimina al competencia
			tTransaction.commit();// confirma la transacionc

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
		}

	}

}
