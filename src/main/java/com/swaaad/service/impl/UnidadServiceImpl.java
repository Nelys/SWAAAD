package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.UnidadDao;
import com.swaaad.model.Unidad;
import com.swaaad.service.UnidadService;

@Service
public class UnidadServiceImpl implements UnidadService {
	@Autowired
	UnidadDao objUnidadDao;

	@Override
	public void addUnidad(Unidad unidad) throws Exception {
		objUnidadDao.addUnidad(unidad);

	}

	@Override
	public Unidad getUnidadById(int idUnidad) throws Exception {
		return objUnidadDao.getUnidadById(idUnidad);
	}

	@Override
	public void updateUnidad(Unidad unidad) throws Exception {
		objUnidadDao.updateUnidad(unidad);

	}

	@Override
	public void deleteUnidad(int idUnidad) throws Exception {
		objUnidadDao.deleteUnidad(idUnidad);

	}

}
