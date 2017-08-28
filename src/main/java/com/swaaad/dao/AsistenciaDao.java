package com.swaaad.dao;

import com.swaaad.model.Asistencia;

public interface AsistenciaDao {
	void addAsistencia(Asistencia asistencia) throws Exception;

	void upddateAsistencia(Asistencia asistencia) throws Exception;
}
