package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.ActividadPedagogicaDao;
import com.swaaad.model.ActividadPedagogica;
import com.swaaad.service.ActividadPedagogicaService;

@Service
public class ActividadPedagogicaServiceImpl implements ActividadPedagogicaService {
	@Autowired
	ActividadPedagogicaDao objActividadDao;

	@Override
	public void addActividad(ActividadPedagogica actividad) throws Exception {
		objActividadDao.addActividad(actividad);
	}

}
