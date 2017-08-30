package com.swaaad.dao;
/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface ParteDao {
/**
 * Recupera un parte de la base de datos
 * @param idParte
 * @throws Exception
 */
	void getParteById(int idParte) throws Exception;

}
