package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.PeriodoDao;
import com.swaaad.model.Periodo;
import com.swaaad.service.PeriodoService;

@Service
public class PeriodoServiceImpl implements PeriodoService {
	@Autowired
	PeriodoDao objPeriodoDao;

	@Override
	public void addPeriodo(Periodo periodo) throws Exception {
		objPeriodoDao.addPeriodo(periodo);
	}

	@Override
	public Periodo getPeriodoById(int idPeriodo) throws Exception {

		return objPeriodoDao.getPeriodoById(idPeriodo);
	}

	@Override
	public void updatePeriodo(Periodo periodo) throws Exception {
		objPeriodoDao.updatePeriodo(periodo);
	}

	@Override
	public void deletePeriodo(int idPeriodo) throws Exception {
		objPeriodoDao.deletePeriodo(idPeriodo);

	}

}
