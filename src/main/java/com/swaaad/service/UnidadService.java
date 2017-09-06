package com.swaaad.service;

import com.swaaad.model.Unidad;

public interface UnidadService {

	void addUnidad(Unidad unidad) throws Exception;

	Unidad getUnidadById(int idUnidad) throws Exception;

	void updateUnidad(Unidad unidad) throws Exception;

	void deleteUnidad(int idUnidad) throws Exception;

}
