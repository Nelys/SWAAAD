package com.swaaad.service;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.stereotype.Service;

import com.swaaad.model.Evaluacion;

/**
 * 
 * @author Christian Vilca
 * @version 1.0.0, 20/09/2017
 * @see EvaluacionService
 * @Creacion: Se añadieron metodos de consulta
 */

@Service
public interface EvaluacionService {
    
    /**
     * Utiliza el metodo AddEvaluacion de la clase EvaluacionDao
     * 
     * @throws Exception
     */
    void addEvaluacion(Evaluacion evaluacion, ServletRequest request) throws Exception;

    /**
     * Utiliza el metodo getAllEvaluaciones() de la EvaluacionesDao
     * 
     * @return : Lista de Evaluaciones
     * @throws Exception
     */
    List<Evaluacion> getAllEvaluaciones() throws Exception;

    /**
     * Utiliza el metodo getAllEvaluacionesByIdCurso() de la EvaluacionesDao
     * 
     * @return : Lista de Evaluaciones por curso
     * @throws Exception
     */
    List<Evaluacion> getAllEvaluacionesByIdCurso(ServletRequest request) throws  Exception;
    
    /**
     * Utiliza el metodo getEvaluacionById(int idEvaluacion) de la clase EvaluacionesDao
     * 
     * @param idEvaluacion
     *            : id que identifica al evaluacion
     * @return : Un evaluacion
     * @throws Exception
     */
    Evaluacion getEvaluacionById(int idEvaluacion) throws Exception;

    /**
     * Utiliza el metodo updateEvaluacion(Evaluacion evaluacion) de la clase EvaluacionDao
     * 
     * @param evaluacion
     *            : evaluacion a actualizar con nuevos valores
     * @throws Exception
     */
    void updateEvaluacion(Evaluacion evaluacion, ServletRequest request) throws Exception;

    /**
     * Implementa el metodo deleteEvaluacion(Evaluacion evaluacion) de la clase EvaluacionDao
     * 
     * @param evaluacion
     *            : evaluacion a eliminar
     * @throws Exception
     */
    void deleteEvaluacion(int idEvaluacion) throws Exception;

}
