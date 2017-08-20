package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.model.Alumno;

public class AlumnosDaoImpl implements AlumnosDao {

	private SessionFactory sessionFactory;

	Session session = null;
	Transaction transaction = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addAlumno(Alumno alumno) throws Exception {

		Session sesion = this.sessionFactory.openSession();
		Transaction trans = sesion.beginTransaction();
		sesion.persist(alumno);
		trans.commit();
		sesion.close();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Alumno> getAllAlumnos() throws Exception {
		session = sessionFactory.openSession();
		List<Alumno> listarAlumnos = session.createCriteria(Alumno.class).list();
		session.close();
		return listarAlumnos;

	}

	@Override
	public Alumno getAlumnoById(int idAlumno) throws Exception {
		session = sessionFactory.openSession();
		Alumno alumno = null;
		try {
			String queryAlumno = "From Alumno Where ID_ALUMNO= :idAlumno";
			Query query = session.createQuery(queryAlumno);
			query.setInteger("idAlumno", idAlumno);
			alumno = (Alumno) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			session.flush();
			session.close();

		}

		return alumno;
	}

	@Override
	public void updateAlumno(Alumno alumno) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		try {
			transaction = session.beginTransaction();
			session.update(alumno);
			transaction.commit();
			System.out.println("se actualizo");
		} catch (RuntimeException e) {

			if (transaction != null) {// verifica hubosi un cambio en caso
				transaction.rollback();// desase e

			}
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}

	}

	@Override
	public void deleteAlumno(int idAlumno) throws Exception {
		session = sessionFactory.openSession();// crea sesion con la base de
												// datos

		try {
			transaction = session.beginTransaction();// habilita a la session
														// para hacer
			// una transaccion en este
			// casoeliminar
			Alumno alumno = (Alumno) session.load(Alumno.class, new Integer(idAlumno));// obtiene
																						// al
																						// alumno
			session.delete(alumno);// elimina al alumno
			transaction.commit();// confirma la transacion

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (transaction != null) {// verifica hubosi un cambio en caso
				transaction.rollback();// desase e
			}
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();// ciera la sesion
		}

	}

}
