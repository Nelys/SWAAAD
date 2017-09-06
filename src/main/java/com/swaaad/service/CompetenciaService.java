package com.swaaad.service;

import java.util.List;

import com.swaaad.model.Competencia;

public interface CompetenciaService {
	void addCompetencia(Competencia competencia) throws Exception;

	List<Competencia> getAllCompetencia() throws Exception;

	Competencia getCompetenciaById(int idCompetencia) throws Exception;

	void updateCompetencia(Competencia competencia) throws Exception;

	void deleteCompetencia(int idCompetencia) throws Exception;

}
