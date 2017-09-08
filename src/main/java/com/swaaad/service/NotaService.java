package com.swaaad.service;

import com.swaaad.model.Nota;

public interface NotaService {
	void addNota(Nota nota) throws Exception;

	Nota getNotaById(int idNota) throws Exception;

	void updateNota(Nota nota) throws Exception;

	void deleteNota(int idNota) throws Exception;

}
