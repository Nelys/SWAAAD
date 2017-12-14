package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.ActividadPedagogica;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface ActividadPedagogicaDao {
	/**
	 * Crea una Actividad Pedagogica en base de datos, recibe como parametro una actividad Pedagogica
	 * 
	 * @throws Exception
	 */
	void addActividad(ActividadPedagogica pedagogica) throws Exception;
	/**
	 * Recupera una Actividad Pedagogica de la base de datos
	 * 
	 * @param idActividad
	 *            : id que identifica a la actividad pedagogica
	 * @return : Una Actividad Pedagogica
	 * @throws Exception 
	 */
	ActividadPedagogica getActividadById(int idActividad) throws Exception;

	/**
	 * Actualiza los datos de una Actividad Pedagogica
	 * 
	 * @param actividad
	 *            : actividad a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateActividad(ActividadPedagogica actividad) throws Exception;

	/**
	 * Elimina Actividad
	 * 
	 * @param idActividad
	 *            : int idActividad
	 * @throws Exception
	 */
	void deleteActividad(int idActividad) throws Exception;
	/**
	 * Recupera una lista de actividades pedagogicas de la base de datos
	 * 
	 * @return : Lista de Actividades Pedagogicas
	 * @throws Exception
	 */
	List<ActividadPedagogica> getAllActividad() throws Exception;

	
	List<ActividadPedagogica> getAllActividadesByCurso(int id_curso) throws Exception;
}
