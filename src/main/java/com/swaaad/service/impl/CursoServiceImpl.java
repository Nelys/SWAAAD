package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.CursoDao;
import com.swaaad.model.Curso;
import com.swaaad.service.CursoService;

@Service
public class CursoServiceImpl implements CursoService {

	@Autowired
	private CursoDao objCursoDao;

	@Override
	public void addCurso(Curso curso) throws Exception {
		objCursoDao.addCurso(curso);

	}

	@Override
	public List<Curso> getAllCurso() throws Exception {
		return objCursoDao.getAllCurso();
	}

	@Override
	public Curso getCursoById(int idCurso) throws Exception {
		return objCursoDao.getCursoById(idCurso);
	}

	@Override
	public void updateCurso(Curso curso) throws Exception {
		objCursoDao.updateCurso(curso);

	}

	@Override
	public void deleteCurso(int idCurso) throws Exception {
		objCursoDao.deleteCurso(idCurso);

	}

}
