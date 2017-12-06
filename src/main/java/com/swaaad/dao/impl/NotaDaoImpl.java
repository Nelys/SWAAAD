package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.dao.NotaDao;
import com.swaaad.dto.NotasAlumno;
import com.swaaad.model.Nota;

/**
 * 
 * @author Nelys Mollocondo
 * @version 1.0.0, 20/08/2017
 * @see NotaDaoImpl
 * @Creacion
 * ******************************************************************
 * 
 * @author Christian Vilca
 * @version 2.0.0, 21/08/2017
 * @see NotaDaoImpl
 * @Modificacion: Se añadieron metodos de consulta
 */

public class NotaDaoImpl implements NotaDao {
    
    private static final Logger logger = LoggerFactory.getLogger(Nota.class);
    
	/* implementa la interface NotaDao */

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
     * @see NotaDao#addNota(Nota)
     */
	@Override
	public void addNota(Nota nota) throws Exception {
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(nota);
		tTransaction.commit();
		sSession.close();
	}
	
    /**
     * @see NotaDao#getAllNotas()
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Nota> getAllNotas() throws Exception {
        sSession = sessionFactory.openSession();
        List<Nota> listarNotas = sSession.createCriteria(Nota.class).list();
        sSession.close();
        return listarNotas;
        
    }

    /**
     * @see NotaDao#getAllNotasByIdCurso()
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Nota> getAllNotasByIdCurso(int idCurso) throws Exception {
        sSession = sessionFactory.openSession();
        List<Nota> listarNotas =null;
        try {
            //String queryNota = "SELECT e FROM Nota e JOIN e.curso c  WHERE c.idCurso = :id";
            String queryNota = "SELECT n FROM Nota n JOIN n.evaluacion e JOIN e.curso c WHERE c.idCurso = :id";
            //String queryNota = "SELECT a.idAlumno, a.apellidos, a.nombres, c.idCurso, c.nombreCurso, e.idEvaluacion, e.nombre, n.idNota, n.notaEvaluativa"
            //        + "FROM Nota n JOIN n.evaluacion e JOIN n.alumno a JOIN e.curso c  WHERE c.idCurso = :id ORDER BY e";
            
            Query query = sSession.createQuery(queryNota);
            query.setInteger("id", idCurso);
            
            listarNotas = (List<Nota>) query.list();
            /*
            for (NotasAlumno notasAlumno : listarNotas) {
                System.out.println(notasAlumno.getIdAlumno() + ", "
                        + notasAlumno.getApellidosAlumno() + ", "  
                        + notasAlumno.getNombresAlumno() + ", "  
                        + notasAlumno.getIdCurso() + ", "  
                        + notasAlumno.getCurso() + ", "  
                        + notasAlumno.getIdEvaluacion() + ", "  
                        + notasAlumno.getEvaluacion() + ", "  
                        + notasAlumno.getIdNota() + ", "  
                        + notasAlumno.getNota());
            }*/

        } catch (Exception e) {
            logger.info("Metodo getAllNotasByIdCurso: ", e);
        } finally {
            sSession.flush();
            sSession.close();

        }
        
        return listarNotas;
//        sSession = sessionFactory.openSession();
//        List<Nota> listarNotas =null;
//        try {
//            //String queryNota = "SELECT e FROM Nota e JOIN e.curso c  WHERE c.idCurso = :id";
//            String queryNota = "SELECT n FROM Nota n JOIN n.evaluacion e JOIN e.curso c WHERE c.idCurso = :id ORDER BY e";
//            String queryNota = "SELECT n FROM Nota n JOIN n.evaluacion e JOIN n.alumno a JOIN e.curso c  WHERE c.idCurso = :id ORDER BY e";
//            
//            Query query = sSession.createQuery(queryNota);
//            query.setInteger("id", idCurso);
//            
//            listarNotas = (List<Nota>) query.list();
//            
//
//        } catch (Exception e) {
//            logger.info("Metodo getAllNotasByIdCurso: ", e);
//        } finally {
//            sSession.flush();
//            sSession.close();
//
//        }
//        
//        return listarNotas;
    }
    
    /**
     * @see NotaDao#getNotaById()
     */
	@Override
	public Nota getNotaById(int idNota) throws Exception {
		sSession = sessionFactory.openSession();
		Nota nota = null;
		try {
			String queryNota = "From Nota Where ID_NOTA= :idNota";
			Query query = sSession.createQuery(queryNota);
			query.setInteger("idNota", idNota);
			nota = (Nota) query.uniqueResult();

		} catch (Exception e) {
		    logger.info("Metodo getNotaById: ", e);
		} finally {
			sSession.flush();
			sSession.close();

		}

		return nota;
	}
	
	/**
     * @see NotaDao#getNotaById()
     */
    @Override
    public int getIdNotaByIdAlumnoIdEvaluacion(int idAlumno, int idEvaluacion) throws Exception {
        sSession = sessionFactory.openSession();
        Nota nota = null;
        try {
            String queryNota = "From Nota Where ID_ALUMNO= :idAlumno AND ID_EVALUACION= :idEvaluacion";
            Query query = sSession.createQuery(queryNota);
            query.setInteger("idAlumno", idAlumno);
            query.setInteger("idEvaluacion", idEvaluacion);
            nota = (Nota) query.uniqueResult();
            
            if(nota==null){
                return 0;
            }

        } catch (Exception e) {
            logger.info("Metodo getNotaById: ", e);
        } finally {
            sSession.flush();
            sSession.close();

        }

        return nota.getIdNota();
    }

	/**
     * @see NotaDao#updateNota()
     */
	@Override
	public void updateNota(Nota nota) throws Exception {
		sSession = sessionFactory.openSession();
		try {
			tTransaction = sSession.beginTransaction();
			sSession.update(nota);
			tTransaction.commit();
			logger.info("Se actualizo");
		} catch (RuntimeException e) {

			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e

			}
			logger.info("Metodo updateNota: ", e);
		} finally {
			sSession.flush();
			sSession.close();
		}

	}

	/**
     * @see NotaDao#deleteNota() - no esta siendo utilizado
     */
	@Override
	public void deleteNota(int idNota) throws Exception {
		sSession = sessionFactory.openSession();// crea sesion con la base de
		// datos

		try {
			tTransaction = sSession.beginTransaction();// habilita a la session
			// para hacer
			// una transaccion en este
			// casoeliminar
			Nota nota = (Nota) sSession.load(Nota.class, Integer.valueOf(idNota));// obtiene
			// al
			// alumno
			sSession.delete(nota);// elimina al alumno
			tTransaction.commit();// confirma la transacionc

		} catch (RuntimeException e) {
			// si ocurrio un problema
			if (tTransaction != null) {// verifica hubosi un cambio en caso
				tTransaction.rollback();// desase e
			}
			logger.info("Metodo deleteNota: ", e);
		} finally {
			sSession.flush();
			sSession.close();// ciera la sesion
		}

	}

}
