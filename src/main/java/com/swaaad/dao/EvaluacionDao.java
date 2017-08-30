package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Evaluacion;
/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface EvaluacionDao {

	/**
	 * Crea una nueva evaluacion en base de datos, recibe como parametro una
	 * evaluacion
	 * 
	 * @throws Exception
	 */
	void addEvaluacion(Evaluacion evaluacion) throws Exception;

	/**
	 * Recupera una lista de evaluaciones de la base de datos
	 * 
	 * @return : Lista de evaluaciones
	 * @throws Exception
	 */
	List<Evaluacion> getAllEvaluacion() throws Exception;

	/**
	 * Recupera una Evaluacion de la base de datos
	 * 
	 * @param idEvaluacion
	 *            : id que identifica a la evaluacion
	 * @return : Una Evaluacion
	 * @throws Exception
	 */
	Evaluacion getEvaluacionById(int idEvaluacion) throws Exception;

	/**
	 * Actualiza los datos de una evaluacion
	 * 
	 * @param evaluacion
	 *            : evaluacion a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateEvaluacion(Evaluacion evaluacion) throws Exception;

	/**
	 * 
	 * @param idEvaluacion
	 *            : int id evaluacion
	 * @throws Exception
	 */
	void deleteEvaluacion(int idEvaluacion) throws Exception;


	
}
