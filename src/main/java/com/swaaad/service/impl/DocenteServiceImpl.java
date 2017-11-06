package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.DocenteDao;
import com.swaaad.model.Docente;
import com.swaaad.service.DocenteService;

@Service
public class DocenteServiceImpl implements DocenteService {
	
	@Autowired
	private DocenteDao objDocente;

	@Override
	public void addDocente(Docente docente) throws Exception {
		objDocente.addDocente(docente);

	}

	@Override
	public Docente getDocenteById(int idDocente) throws Exception {
		
		return objDocente.getDocenteById(idDocente);
	}

	@Override
	public void updateDocente(Docente docente) throws Exception {
		objDocente.updateDocente(docente);
		
	}
}
