package com.swaaad.dao;


import java.util.List;

import com.swaaad.model.CursoAlumno;
/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface CursoAlumnoDao {

		/**
	 * Crea un cursoAlumno en base de datos, recibe como parametro un
	 * cursoAlumno
	 * 
	 * @throws Exception
	 */
	void addCursoAlumno(CursoAlumno cursoAlumno) throws Exception;

	/**
	 * Recupera un cursoAlumno de la base de datos
	 * 
	 * @param idCursoAlumno
	 *            : id que identifica al cursoAlumno
	 * @return : Un CursoAlumno
	 * @throws Exception
	 */
	CursoAlumno getCursoAlumnoById(int idCursoAlumno) throws Exception;

	/**
	 * Actualiza los datos de un cursoAlumno
	 * 
	 * @param cursoAlumno
	 *            : cursoAlumno a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateCursoAlumno(CursoAlumno cursoAlumno) throws Exception;

	List<CursoAlumno> getAllAlumnosByCurso(int idCurso) throws Exception;
	
	List<CursoAlumno> getAllCursosByAlumno(int idAlumno) throws Exception;

	
}
