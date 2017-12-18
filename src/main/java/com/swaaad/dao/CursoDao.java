package com.swaaad.dao;

import java.util.List;


import com.swaaad.model.Curso;
/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface CursoDao {

	/**
	 * Crea un curso en base de datos, recibe como parametro un
	 * curso
	 * 
	 * @throws Exception
	 */
	void addCurso(Curso curso) throws Exception;

	/**
	 * Recupera una lista de cursos de la base de datos
	 * 
	 * @return : Lista de Cursos
	 * @throws Exception
	 */
	List<Curso> getAllCurso() throws Exception;

	/**
	 * Recupera un Curso de la base de datos
	 * 
	 * @param idCurso
	 *            : id que identifica al curso
	 * @return : Un Curso
	 * @throws Exception
	 */
	Curso getCursoById(int idCurso) throws Exception;

	/**
	 * Actualiza los datos de un curso
	 * 
	 * @param curso
	 *            : curso a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateCurso(Curso curso) throws Exception;

	/**
	 * Elimina Curso
	 * 
	 * @param idCurso
	 *            : int id Curso 
	 * @throws Exception
	 */
	void deleteCurso(int idCurso) throws Exception;
	
	/**
	 * Lista Cursos por docente
	 * @param idDocente
	 * @return : Cursos
	 * @throws Exception
	 */
	List<Curso> listCursoByDocente(int idDocente) throws Exception;
	List<Curso> listCursoByEstado(int idDocente) throws Exception;
}
 