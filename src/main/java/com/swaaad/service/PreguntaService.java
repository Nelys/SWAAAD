package com.swaaad.service;

import com.swaaad.model.Pregunta;

public interface PreguntaService {
	void addPregunta(Pregunta pregunta) throws Exception;

	Pregunta getPreguntaById(int idPregunta) throws Exception;

	void updatePregunta(Pregunta pregunta) throws Exception;

	void deletePregunta(int idPregunta) throws Exception;
}
