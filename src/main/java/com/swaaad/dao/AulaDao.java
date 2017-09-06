package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.AulaDinamica;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */

public interface AulaDao {

	/**
	 * Crea un aula en base de datos, recibe como parametro un
	 * aula
	 * 
	 * @throws Exception
	 */
	void addAula(AulaDinamica aula) throws Exception;

	/**
	 * Recupera un Aula de la base de datos
	 * 
	 * @param idAula
	 *            : id que identifica al aula
	 * @return : Un Aula
	 * @throws Exception
	 */
	AulaDinamica getAulaById(int idAula) throws Exception;
	/**
	 * Actualiza los datos de un aula
	 * 
	 * @param aula
	 *            : aula a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateAula(AulaDinamica aula) throws Exception;

	/**
	 * Elimina Aula
	 * 
	 * @param idAula
	 *            : int id aula
	 * @throws Exception
	 */
	void deleteAula(int idAula) throws Exception;
	/**
	 * Recupera una lista de aulas de la base de datos
	 * 
	 * @return : Lista de Aulas
	 * @throws Exception
	 */
	List<AulaDinamica> getAllAulas() throws Exception;
}
