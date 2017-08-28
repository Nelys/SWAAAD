package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.AsistenciaDao;
import com.swaaad.model.Asistencia;
import com.swaaad.service.AsistenciaService;

@Service
public class AsistenciaServiceImpl implements AsistenciaService {

	@Autowired
	AsistenciaDao objAsistencia;

	@Override
	public void addAsistencia(Asistencia asistencia) throws Exception {
		objAsistencia.addAsistencia(asistencia);
	}

	@Override
	public void updateAsistencia(Asistencia asistencia) throws Exception {
		objAsistencia.upddateAsistencia(asistencia);

	}

}
