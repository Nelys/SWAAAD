package com.swaaad.dao;

import com.swaaad.model.Docente;

/**
 * clase que recupera
 * 
 * @author Nelys
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
	 * @param docente
	 * @throws Exception
	 */
	public void updateDocente(Docente docente) throws Exception;
	
/**
 * Recupera un docente de la base de datos
 * @param idAlumno
 * @throws Exception
 */
	public void getDocenteById(int idAlumno) throws Exception;
	

}
