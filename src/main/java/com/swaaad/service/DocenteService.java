package com.swaaad.service;

import com.swaaad.model.Docente;

public interface DocenteService {

	void addDocente(Docente docente) throws Exception;

	Docente getDocenteById(int idDocente) throws Exception;

	void updateDocente(Docente docente) throws Exception;

}
