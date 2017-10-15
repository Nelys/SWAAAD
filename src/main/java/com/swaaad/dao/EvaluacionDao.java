package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Evaluacion;
    
/**
 * @author Christian Vilca
 * @version 1.0.0 ,20/09/2017
 * @see EvaluacionesDao
 * @Creacion: Se añadieron metodos de consulta, agregacion, modificacio y eliminacion
 */
public interface EvaluacionDao {
    
    /**
     * crea un evaluacion en la base de datos, recíbe como un parametro una evaluacion
     * 
     * @param evaluacion
     * @throws Exception
     */
    void addEvaluacion(Evaluacion evaluacion) throws Exception;

    /**
     * Recupera una lista de evaluaciones de la base de datos
     * 
     * @return : Lista de Evaluaciones
     * @throws Exception
     */
    List<Evaluacion> getAllEvaluaciones() throws Exception;

    /**
     * Recupera una lista de evaluaciones de la base de datos
     * 
     * @return : Lista de Evaluaciones
     * @throws Exception
     */
    List<Evaluacion> getAllEvaluacionesByIdCurso(int idCurso) throws Exception;

    /**
     * Recupera una lista de evaluaciones de la base de datos
     * 
     * @return : Lista de Evaluaciones
     * @throws Exception
     */
    List<Evaluacion> getAllEvaluacionesByIdEvaluacionDependencia(int idEvaluacion) throws Exception;
    
    /**
     * Recupera una evaluacion de la base de datos
     * 
     * @param idEvaluacion
     * @return
     * @throws Exception
     */
    Evaluacion getEvaluacionById(int idEvaluacion) throws Exception;

    /**
     * Actualiza un evaluacion en la base de datos
     * 
     * @param evaluacion
     * @throws Exception
     */
    void updateEvaluacion(Evaluacion evaluacion) throws Exception;

    /**
     * Elimina un evaluacion
     * @param idEvaluacion
     * @throws Exception
     */
    void deleteEvaluacion(int idEvaluacion) throws Exception;

}
