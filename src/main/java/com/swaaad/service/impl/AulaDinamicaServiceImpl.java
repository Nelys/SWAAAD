package com.swaaad.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.controller.AulaDinamicaController;
import com.swaaad.dao.AulaDinamicaDao;
import com.swaaad.model.AulaDinamica;
import com.swaaad.model.CursoAlumno;
import com.swaaad.service.AulaDinamicaService;

@Service
public class AulaDinamicaServiceImpl implements AulaDinamicaService{
	private static final Logger logger = LoggerFactory.getLogger(AulaDinamicaController.class);
	@Autowired
	private AulaDinamicaDao objAulaDinamicaDao;
	
	@Override
	public void addAulaDinamica(AulaDinamica aulaDinamica) throws Exception {
		logger.info("addAulaDinamica");
		objAulaDinamicaDao.addAulaDinamica(aulaDinamica);
	}

	@Override
	public List<AulaDinamica> getAllAulasDinamicas() throws Exception {
		logger.info("getAllAulasDinamicas");
		return objAulaDinamicaDao.getAllAulasDinamicas();
	}

	@Override
	public AulaDinamica getAulaDinamicaById(int idAulaDinamica) throws Exception {
		logger.info("getAulaDinamicaById");
		return objAulaDinamicaDao.getAulaDinamicaById(idAulaDinamica);
	}

	@Override
	public void updateAulaDinamica(AulaDinamica aulaDinamica) throws Exception {
		logger.info("updateAulaDinamica");
		objAulaDinamicaDao.updateAulaDinamica(aulaDinamica);
	}

	@Override
	public void deleteAulaDinamica(int idAulaDinamica) throws Exception {
		logger.info("deleteAulaDinamica");
		objAulaDinamicaDao.deleteAulaDinamica(idAulaDinamica);
	}

	@Override
	public List<CursoAlumno> getAllAlumnosByCursoByEstado(int idCurso) throws Exception {
		// TODO Auto-generated method stub
		return objAulaDinamicaDao.getAllAlumnosByCursoByEstado(idCurso);
	}

}
