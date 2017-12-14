package com.swaaad.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.ActividadPedagogica;

@Service
public interface ActividadPedagogicaService {
	void addActividad(ActividadPedagogica actividad) throws Exception;
	
	List<ActividadPedagogica> getAllActividad() throws Exception;

	ActividadPedagogica getActividadById(int actividad) throws Exception;

	void updateActividad(ActividadPedagogica actividad) throws Exception;

	void deleteActividad(int idActividad) throws Exception;
	List<ActividadPedagogica> getAllActividadByCurso(int id_curso) throws Exception;

	List<ActividadPedagogica> getRecordatorioByUsuario(int id_usuario) throws Exception;

	
}
