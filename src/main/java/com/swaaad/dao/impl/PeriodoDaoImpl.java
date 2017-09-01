package com.swaaad.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.DocenteDao;
import com.swaaad.dao.PeriodoDao;
import com.swaaad.model.Periodo;

public class PeriodoDaoImpl implements PeriodoDao {
	/* implementa la interface PeriodoDAO */

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
	 * @see PeriodoDao#addPeriodo(Periodo)
	 */
	@Override
	public void addPeriodo(Periodo periodo) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(periodo);
		sSession.close();
	}

	/**
	 * @see PeriodoDao#getPeriodoById(int)
	 */
	@Override
	public Periodo getPeriodoById(int idPeriodo) throws Exception {
		sSession = sessionFactory.openSession();
		Periodo periodo = null;
		try {
			String queryPeriodo = "From Periodo Where ID_PERIODO=:idPeriodo";
			Query query = sSession.createQuery(queryPeriodo);
			query.setInteger("idPeriodo", idPeriodo);
			periodo = (Periodo) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}
		return periodo;
	}

	/**
	 * @see PeriodoDao#updatePeriodo(Periodo)
	 */
	@Override
	public void updatePeriodo(Periodo periodo) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(periodo);
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
	 * @see PeriodoDao#deletePeriodo(int)
	 */
	@Override
	public void deletePeriodo(int idPeriodo) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			Periodo periodo = (Periodo) sSession.load(Periodo.class, new Integer(idPeriodo));
			sSession.delete(periodo);
			tTransaction.commit();
		} catch (RuntimeException e) {
			if (tTransaction!=null) {
				tTransaction.rollback();
			}
			e.printStackTrace();
		}finally{
			sSession.flush();
			sSession.close();
		}
	}

}
