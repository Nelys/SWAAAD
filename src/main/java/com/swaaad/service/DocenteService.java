package com.swaaad.service;

import org.springframework.stereotype.Service;

import com.swaaad.model.Docente;

@Service
public interface DocenteService {

	void addDocente(Docente docente) throws Exception;

	Docente getDocenteById(int idDocente) throws Exception;

	void updateDocente(Docente docente) throws Exception;

}
