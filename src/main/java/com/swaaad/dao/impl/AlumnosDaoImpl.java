package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.model.Alumno;


/**
 * 
 * @author Nelys
 * @version 1.0.0, 20/08/2017
 * @see AlumnosDao
 * @Creacion
 * *********************************
 * @author Christian Vilca
 * @version 2.0.0, 20/08/2017
 * @see AlumnosDao
 * @Modificacion: Se a�adieron metodos de consulta
 */
public class AlumnosDaoImpl implements AlumnosDao {
    
    private static final Logger logger = LoggerFactory.getLogger(AlumnosDaoImpl.class);

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

	/**
	 * @see AlumnosDao#addAlumno(Alumno)
	 */
	@Override
	public void addAlumno(Alumno alumno) throws Exception {

		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(alumno);
		tTransaction.commit();
		sSession.close();

	}

	/**
	 * @see AlumnosDao#getAllAlumnos()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Alumno> getAllAlumnos() throws Exception {
		sSession = sessionFactory.openSession();
		List<Alumno> listarAlumnos = sSession.createCriteria(Alumno.class).list();
		sSession.close();
		return listarAlumnos;
	}

	/**
	 * @see AlumnosDao#getAllAlumnosByIdCurso()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Alumno> getAllAlumnosByIdCurso(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		List<Alumno> listarAlumnos =null;
		try {
		    String queryAlumno = "SELECT ca.alumno FROM CursoAlumno ca JOIN ca.curso c WHERE c.idCurso = :id";
			Query query = sSession.createQuery(queryAlumno);
			query.setInteger("id", idCurso);
			listarAlumnos = (List<Alumno>) query.list();
		} catch (Exception e) {
		    logger.info("AlumnosDaoimpl getAllAlumnosByIdCurso: ", e);
		} finally {
			sSession.flush();
			sSession.close();
		}
		return listarAlumnos;
	}
	
	/**
	 * @see AlumnosDao#getAlumnoById(int)
	 */
	@Override
	public Alumno getAlumnoById(int idAlumno) throws Exception {
		sSession = sessionFactory.openSession();
		Alumno alumno = null;
		try {
			String queryAlumno = "From Alumno Where ID_ALUMNO= :idAlumno";
			Query query = sSession.createQuery(queryAlumno);
			query.setInteger("idAlumno", idAlumno);
			alumno = (Alumno) query.uniqueResult();

		} catch (Exception e) {
		    logger.info("AlumnosDaoimpl getAlumnoById: ", e);
		} finally {
			sSession.flush();
			sSession.close();

		}

		return alumno;
	}

	/**
	 * @see AlumnosDao#getAlumnoByCorreo(String)
	 */
	@Override
	public List<Alumno> getAllAlumnosByCorreo(String correo) throws Exception {
		sSession = sessionFactory.openSession();
		List<Alumno> listarAlumnos =null;
		try {
			String queryAlumno = "SELECT a FROM Alumno a WHERE a.email = :correo";
			Query query = sSession.createQuery(queryAlumno);
			query.setString("correo", correo);
			listarAlumnos = (List<Alumno>) query.list();
		} catch (Exception e) {
		    logger.info("AlumnosDaoimpl getAlumnoById: ", e);
		} finally {
			sSession.flush();
			sSession.close();

		}

		return listarAlumnos;
	}

	/**
	 * @see AlumnosDao#updateAlumno(Alumno)
	 */
	@Override
	public void updateAlumno(Alumno alumno) throws Exception {

		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(alumno);
			tTransaction.commit();
			logger.info("se actualizo");
		} catch (RuntimeException e) {

			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e

			}
			logger.info("AlumnosDaoimpl updateAlumno: ", e);
		} finally {
			sSession.flush();
			sSession.close();
		}

	}

	/**
	 * @see AlumnosDao#deleteAlumno(int)
	 */
	@Override
	public void deleteAlumno(int idAlumno) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
												// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
														// para hacer
			// una transaccion en este
			// casoeliminar
			Alumno alumno = (Alumno) sSession.load(Alumno.class, Integer.valueOf(idAlumno));// obtiene alumno
			sSession.delete(alumno);// elimina al alumno
			tTransaction.commit();// confirma la transacion

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
				System.out.println("No se pudo eliminar al alumno");
			}
			e.printStackTrace();
			logger.info("AlumnosDaoimpl deleteAlumno: ", e);
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
		}

	}



}
