package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Asistencia;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface AsistenciaDao {
	/**
	 * Agrega una nueva asistencia en la base de datos
	 * 
	 * @param asistencia
	 * @throws Exception
	 */
	void addAsistencia(Asistencia asistencia) throws Exception;

	/**
	 * Actualiza una asistencia
	 * 
	 * @param asistencia
	 * @throws Exception
	 */
	void upddateAsistencia(Asistencia asistencia) throws Exception;

	List<Asistencia> getAllAsistencia() throws Exception;
}
