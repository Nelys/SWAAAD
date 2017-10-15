package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.dao.EvaluacionDao;
import com.swaaad.model.Evaluacion;

/**
 * 
   @author Christian Vilca
 * @version 2.0.0, 20/09/2017
 * @see EvaluacionesDaoImpl
 * @Creacion: Se añadieron metodos de consulta
 */

public class EvaluacionDaoImpl implements EvaluacionDao {
    
    private static final Logger logger = LoggerFactory.getLogger(Evaluacion.class);

    /* implementa la interface EvaluacionDAO */

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
     * @see EvaluacionDao#addEvaluacion(Evaluacion)
     */
    @Override
    public void addEvaluacion(Evaluacion evaluacion) throws Exception {

        sSession = this.sessionFactory.openSession();
        tTransaction = sSession.beginTransaction();
        sSession.persist(evaluacion);
        tTransaction.commit();
        sSession.close();

    }

    /**
     * @see EvaluacionDao#getAllEvaluaciones()
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Evaluacion> getAllEvaluaciones() throws Exception {
        sSession = sessionFactory.openSession();
        List<Evaluacion> listarEvaluaciones = sSession.createCriteria(Evaluacion.class).list();
        sSession.close();
        return listarEvaluaciones;
        
    }

    /**
     * @see EvaluacionesDao#getAllEvaluacionesByIdCurso()
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Evaluacion> getAllEvaluacionesByIdCurso(int idCurso) throws Exception {
        sSession = sessionFactory.openSession();
        List<Evaluacion> listarEvaluaciones =null;
        try {
            String queryEvaluacion = "SELECT e FROM Evaluacion e JOIN e.curso c  WHERE c.idCurso = :id";
            
            Query query = sSession.createQuery(queryEvaluacion);
            query.setInteger("id", idCurso);
            
            listarEvaluaciones = (List<Evaluacion>) query.list();
            

        } catch (Exception e) {
            logger.info("Metodo getAllEvaluacionesByIdCurso: ", e);
        } finally {
            sSession.flush();
            sSession.close();

        }
        
        return listarEvaluaciones;
    }
    

    /**
     * @see EvaluacionesDao#getAllEvaluacionesByIdCurso()
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Evaluacion> getAllEvaluacionesByIdEvaluacionDependencia(int idEvaluacion) throws Exception {
        sSession = sessionFactory.openSession();
        List<Evaluacion> listarEvaluaciones =null;
        try {
            String queryEvaluacion = "SELECT e FROM Evaluacion e WHERE e.idEvaluacionDependencia = :id";
            
            Query query = sSession.createQuery(queryEvaluacion);
            query.setInteger("id", idEvaluacion);
            
            listarEvaluaciones = (List<Evaluacion>) query.list();
            

        } catch (Exception e) {
            logger.info("Metodo getAllEvaluacionesByIdEvaluacionDependencia: ", e);
        } finally {
            sSession.flush();
            sSession.close();

        }
        
        return listarEvaluaciones;
    }
    
    /**
     * @see EvaluacionesDao#getEvaluacionById(int)
     */
    @Override
    public Evaluacion getEvaluacionById(int idEvaluacion) throws Exception {
        sSession = sessionFactory.openSession();
        Evaluacion evaluacion = null;
        try {
            String queryEvaluacion = "From Evaluacion Where ID_EVALUACION= :idEvaluacion";
            Query query = sSession.createQuery(queryEvaluacion);
            query.setInteger("idEvaluacion", idEvaluacion);
            evaluacion = (Evaluacion) query.uniqueResult();

        } catch (Exception e) {
            logger.info("Metodo getEvaluacionById: ", e);
        } finally {
            sSession.flush();
            sSession.close();

        }

        return evaluacion;
    }

    /**
     * @see EvaluacionesDao#updateEvaluacion(Evaluacion)
     */
    @Override
    public void updateEvaluacion(Evaluacion evaluacion) throws Exception {

        sSession = sessionFactory.openSession();
        try {
            tTransaction = sSession.beginTransaction();
            sSession.update(evaluacion);
            tTransaction.commit();
            logger.info("se actualizo");
        } catch (RuntimeException e) {

            if (tTransaction != null) {// verifica hubosi un cambio en caso
                tTransaction.rollback();// desase e

            }
            logger.info("Metodo updateEvaluacion: ", e);
        } finally {
            sSession.flush();
            sSession.close();
        }

    }

    /**
     * @see EvaluacionesDao#deleteEvaluacion(int)
     */
    @Override
    public void deleteEvaluacion(int idEvaluacion) throws Exception {
        sSession = sessionFactory.openSession();// crea sesion con la base de
                                                // datos

        try {
            tTransaction = sSession.beginTransaction();// habilita a la session
                                                        // para hacer
            // una transaccion en este
            // casoeliminar
            Evaluacion evaluacion = (Evaluacion) sSession.load(Evaluacion.class, Integer.valueOf(idEvaluacion));// obtiene
                                                                                        // al
                                                                                        // evaluacion
            sSession.delete(evaluacion);// elimina al evaluacion
            tTransaction.commit();// confirma la transacionc

        } catch (RuntimeException e) {
            // si ocurrio un problema
            if (tTransaction != null) {// verifica hubosi un cambio en caso
                tTransaction.rollback();// desase e
            }
            logger.info("Metodo deleteEvaluacion: ", e);
        } finally {
            sSession.flush();
            sSession.close();// ciera la sesion
        }

    }

}
