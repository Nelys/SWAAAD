package com.swaaad.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.Periodo;

@Service
public interface PeriodoService {
	
	void gestionarPeriodos(int idCurso, String descripccion, int numero) throws Exception;

	void addPeriodo(Periodo periodo) throws Exception;

	List<Periodo> getAllPeriodo() throws Exception;
	
	List<Periodo> getAllPeriodoByIdCurso(int idCurso) throws Exception;

	Periodo getPeriodoById(int idPeriodo) throws Exception;

	void updatePeriodo(Periodo periodo) throws Exception;

	void deletePeriodo(int idPeriodo) throws Exception;
	
	List<Periodo> listPeriodoByCurso(int idCurso) throws Exception;
}
