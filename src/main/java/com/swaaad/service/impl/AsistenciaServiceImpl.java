package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.AsistenciaDao;
import com.swaaad.model.Asistencia;
import com.swaaad.service.AsistenciaService;

@Service
public class AsistenciaServiceImpl implements AsistenciaService {

	@Autowired
	AsistenciaDao objAsistenciaDao;

	@Override
	public void addAsistencia(Asistencia asistencia) throws Exception {
		objAsistenciaDao.addAsistencia(asistencia);
	}

	@Override
	public void updateAsistencia(Asistencia asistencia) throws Exception {
		objAsistenciaDao.upddateAsistencia(asistencia);

	}

	@Override
	public List<Asistencia> getAllAlumnosByCursoMes(int idCurso) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.getAllAlumnosByCursoMes(idCurso);
	}

	@Override
	public List<Integer> asistenciaMes(int Mes, int idCurso) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.asistenciaMes(Mes, idCurso);
	}

	

}
