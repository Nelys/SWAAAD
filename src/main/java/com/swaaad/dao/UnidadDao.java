package com.swaaad.dao;

import com.swaaad.model.Unidad;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface UnidadDao {
	/**
	 * Agrega una unidad nueva en la base de datos
	 * 
	 * @param unidad
	 * @throws Exception
	 */
	void addUnidad(Unidad unidad) throws Exception;

	/**
	 * Recupera una unidad de la base de datos
	 * 
	 * @param idUnidad
	 * @return
	 * @throws Exception
	 */
	Unidad getUnidadById(int idUnidad) throws Exception;

	/**
	 * Actualiza una unidad
	 * 
	 * @param unidad
	 * @throws Exception
	 */
	void updateUnidad(Unidad unidad) throws Exception;

	/**
	 * Elimina una unidad
	 * 
	 * @param idUnidad
	 * @throws Exception
	 */
	void deleteUnidad(int idUnidad) throws Exception;

}
