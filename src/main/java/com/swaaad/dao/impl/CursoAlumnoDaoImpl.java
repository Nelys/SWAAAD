package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.CursoAlumnoDao;
import com.swaaad.model.CursoAlumno;

public class CursoAlumnoDaoImpl implements CursoAlumnoDao {
	/* implementa la interface CursoAlumnoDao */

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
	public void addCursoAlumno(CursoAlumno cursoAlumno) throws Exception {

		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(cursoAlumno);
		tTransaction.commit();
		sSession.close();

	}

	@Override
	public CursoAlumno getCursoAlumnoById(int idCursoAlumno) throws Exception {
		sSession = sessionFactory.openSession();
		CursoAlumno cursoAlumno = null;
		try {
			String queryCursoAlumno = "From CursoAlumno Where ID_CURSO_ALUMNO= :idCursoAlumno";
			Query query = sSession.createQuery(queryCursoAlumno);
			query.setInteger("idCursoAlumno", idCursoAlumno);
			cursoAlumno = (CursoAlumno) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return cursoAlumno;
	}

	@Override
	public void updateCursoAlumno(CursoAlumno cursoAlumno) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(cursoAlumno);
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

	@SuppressWarnings("unchecked")
	@Override
	public List<CursoAlumno> getAllAlumnosByCurso(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		List<CursoAlumno> cursoAlumnos = null;
		try {
			String queryCursoAlumno = "SELECT ca FROM CursoAlumno ca JOIN ca.curso c WHERE c.idCurso=:idCurso  ";
			Query query = sSession.createQuery(queryCursoAlumno);
			query.setInteger("idCurso", idCurso);
			cursoAlumnos = (List<CursoAlumno>) query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return cursoAlumnos;
	}

}
