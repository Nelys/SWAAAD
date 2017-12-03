package com.swaaad.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.Asistencia;

@Service
public interface AsistenciaService {
	void addAsistencia(Asistencia asistencia) throws Exception;

	void updateAsistencia(Asistencia asistencia) throws Exception;

	List<Asistencia> getAllAlumnosByCursoMes(int idCurso) throws Exception;

	public List<Integer> asistenciaMes(int Mes, int idCurso) throws Exception;

	List<Integer> getDayOfAlumnosByCurso(int idCurso, int mes) throws Exception;

	List<Asistencia> getEstadoByAlumnoCurso(int idCurso, int mes) throws Exception;

	void generarAsistencia(Date fecha, int idCurso) throws Exception;

	List<Asistencia> getByDay(int idCurso, Date fecha) throws Exception;

	Asistencia getById(int idAsistencia) throws Exception;

	List<Integer> getTotalEstadoByAlumno() throws Exception;
}
