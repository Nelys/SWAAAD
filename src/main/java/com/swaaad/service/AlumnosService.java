package com.swaaad.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;

import org.springframework.stereotype.Service;

import com.swaaad.model.Alumno;

/**
 * 
 * @author Nelys
 * @version 1.0.0, 20/08/2017
 *	Referencia:
 *	Objetivo: Llama a los metodos de AlumnosDao
 *	Funcionalidad: 
 *	
 *
 */
@Service
public interface AlumnosService {
	/**
	 * Utiliza el metodo AddAlumno de la clase AlumnoDao
	 * 
	 * @throws Exception
	 */
	void addAlumno(Alumno alumno) throws Exception;

	/**
	 * Utiliza el metodo getAllAlumnos() de la AlumnosDao
	 * 
	 * @return : Lista de Alumnos
	 * @throws Exception
	 */
	List<Alumno> getAllAlumnos() throws Exception;

	/**
	 * Utiliza el metodo getAllAlumnosByIdCurso() de la AlumnosDao
	 * 
	 * @return : Lista de Alumnos por curso
	 * @throws IOException, ServletException,Exception
	 */
	List<Alumno> getAllAlumnosByIdCurso(ServletRequest request) throws IOException, ServletException, Exception;
	/**
	 * Utiliza el metodo getAlumnoById(int idAlumno) de la clase AlumnosDao
	 * 
	 * @param idAlumno
	 *            : id que identifica al alumno
	 * @return : Un alumno
	 * @throws Exception
	 */
	Alumno getAlumnoById(int idAlumno) throws Exception;

	/**
	 * Utiliza el metodo updateAlumno(Alumno alumno) de la clase AlumnoDao
	 * 
	 * @param alumno
	 *            : alumno a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateAlumno(Alumno alumno) throws Exception;

	/**
	 * Implementa el metodo deleteAlumno(Alumno alumno) de la clase AlumnoDao
	 * 
	 * @param alumno
	 *            : alumno a eliminar
	 * @throws Exception
	 */
	void deleteAlumno(int idAlumno) throws Exception;

}
