package com.swaaad.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;

import org.springframework.stereotype.Service;

import com.swaaad.model.Curso;

@Service
public interface CursoService {

	void addCurso(Curso curso) throws Exception;

	List<Curso> getAllCurso() throws Exception;

	Curso getCursoById(int idCurso) throws Exception;

	void updateCurso(Curso curso) throws Exception;

	void deleteCurso(int idCurso) throws Exception;

	List<Curso> listCursoByDocente(int idDocente) throws Exception;

	List<Curso> listCursoByEstado(int idDocente) throws Exception;

}
