package com.swaaad.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.AsistenciaDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;

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

	@SuppressWarnings("unchecked")
	@Override
	public List<Asistencia> getAllAlumnosByCursoMes(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		List<Asistencia> listaAsistencia = null;
		try {
			String queryAsistencia = "SELECT a FROM Asistencia a JOIN a.cursoAlumno ca WHERE ca.curso.idCurso=:idCurso";
			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			listaAsistencia =(List<Asistencia>) query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return listaAsistencia;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> asistenciaMes(int Mes, int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		List<Integer> diasMes = null;
		try {
			String queryAsistencia = "SELECT  day(a.fecha) FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=:idCurso AND month(a.fecha)=:Mes GROUP BY day(a.fecha)";
			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			query.setInteger("Mes", Mes);
			diasMes =(List<Integer>) query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return diasMes;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Date> getDayOfAlumnosByCurso(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		List<Date> listarDiaPorMes = null;
		try {
//			String queryAsistencia = "SELECT a FROM Asistencia a JOIN a.cursoAlumno ca WHERE ca.curso.idCurso=:idCurso";
			String queryAsistencia = "SELECT  day(a.fecha) FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=:idCurso GROUP BY day(a.fecha)";
//			SELECT  day(a.fecha) FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=1 AND month(a.fecha)=10 GROUP BY day(a.fecha)
			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			listarDiaPorMes =(List<Date>) query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return listarDiaPorMes;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Asistencia> getEstadoByAlumnoCurso(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		List<Asistencia> listarDiaPorMes = null;
		try {
//			
			String queryAsistencia = "SELECT a FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=:idCurso";			
			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			listarDiaPorMes =(List<Asistencia>) query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return listarDiaPorMes;
	}



}
