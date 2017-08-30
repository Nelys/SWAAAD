package com.swaaad.dao;

import com.swaaad.model.Pregunta;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface PreguntaDao {
	/**
	 * Agrega una pregunta nueva en la base de datos
	 * 
	 * @param pregunta
	 * @throws Exception
	 */
	void addPregunta(Pregunta pregunta) throws Exception;

	/**
	 * Recupera una pregunta de la base de datos
	 * 
	 * @param idPregunta
	 * @return
	 * @throws Exception
	 */
	Pregunta getPreguntaById(int idPregunta) throws Exception;

	/**
	 * Actualiza datos de una pregunta
	 * 
	 * @param pregunta
	 * @throws Exception
	 */
	void updatePregunta(Pregunta pregunta) throws Exception;

	/**
	 * Elimina pregunta
	 * 
	 * @param idPregunta
	 * @throws Exception
	 */
	void deletePregunta(int idPregunta) throws Exception;

}
