package com.swaaad.dao.impl;


import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.dao.AsistenciaDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;

public class AsistenciaDaoImpl implements AsistenciaDao {
    private static final Logger logger = LoggerFactory.getLogger(AsistenciaDaoImpl.class);
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
	public List<Integer> getDayOfAlumnosByCurso(int idCurso, int mes) throws Exception {
		sSession = sessionFactory.openSession();
		List<Integer> listarDiaPorMes = null;
		try {
//			String queryAsistencia = "SELECT a FROM Asistencia a JOIN a.cursoAlumno ca WHERE ca.curso.idCurso=:idCurso";
			String queryAsistencia = "SELECT  day(a.fecha) FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=:idCurso AND month(a.fecha)=:mes GROUP BY day(a.fecha)";
//			SELECT  day(a.fecha) FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=1 AND month(a.fecha)=10 GROUP BY day(a.fecha)
			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			query.setInteger("mes", mes);
			listarDiaPorMes =(List<Integer>) query.list();

			for (Integer objeto : listarDiaPorMes) {
//				System.out.println(objeto);
				 System.out.println(objeto);
//				System.out.println(objeto);
			}
			
			
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
	public List<Asistencia> getEstadoByAlumnoCurso(int idCurso, int mes) throws Exception {
		sSession = sessionFactory.openSession();
		List<Asistencia> listarDiaPorMes = null;
		try {
//			
			String queryAsistencia = "SELECT a FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=:idCurso AND month(a.fecha)=:mes";		
			// GROUP BY day(a.fecha)
			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			query.setInteger("mes", mes);
			listarDiaPorMes =(List<Asistencia>) query.list();
			
			for (Asistencia objeto : listarDiaPorMes) {
//				System.out.println(objeto);
				 System.out.println(objeto.getFecha() +" - "+objeto.getEstado());
//				System.out.println(objeto);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return listarDiaPorMes;
	}

	@Override
	public List<Asistencia> getByDay(int idCurso, Date fecha) {
		sSession = sessionFactory.openSession();
		List<Asistencia> listarDiaPorMes = null;
		try {
//			
			String queryAsistencia = "SELECT a FROM Asistencia a JOIN a.cursoAlumno ca where ca.curso.idCurso=:idCurso AND a.fecha=:mes";		

			Query query = sSession.createQuery(queryAsistencia);
			query.setInteger("idCurso", idCurso);
			query.setDate("mes", fecha);
			listarDiaPorMes =(List<Asistencia>) query.list();
			
			for (Asistencia objeto : listarDiaPorMes) {
//				System.out.println(objeto);
				 System.out.println(objeto.getFecha() +" - "+objeto.getEstado());
//				System.out.println(objeto);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}
		return listarDiaPorMes;
	}

	@Override
	public Asistencia getById(int idAsistencia) throws Exception {
		sSession = sessionFactory.openSession();
		Asistencia asistencia = null;
		try {
			String queryAlumno = "From Asistencia Where ID_ASISTENCIA= :idAsistencia";
			Query query = sSession.createQuery(queryAlumno);
			query.setInteger("idAsistencia", idAsistencia);
			asistencia = (Asistencia) query.uniqueResult();

		} catch (Exception e) {
		    logger.info("AsistenciaDaoImpl getAlumnoById: ", e);
		} finally {
			sSession.flush();
			sSession.close();

		}

		return asistencia;
	}



}
