package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Competencia;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
interface CompetenciaDao {
	/**
	 * Crea una competencia en base de datos, recibe como parametro una
	 * competencia
	 * 
	 * @throws Exception
	 */
	void addCompetencia(Competencia competencia) throws Exception;

	/**
	 * Recupera una lista de competencias de la base de datos
	 * 
	 * @return : Lista de Competencias
	 * @throws Exception
	 */
	List<Competencia> getAllCompetencia() throws Exception;

	/**
	 * Recupera una Competencia de la base de datos
	 * 
	 * @param idCompetencia
	 *            : id que identifica a la competencia
	 * @return : Una Competencia
	 * @throws Exception
	 */
	Competencia getCompetenciaById(int idCompetencia) throws Exception;

	/**
	 * Actualiza los datos de una competencia
	 * 
	 * @param competencia
	 *            : competencia a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateCompetencia(Competencia competencia) throws Exception;

	/**
	 * Elimina Competencia
	 * 
	 * @param idCompetencia
	 *            : int id competencia
	 * @throws Exception
	 */
	void deleteCompetencia(int idCompetencia) throws Exception;

}
