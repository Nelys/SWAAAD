package com.swaaad.service;

import java.util.List;

import com.swaaad.model.Capacidad;

public interface CapacidadService {
	void addCapacidad(Capacidad capacidad) throws Exception;

	List<Capacidad> getAllCapacidad() throws Exception;

	Capacidad getCapacidadById(int idCapacidad) throws Exception;

	void updateCapacidad(Capacidad capacidad) throws Exception;

	void deleteCapacidad(int idCapacidad) throws Exception;

}
