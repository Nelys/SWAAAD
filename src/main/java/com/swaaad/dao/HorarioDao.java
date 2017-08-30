package com.swaaad.dao;

import com.swaaad.model.Horario;

/**
 * @author Nelys
 * @version 1.0.0 , 29/08/2018
 */

public interface HorarioDao {
	/**
	 * crea un horario en base de datos, recibe como parametro un horario
	 * 
	 * @param horario
	 * @throws Exception
	 */
	void addHorario(Horario horario) throws Exception;

	/**
	 * recupera un alumno de la base de datos
	 * 
	 * @param idHorario
	 * @return
	 * @throws Exception
	 */
	Horario getHorarioById(int idHorario) throws Exception;

	/**
	 * Actuliza los datos de un alumno
	 * 
	 * @param horario
	 * @throws Exception
	 */
	void updateHorario(Horario horario) throws Exception;

	/**
	 * Elimina Horario
	 * 
	 * @param idHorario
	 * @throws Exception
	 */
	void deleteHorario(int idHorario) throws Exception;
}
