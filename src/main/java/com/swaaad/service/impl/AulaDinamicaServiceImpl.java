package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.AulaDinamicaDao;
import com.swaaad.model.AulaDinamica;
import com.swaaad.service.AulaDinamicaService;

@Service
public class AulaDinamicaServiceImpl implements AulaDinamicaService{

	@Autowired
	AulaDinamicaDao objAulaDinamicaDao;
	
	@Override
	public void addAulaDinamica(AulaDinamica aulaDinamica) throws Exception {
		
		objAulaDinamicaDao.addAulaDinamica(aulaDinamica);
	}

	@Override
	public List<AulaDinamica> getAllAulasDinamicas() throws Exception {
		
		return objAulaDinamicaDao.getAllAulasDinamicas();
	}

	@Override
	public AulaDinamica getAulaDinamicaById(int idAulaDinamica) throws Exception {
		
		return objAulaDinamicaDao.getAulaDinamicaById(idAulaDinamica);
	}

	@Override
	public void updateAulaDinamica(AulaDinamica aulaDinamica) throws Exception {
		
		objAulaDinamicaDao.updateAulaDinamica(aulaDinamica);
	}

	@Override
	public void deleteAulaDinamica(int idAulaDinamica) throws Exception {
		
		objAulaDinamicaDao.deleteAulaDinamica(idAulaDinamica);
	}

}
