package com.swaaad.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.AsistenciaDao;
import com.swaaad.model.Asistencia;

public class AsistenciaDaoImpl implements AsistenciaDao {

	private SessionFactory sessionFactory;
	Session sSession = null;
	Transaction tTransaction = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addAsistencia(Asistencia asistencia) throws Exception {

		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(asistencia);
		tTransaction.commit();
		sSession.close();
	}

	@Override
	public void upddateAsistencia(Asistencia asistencia) throws Exception {

		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(asistencia);
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
