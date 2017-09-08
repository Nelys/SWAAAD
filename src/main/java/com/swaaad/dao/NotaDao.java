package com.swaaad.dao;

import com.swaaad.model.Nota;

public interface NotaDao {
	void addNota(Nota nota) throws Exception;

	Nota getNotaById(int idNota) throws Exception;

	void updateNota(Nota nota) throws Exception;

	void deleteNota(int idNota) throws Exception;

}
