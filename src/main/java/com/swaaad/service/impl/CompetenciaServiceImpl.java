package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.CompetenciaDao;
import com.swaaad.model.Competencia;
import com.swaaad.service.CompetenciaService;

@Service
public class CompetenciaServiceImpl implements CompetenciaService {
	@Autowired
	CompetenciaDao objCompetenciaDao;

	@Override
	public void addCompetencia(Competencia competencia) throws Exception {
		objCompetenciaDao.addCompetencia(competencia);

	}

	@Override
	public List<Competencia> getAllCompetencia() throws Exception {
		
		return objCompetenciaDao.getAllCompetencia();
	}

	@Override
	public Competencia getCompetenciaById(int idCompetencia) throws Exception {
		
		return objCompetenciaDao.getCompetenciaById(idCompetencia);
	}

	@Override
	public void updateCompetencia(Competencia competencia) throws Exception {
		objCompetenciaDao.updateCompetencia(competencia);

	}

	@Override
	public void deleteCompetencia(int idCompetencia) throws Exception {
		objCompetenciaDao.deleteCompetencia(idCompetencia);

	}

}
