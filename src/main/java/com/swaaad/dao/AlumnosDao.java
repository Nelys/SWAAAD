package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Alumno;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface AlumnosDao {

	/**
	 * Crea un alumno en base de datos, recibe como parametro un alumno
	 * 
	 * @throws Exception
	 */
	void addAlumno(Alumno alumno) throws Exception;

	/**
	 * Recupera una lista de alumnos de la base de datos
	 * 
	 * @return : Lista de Alumnos
	 * @throws Exception
	 */
	List<Alumno> getAllAlumnos() throws Exception;
	
	/**
	 * Recupera una lista de alumnos de la base de datos
	 * 
	 * @return : Lista de Alumnos
	 * @throws Exception
	 */
	List<Alumno> getAllAlumnosByIdCurso(int idCurso) throws Exception;

	/**
	 * Recupera un Alumno de la base de datos
	 * 
	 * @param idAlumno
	 * @return : Un Alumno
	 * @throws Exception
	 */
	Alumno getAlumnoById(int idAlumno) throws Exception;

	/**
	 * Actualiza los datos de un alumno
	 * 
	 * @param alumno
	 *            : alumno a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateAlumno(Alumno alumno) throws Exception;

	/**
	 * Elimina Alumno
	 * 
	 * @param idAlumno
	 *            : int id alumno
	 * @throws Exception
	 */
	void deleteAlumno(int idAlumno) throws Exception;


}
