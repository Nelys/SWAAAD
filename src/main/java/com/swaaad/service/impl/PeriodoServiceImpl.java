package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.CursoDao;
import com.swaaad.dao.PeriodoDao;
import com.swaaad.model.Periodo;
import com.swaaad.service.PeriodoService;

@Service
public class PeriodoServiceImpl implements PeriodoService {

	@Autowired
	private CursoDao objCursoDao;
	
	@Autowired
	private PeriodoDao objPeriodoDao;

	@Override
	public void gestionarPeriodos(int idCurso, String descripcion, int numero) throws Exception {
		int numPeriodos=numero-objPeriodoDao.getAllPeriodoByIdCurso(idCurso).size();
		
		Periodo periodo = new Periodo();
		
		for (int i = 1; i < numPeriodos; i++) {
			periodo = objPeriodoDao.getPeriodoByNumeroByIdCurso(numero, idCurso);
			periodo.setDescripcion(descripcion);
			periodo.setNumeroPeriodos(numero);
			periodo.setCurso(objCursoDao.getCursoById(idCurso));
			objPeriodoDao.updatePeriodo(periodo);
		}
		
		for (int i = numPeriodos+1; i < numero; i++) {
			periodo = new Periodo();
			periodo.setDescripcion(descripcion);
			periodo.setNumeroPeriodos(numero);
			periodo.setCurso(objCursoDao.getCursoById(idCurso));
			objPeriodoDao.addPeriodo(periodo);
		}
	}
	
	@Override
	public void addPeriodo(Periodo periodo) throws Exception {
		objPeriodoDao.addPeriodo(periodo);
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
	public void updatePeriodo(Periodo periodo) throws Exception {
		objPeriodoDao.updatePeriodo(periodo);

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
