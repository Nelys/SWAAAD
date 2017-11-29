package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.dao.CursoDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Curso;

/**
 * 
 * @author Nelys
 * @version 1.0.0, 06/09/2017
 * @see AlumnosDao
 * 
 */

public class CursoDaoImpl implements CursoDao {
	/* implementa la interface CursoDao */

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
	public void addCurso(Curso curso) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(curso);
		tTransaction.commit();
		sSession.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Curso> getAllCurso() throws Exception {
		sSession = sessionFactory.openSession();
		List<Curso> listarCursos = sSession.createCriteria(Curso.class).list();
		sSession.close();
		return listarCursos;
	}

	@Override
	public Curso getCursoById(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		Curso curso = null;
		try {
			String queryCurso = "From Curso Where ID_CURSO= :idCurso";
			Query query = sSession.createQuery(queryCurso);
			query.setInteger("idCurso", idCurso);
			curso = (Curso) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}

		return curso;
	}

	@Override
	public void updateCurso(Curso curso) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(curso);
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
	public void deleteCurso(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Curso curso = (Curso) sSession.load(Curso.class, new Integer(idCurso));// obtiene
			// al
			// alumno
			sSession.delete(curso);// elimina al alumno
			tTransaction.commit();// confirma la transacion

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {
				// verifica hubosi un cambio en caso
				tTransaction.rollback();
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Curso> listCursoByDocente(int idDocente) throws Exception {
		
		sSession = sessionFactory.openSession();
		List<Curso> listarcurso = null;
		try {
			String queryCurso = "SELECT c FROM Curso c WHERE c.docente.idDocente=:idDocente";
			Query query = sSession.createQuery(queryCurso);
			query.setInteger("idDocente", idDocente);
			listarcurso=(List<Curso>) query.list();
			
			for (Curso objeto : listarcurso) {
//				
				 System.out.println(objeto.getNombreCurso());
//				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}
		return listarcurso;
	}

}
