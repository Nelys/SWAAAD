package com.swaaad.dao;

import java.util.List;

import com.swaaad.model.Alumno;
import com.swaaad.model.Nota;

public interface NotaDao {
	void addNota(Nota nota) throws Exception;

	Nota getNotaById(int idNota) throws Exception;

	void updateNota(Nota nota) throws Exception;

	void deleteNota(int idNota) throws Exception;

	List<Nota> getAllNotas() throws Exception;

}
