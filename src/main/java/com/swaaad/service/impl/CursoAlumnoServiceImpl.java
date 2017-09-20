package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.CursoAlumnoDao;
import com.swaaad.model.CursoAlumno;
import com.swaaad.service.CursoAlumnoService;

@Service
public class CursoAlumnoServiceImpl implements CursoAlumnoService {

	@Autowired
	CursoAlumnoDao objCursoAlumnoDao;
	
	@Override
	public void addCursoAlumno(CursoAlumno cursoAlumno) throws Exception {

	}

	@Override
	public CursoAlumno getCursoAlumnoById(int idCursoAlumno) throws Exception {

		return null;
	}

	@Override
	public void updateCursoAlumno(CursoAlumno cursoAlumno) throws Exception {

	}

	@Override
	public CursoAlumno getAllAlumnosByCurso(int idAlumno) throws Exception {
		
		return objCursoAlumnoDao.getAllAlumnosByCurso(idAlumno);
	}

}
