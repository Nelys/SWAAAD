package com.swaaad.dao;

import com.swaaad.model.Periodo;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface PeriodoDao {
	/**
	 * crea un periodo en la base de datos, recíbe como un parametro un periodo
	 * 
	 * @param periodo
	 * @throws Exception
	 */
	void addPeriodo(Periodo periodo) throws Exception;

	/**
	 * Recupera un periodo de la base de datos
	 * 
	 * @param idPeriodo
	 * @return
	 * @throws Exception
	 */
	Periodo getPeriodoById(int idPeriodo) throws Exception;

	/**
	 * Actualiza un periodo en la base de datos
	 * 
	 * @param periodo
	 * @throws Exception
	 */
	void updatePeriodo(Periodo periodo) throws Exception;

	/**
	 * Elimina un periodo
	 * @param idPeriodo
	 * @throws Exception
	 */
	void deletePeriodo(int idPeriodo) throws Exception;

}
