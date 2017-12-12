package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Periodo;

/**
 * @author Christian
 * @version 1.0.0 ,30/09/2017
 *
 */
public interface PeriodoDao {

	/**
	 * Crea un periodo en base de datos, recibe como parametro un
	 * periodo
	 * 
	 * @throws Exception
	 */
	void addPeriodo(Periodo periodo) throws Exception;

	/**
	 * Recupera una lista de periodos de la base de datos
	 * 
	 * @return : Lista de Periodos
	 * @throws Exception
	 */
	List<Periodo> getAllPeriodo() throws Exception;

	/**
	 * Recupera una lista de periodos de la base de datos
	 * 
	 * @return : Lista de Periodos
	 * @throws Exception
	 */
	List<Periodo> getAllPeriodoByIdCurso(int idCurso) throws Exception;
	
	/**
	 * Recupera un Periodo de la base de datos
	 * 
	 * @param idPeriodo
	 *            : id que identifica al periodo
	 * @return : Un Periodo
	 * @throws Exception
	 */
	Periodo getPeriodoById(int idPeriodo) throws Exception;

	/**
	 * Actualiza los datos de un periodo
	 * 
	 * @param periodo
	 *            : periodo a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updatePeriodo(Periodo periodo) throws Exception;

	/**
	 * Elimina Periodo
	 * 
	 * @param idPeriodo
	 *            : int id Periodo 
	 * @throws Exception
	 */
	void deletePeriodo(int idPeriodo) throws Exception;
	
	/**
	 * Lista Periodos por docente
	 * @param idCurso
	 * @return : Periodos
	 * @throws Exception
	 */
	List<Periodo> listPeriodoByCurso(int idCurso) throws Exception;
	
}
