package com.swaaad.service;

import java.util.List;

import com.swaaad.model.CursoAlumno;

public interface CursoAlumnoService {

	void addCursoAlumno(CursoAlumno cursoAlumno) throws Exception;

	CursoAlumno getCursoAlumnoById(int idCursoAlumno) throws Exception;

	void updateCursoAlumno(CursoAlumno cursoAlumno) throws Exception;

	List<CursoAlumno> getAllAlumnosByCurso(int idCurso) throws Exception;

}
