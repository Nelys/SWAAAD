package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.CursoAlumnoDao;
import com.swaaad.model.CursoAlumno;
import com.swaaad.service.CursoAlumnoService;

@Service
public class CursoAlumnoServiceImpl implements CursoAlumnoService {

	@Autowired
	private CursoAlumnoDao objCursoAlumnoDao;
	
	@Override
	public void addCursoAlumno(CursoAlumno cursoAlumno) throws Exception {

	}

	@Override
	public CursoAlumno getCursoAlumnoById(int idCursoAlumno) throws Exception {

		return objCursoAlumnoDao.getCursoAlumnoById(idCursoAlumno);
	}

	@Override
	public void updateCursoAlumno(CursoAlumno cursoAlumno) throws Exception {

	}

	@Override
	public List<CursoAlumno> getAllAlumnosByCurso(int idCurso) throws Exception {
		
		return objCursoAlumnoDao.getAllAlumnosByCurso(idCurso);
	}

	@Override
	public List<CursoAlumno> getAllCursosByAlumno(int idAlumno) throws Exception {
		
		return objCursoAlumnoDao.getAllCursosByAlumno(idAlumno);
	}

}
