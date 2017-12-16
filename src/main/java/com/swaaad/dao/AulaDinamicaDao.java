package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.AulaDinamica;

/**
 * @author Christian
 * @version 1.0.0 ,06/09/2017
 *
 */

public interface AulaDinamicaDao {

	
	/**
	 * Crea un aula en base de datos, recibe como parametro un
	 * aula
	 * 
	 * @throws Exception
	 */
	void addAulaDinamica(AulaDinamica aulaDinamica) throws Exception;

	/**
	 * Recupera un Aula de la base de datos
	 * 
	 * @param idAula
	 *            : id que identifica al aula
	 * @return : Un Aula
	 * @throws Exception
	 */
	AulaDinamica getAulaDinamicaById(int idAulaDinamica) throws Exception;
	/**
	 * Actualiza los datos de un aula
	 * 
	 * @param aula
	 *            : aula a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateAulaDinamica(AulaDinamica aulaDinamica) throws Exception;

	/**
	 * Elimina Aula
	 * 
	 * @param idAula
	 *            : int id aula
	 * @throws Exception
	 */
	void deleteAulaDinamica(int idAulaDinamica) throws Exception;
	/**
	 * Recupera una lista de aulas de la base de datos
	 * 
	 * @return : Lista de Aulas
	 * @throws Exception
	 */
	List<AulaDinamica> getAllAulasDinamicas() throws Exception;
}
