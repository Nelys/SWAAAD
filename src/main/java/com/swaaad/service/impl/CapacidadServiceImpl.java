package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.CapacidadDao;
import com.swaaad.model.Capacidad;
import com.swaaad.service.CapacidadService;

@Service
public class CapacidadServiceImpl implements CapacidadService {
	@Autowired
	CapacidadDao objCapacidadDao;

	@Override
	public void addCapacidad(Capacidad capacidad) throws Exception {
		objCapacidadDao.addCapacidad(capacidad);
	}

	@Override
	public List<Capacidad> getAllCapacidad() throws Exception {
		
		return objCapacidadDao.getAllCapacidad();
	}

	@Override
	public Capacidad getCapacidadById(int idCapacidad) throws Exception {
		// TODO Auto-generated method stub
		return objCapacidadDao.getCapacidadById(idCapacidad);
	}

	@Override
	public void updateCapacidad(Capacidad capacidad) throws Exception {
		objCapacidadDao.updateCapacidad(capacidad);

	}

	@Override
	public void deleteCapacidad(int idCapacidad) throws Exception {
		objCapacidadDao.deleteCapacidad(idCapacidad);

	}

}
