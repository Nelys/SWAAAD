package com.swaaad.service;

import org.springframework.stereotype.Service;

import com.swaaad.model.Asistencia;
@Service
public interface AsistenciaService {
	void addAsistencia(Asistencia asistencia) throws Exception;

	void updateAsistencia(Asistencia asistencia) throws Exception;
}
