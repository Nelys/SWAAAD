package com.swaaad.dao;

import java.sql.Date;
import java.util.List;

import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;

/**
 * @author Nelys
 * @version 1.0.0 ,29/08/2017
 *
 */
public interface AsistenciaDao {
	/**
	 * Agrega una nueva asistencia en la base de datos
	 * 
	 * @param asistencia
	 * @throws Exception
	 */
	void addAsistencia(Asistencia asistencia) throws Exception;

	/**
	 * Actualiza una asistencia
	 * 
	 * @param asistencia
	 * @throws Exception
	 */
	void upddateAsistencia(Asistencia asistencia) throws Exception;

	List<Asistencia> getAllAlumnosByCursoMes(int idCurso) throws Exception;

	List<Integer> asistenciaMes(int Mes, int idCurso) throws Exception;

	List<Integer> getDayOfAlumnosByCurso(int idCurso, int mes) throws Exception;

	List<Asistencia> getEstadoByAlumnoCurso(int idCurso, int mes) throws Exception;
}
