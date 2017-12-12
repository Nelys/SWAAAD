package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.PeriodoDao;
import com.swaaad.model.Periodo;
import com.swaaad.service.PeriodoService;

@Service
public class PeriodoServiceImpl implements PeriodoService {

	@Autowired
	private PeriodoDao objPeriodoDao;

	@Override
	public void addPeriodo(Periodo Periodo) throws Exception {
		objPeriodoDao.addPeriodo(Periodo);
	}

	@Override
	public List<Periodo> getAllPeriodo() throws Exception {
		return objPeriodoDao.getAllPeriodo();
	}
	
	@Override
	public List<Periodo> getAllPeriodoByIdCurso(int idCurso) throws Exception {
		return objPeriodoDao.getAllPeriodoByIdCurso(idCurso);
	}

	@Override
	public Periodo getPeriodoById(int idPeriodo) throws Exception {
		return objPeriodoDao.getPeriodoById(idPeriodo);
	}

	@Override
	public void updatePeriodo(Periodo Periodo) throws Exception {
		objPeriodoDao.updatePeriodo(Periodo);

	}

	@Override
	public void deletePeriodo(int idPeriodo) throws Exception {
		objPeriodoDao.deletePeriodo(idPeriodo);
	}

	@Override
	public List<Periodo> listPeriodoByCurso(int idCurso) throws Exception {
		return objPeriodoDao.listPeriodoByCurso(idCurso);
	}

}
