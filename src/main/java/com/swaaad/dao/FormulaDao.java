package com.swaaad.dao;

import com.swaaad.model.Formula;
/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface FormulaDao {
	/**
	 * Crea un formula en base de datos, recibe como parametro un
	 * formula
	 * 
	 * @throws Exception
	 */
	void addFormula(Formula formula) throws Exception;

	/**
	 * Recupera un Formula de la base de datos
	 * 
	 * @param idAlumno
	 *            : id que identifica al formula
	 * @return : Una Formula
	 * @throws Exception
	 */
	Formula getFormulaById(int idFormula) throws Exception;

	/**
	 * Actualiza los datos de un formula
	 * 
	 * @param formula
	 *            : formula a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateFormula(Formula formula) throws Exception;

	/**
	 * Elimina Formula
	 * 
	 * @param idAlumno
	 *            : int id formula
	 * @throws Exception
	 */
	void deleteFormula(int idFormula) throws Exception;
}
