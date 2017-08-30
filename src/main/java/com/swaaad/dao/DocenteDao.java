package com.swaaad.dao;

import com.swaaad.model.Docente;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface DocenteDao {
	/**
	 * Crea un Docente en la base de datos, Recibe como parametro un Docente
	 * 
	 * @throws Exception
	 */
	public void addDocente(Docente docente) throws Exception;

	/**
	 * Actualiza un docente solo Contraseña
	 * 
	 * @param docente
	 * @throws Exception
	 */
	public void updateDocente(Docente docente) throws Exception;

	/**
	 * Recupera un docente de la base de datos
	 * 
	 * @param idDocente
	 * @throws Exception
	 */
	Docente getDocenteById(int idDocente) throws Exception;

}
