package com.swaaad.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.DocenteDao;
import com.swaaad.model.Docente;

public class DocenteDaoImpl implements DocenteDao {
	private SessionFactory sessionFactory;
	Session sSession = null;
	Transaction tTransaction = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addDocente(Docente docente) throws Exception {
		sSession = sessionFactory.openSession();
		tTransaction=sSession.beginTransaction();
		sSession.persist(docente);
		tTransaction.commit();
		sSession.close();
	}

	@Override
	public void updateDocente(Docente docente) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void getDocenteById(int idAlumno) throws Exception {
		// TODO Auto-generated method stub

	}

}
