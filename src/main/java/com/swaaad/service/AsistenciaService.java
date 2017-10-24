package com.swaaad.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.Asistencia;

@Service
public interface AsistenciaService {
	void addAsistencia(Asistencia asistencia) throws Exception;

	void updateAsistencia(Asistencia asistencia) throws Exception;

	List<Asistencia> getAllAlumnosByCursoMes(int idCurso) throws Exception;

	public List<Integer> asistenciaMes(int Mes, int idCurso) throws Exception;
}
