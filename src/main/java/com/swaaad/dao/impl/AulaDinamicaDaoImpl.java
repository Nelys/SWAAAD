package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.controller.AlumnoController;
import com.swaaad.dao.AulaDinamicaDao;
import com.swaaad.model.AulaDinamica;

/**
 * 
 * @author Christian
 * @version 1.0.0, 06/09/2017
 * @see AulaDinamicaDao
 * 
 */
public class AulaDinamicaDaoImpl implements AulaDinamicaDao {
	private static final Logger logger = LoggerFactory.getLogger(AulaDinamicaDaoImpl.class);
	/* implementa la interface AulaDinamicaDao */

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
	 * @see AulaDinamicaDao#addAulaDinamica(AulaDinamica)
	 */

	@Override
	public void addAulaDinamica(AulaDinamica aulaDinamica) throws Exception {
		logger.info("addAulaDinamica");
		
		sSession = this.sessionFactory.openSession();

		try {
			String queryAulaDinamica = "From AulaDinamica a Where ID_AULA_DINAMICA= :idAulaDinamica";
			tTransaction = sSession.beginTransaction();
			sSession.persist(aulaDinamica);
			tTransaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			
			// TODO: handle exception
		} finally {
			sSession.flush();
			sSession.close();
			logger.info("Cerro Session");
		}

	}

	/**
	 * @see AulaDinamicaDao#getAllAulasDinamicas()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AulaDinamica> getAllAulasDinamicas() throws Exception {
		logger.info("getAllAulasDinamicas");

		sSession = sessionFactory.openSession();
		List<AulaDinamica> listarAulaDinamica = null;

		try {
			listarAulaDinamica = sSession.createCriteria(AulaDinamica.class).list();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());

		} finally {

			sSession.close();
			logger.info("Cerro Session");
	
		}
		return listarAulaDinamica;

	}

	/**
	 * @see AulaDinamicaDao#getAulaDinamicaById(int)
	 */
	@Override
	public AulaDinamica getAulaDinamicaById(int idAulaDinamica) throws Exception {
		logger.info("getAulaDinamicaById");
	
		sSession = sessionFactory.openSession();
		AulaDinamica aulaDinamica = null;
		try {
			String queryAulaDinamica = "From AulaDinamica a Where ID_AULA_DINAMICA= :idAulaDinamica";
			Query query = sSession.createQuery(queryAulaDinamica);
			query.setInteger("idAulaDinamica", idAulaDinamica);
			aulaDinamica = (AulaDinamica) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		
		} finally {
			sSession.close();
			logger.info("Cerro Session");
		
		}

		return aulaDinamica;
	}

	/**
	 * @see AulaDinamicaDao#updateAulaDinamica(AulaDinamica)
	 */
	@Override
	public void updateAulaDinamica(AulaDinamica aulaDinamica) throws Exception {
		logger.info("updateAulaDinamica");
	
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(aulaDinamica);
			tTransaction.commit();
		} catch (RuntimeException e) {

			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
			}
			e.printStackTrace();
			logger.error(e.getMessage());
		
		} finally {
			sSession.flush();
			sSession.close();
			logger.info("Cerro Session");
		
		}

	}

	/**
	 * @see AulaDinamicasDao#deleteAulaDinamica(int)
	 */
	@Override
	public void deleteAulaDinamica(int idAulaDinamica) throws Exception {
		logger.info("deleteAulaDinamica");
	
		sSession = sessionFactory.openSession();// crea sesion con la base de datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			AulaDinamica aulaDinamica = (AulaDinamica) sSession.load(AulaDinamica.class, new Integer(idAulaDinamica));// obtiene
			sSession.delete(aulaDinamica);// elimina al AulaDinamica
			tTransaction.commit();// confirma la transacionc

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
			}
			e.printStackTrace();
			logger.error(e.getMessage());
		
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
			logger.info("Cerro Session");
	
		}
	}

}
