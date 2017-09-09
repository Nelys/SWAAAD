package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.NotaDao;
import com.swaaad.model.Nota;
import com.swaaad.service.NotaService;

@Service
public class NotaServiceImpl implements NotaService{
	@Autowired
	NotaDao objNotaDao;

	@Override
	public void addNota(Nota nota) throws Exception {
		objNotaDao.addNota(nota);
		
	}

	@Override
	public Nota getNotaById(int idNota) throws Exception {
		
		return objNotaDao.getNotaById(idNota);
	}

	@Override
	public void updateNota(Nota nota) throws Exception {
		objNotaDao.updateNota(nota);
		
	}

	@Override
	public void deleteNota(int idNota) throws Exception {
		objNotaDao.deleteNota(idNota);
		
	}

	@Override
	public List<Nota> getAllNotas() throws Exception {
		
		return objNotaDao.getAllNotas();
	}

}
