package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Capacidad;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */

public interface CapacidadDao {
	
	/**
	 * Crea una nueva capacidad en base de datos, recibe como parametro una
	 * capacidad
	 * 
	 * @throws Exception
	 */
	void addCapacidad(Capacidad capacidad) throws Exception;

	/**
	 * Recupera una lista de capacidades de la base de datos
	 * 
	 * @return : Lista de Capacidades
	 * @throws Exception
	 */
	List<Capacidad> getAllCapacidad() throws Exception;

	/**
	 * Recupera una Capacidad de la base de datos
	 * 
	 * @param idCapacidad
	 *            : id que identifica a la capacidad
	 * @return : Una Capacidad
	 * @throws Exception
	 */
	Capacidad getCapacidadById(int idCapacidad) throws Exception;

	/**
	 * Actualiza los datos de una capacidad
	 * 
	 * @param capacidad
	 *            : capacidad a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateCapacidad(Capacidad capacidad) throws Exception;

	/**
	 * Elimina Capacidad
	 * 
	 * @param idCapacidad
	 *            : int id capacidad
	 * @throws Exception
	 */
	void deleteCapacidad(int idCapacidad) throws Exception;

}
