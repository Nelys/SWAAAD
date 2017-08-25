package com.swaaad.service;

import java.util.List;

import com.swaaad.model.ActividadPedagogica;

public interface ActividadPedagogicaService {
	void addActividad(ActividadPedagogica actividad) throws Exception;

	ActividadPedagogica getActividadById(int actividad) throws Exception;

	void updateActividad(ActividadPedagogica actividad) throws Exception;

	void deleteActividad(int idActividad) throws Exception;

	List<ActividadPedagogica> getAllActividad() throws Exception;
}
