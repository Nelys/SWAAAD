package com.swaaad.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.dao.HorarioDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Horario;

/**
 * 
 * @author Nelys
 * @version 1.0.0, 06/09/2017
 * @see HorarioDao
 * 
 */
public class HorarioDaoImpl implements HorarioDao {
	/* implementa la interface HorarioDao */

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
	public void addHorario(Horario horario) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(horario);
		tTransaction.commit();
		sSession.close();

	}

	@Override
	public Horario getHorarioById(int idHorario) throws Exception {
		sSession = sessionFactory.openSession();
		Horario horario = null;
		try {
			String queryHorario = "From Horario Where ID_HORARIO= :idHorario";
			Query query = sSession.createQuery(queryHorario);
			query.setInteger("idHorario", idHorario);
			horario = (Horario) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			sSession.flush();
			sSession.close();

		}

		return horario;
	}

	@Override
	public void updateHorario(Horario horario) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(horario);
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
	public void deleteHorario(int idHorario) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Horario horario = (Horario) sSession.load(Horario.class, new Integer(idHorario));// obtiene
			// al
			// alumno
			sSession.delete(horario);// elimina al alumno
			tTransaction.commit();// confirma la transacionc

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
			}
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
		}

	}

}
