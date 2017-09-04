package com.swaaad.service;

import org.springframework.stereotype.Service;

import com.swaaad.model.Periodo;

/**
 * 
 * @author Nelys
 * @version 1.0.0, 20/08/2017
 *	Referencia:
 *	Objetivo: Llama a los metodos de PeriodoDao
 *	Funcionalidad: 
 *	
 *
 */
@Service
public interface PeriodoService {
	/**
	 * Utiliza el metodo AddPeriodo de la clase PeriodoDao
	 * 
	 * @throws Exception
	 */
	void addPeriodo(Periodo periodo) throws Exception;

	/**
	 * Utiliza el metodo getPeriodoById(int idPeriodo) de la clase PeriodoDao
	 * 
	 * @param idPeriodo
	 *            : id que identifica al periodo
	 * @return : Un periodo
	 * @throws Exception
	 */
	Periodo getPeriodoById(int idPeriodo) throws Exception;

	/**
	 * Utiliza el metodo updatePeriodo(Periodo periodo) de la clase PeriodoDao
	 * 
	 * @param periodo
	 *            : periodo a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updatePeriodo(Periodo periodo) throws Exception;

	/**
	 * Implementa el metodo deletePeriodo(Periodo alumno) de la clase PeriodoDao
	 * 
	 * @param periodo
	 *            : periodo a eliminar
	 * @throws Exception
	 */
	void deletePeriodo(int idPeriodo) throws Exception;

}
