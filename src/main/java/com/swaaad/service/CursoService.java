package com.swaaad.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.Curso;

@Service
public interface CursoService {

	void addCurso(Curso curso) throws Exception;

	List<Curso> getAllCurso() throws Exception;

	Curso getCursoById(int idCurso) throws Exception;

	void updateCurso(Curso curso) throws Exception;

	void deleteCurso(int idCurso) throws Exception;

}
