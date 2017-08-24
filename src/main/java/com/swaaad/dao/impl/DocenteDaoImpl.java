package com.swaaad.dao.impl;

import org.hibernate.Query;
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
		tTransaction = sSession.beginTransaction();
		sSession.persist(docente);
		tTransaction.commit();
		sSession.close();
	}

	@Override
	public void updateDocente(Docente docente) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(docente);
			tTransaction.commit();
			System.out.println("se actualizo docente");
		} catch (Exception e) {
			if (tTransaction != null) {
				tTransaction.rollback();
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}
	}

	@Override
	public Docente getDocenteById(int idDocente) throws Exception {
		// TODO Auto-generated method stub
		sSession = sessionFactory.openSession();
		Docente docente = null;// creo una variable de tipo docente con valores
								// nulos
		try {

			String queryDocente = "From Docente where ID_DOCENTE=:idDocente ";
			Query query = sSession.createQuery(queryDocente);
			query.setInteger("idDocente", idDocente);
			docente = (Docente) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}

		return docente;
	}

}
