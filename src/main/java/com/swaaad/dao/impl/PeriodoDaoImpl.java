package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.dao.PeriodoDao;
import com.swaaad.dao.PeriodoDao;
import com.swaaad.model.Nota;
import com.swaaad.model.Periodo;

/**
 * 
 * @author Christian
 * @version 1.0.0, 06/09/2017
 * @see PeriodoDao
 * 
 */
public class PeriodoDaoImpl implements PeriodoDao {

	private static final Logger logger = LoggerFactory.getLogger(Nota.class);
	
	/* implementa la interface PeriodoDao */

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
	public void addPeriodo(Periodo Periodo) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(Periodo);
		tTransaction.commit();
		sSession.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Periodo> getAllPeriodo() throws Exception {
		sSession = sessionFactory.openSession();
		List<Periodo> listarPeriodos = sSession.createCriteria(Periodo.class).list();
		sSession.close();
		return listarPeriodos;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Periodo> getAllPeriodoByIdCurso(int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
        List<Periodo> listarPeriodos =null;
        try {
            String queryNota = "SELECT p FROM Periodo p JOIN p.curso c WHERE c.idCurso = :id";
            
            Query query = sSession.createQuery(queryNota);
            query.setInteger("id", idCurso);
            
            listarPeriodos = (List<Periodo>) query.list();

        } catch (Exception e) {
            logger.info("Metodo getAllPeriodoByIdCurso: ", e);
        } finally {
            sSession.flush();
            sSession.close();
        }
        return listarPeriodos;
	}

	@Override
	public Periodo getPeriodoById(int idPeriodo) throws Exception {
		sSession = sessionFactory.openSession();
		Periodo Periodo = null;
		try {
			String queryPeriodo = "From Periodo Where ID_Periodo= :idPeriodo";
			Query query = sSession.createQuery(queryPeriodo);
			query.setInteger("idPeriodo", idPeriodo);
			Periodo = (Periodo) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}

		return Periodo;
	}

	@Override
	public void updatePeriodo(Periodo Periodo) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(Periodo);
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
	public void deletePeriodo(int idPeriodo) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Periodo Periodo = (Periodo) sSession.load(Periodo.class, new Integer(idPeriodo));// obtiene
			// al
			// alumno
			sSession.delete(Periodo);// elimina al alumno
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
	public List<Periodo> listPeriodoByCurso(int idCurso) throws Exception {
		
		sSession = sessionFactory.openSession();
		List<Periodo> listarPeriodo = null;
		try {
			String queryPeriodo = "SELECT c FROM Periodo c WHERE c.curso.idCurso=:idCurso";
			Query query = sSession.createQuery(queryPeriodo);
			query.setInteger("idCurso", idCurso);
			listarPeriodo=(List<Periodo>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();
		}
		return listarPeriodo;
	}
	
	@Override
	public Periodo getPeriodoByNumeroByIdCurso(int numero, int idCurso) throws Exception {
		sSession = sessionFactory.openSession();
		Periodo Periodo = null;
		try {
			String queryPeriodo = "SELECT p FROM Periodo p Where p.curso.idCurso = :idCurso AND p.numeroPeriodos = :numero";
			Query query = sSession.createQuery(queryPeriodo);
			query.setInteger("idCurso", idCurso);
			query.setInteger("numero", numero);
			Periodo = (Periodo) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sSession.flush();
			sSession.close();

		}

		return Periodo;
	}
}
