package com.swaaad.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.ActividadPedagogicaDao;
import com.swaaad.model.ActividadPedagogica;
import com.swaaad.service.ActividadPedagogicaService;

@Service
public class ActividadPedagogicaServiceImpl implements ActividadPedagogicaService {
	@Autowired
	private ActividadPedagogicaDao objActividadDao;

	@Override
	public void addActividad(ActividadPedagogica actividad) throws Exception {
		objActividadDao.addActividad(actividad);
	}

	@Override
	public ActividadPedagogica getActividadById(int idActividad) throws Exception {
		return objActividadDao.getActividadById(idActividad);
	}

	@Override
	public void updateActividad(ActividadPedagogica actividad) throws Exception {
		objActividadDao.updateActividad(actividad);
		
	}

	@Override
	public void deleteActividad(int idActividad) throws Exception {
		objActividadDao.deleteActividad(idActividad);
	}

	@Override
	public List<ActividadPedagogica> getAllActividad() throws Exception {
		// TODO Auto-generated method stub
		return objActividadDao.getAllActividad();
	}

	@Override
	public List<ActividadPedagogica> getAllActividadByCurso(int id_curso) throws Exception {
		// TODO Auto-generated method stub
		return objActividadDao.getAllActividadesByCurso(id_curso);
	}

}
