package com.swaaad.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.AulaDinamica;
import com.swaaad.model.CursoAlumno;

/**
 * 
 * @author Christian
 * @version 1.0.0, 06/09/2017
 *	Referencia:
 *	Objetivo: Llama a los metodos de AulaDinamicaDao
 *	Funcionalidad: 
 *	
 *
 */
@Service
public interface AulaDinamicaService {
	/**
	 * Utiliza el metodo AddAulaDinamica de la clase AulaDinamicaDao
	 * 
	 * @throws Exception
	 */
	void addAulaDinamica(AulaDinamica aulaDinamica) throws Exception;

	/**
	 * Utiliza el metodo getAllAulaDinamica() de la AulaDinamicaDao
	 * 
	 * @return : Lista de AulaDinamica
	 * @throws Exception
	 */
	List<AulaDinamica> getAllAulasDinamicas() throws Exception;
	List<AulaDinamica> getAllAulasDinamicasByCurso(int idCurso) throws Exception;
	/**
	 * Utiliza el metodo getAulaDinamicaById(int idAulaDinamica) de la clase AulaDinamicaDao
	 * 
	 * @param idAulaDinamica
	 *            : id que identifica al AulaDinamica
	 * @return : Un AulaDinamica
	 * @throws Exception
	 */
	AulaDinamica getAulaDinamicaById(int idAulaDinamica) throws Exception;

	/**
	 * Utiliza el metodo updateAulaDinamica(AulaDinamica aulaDinamica) de la clase AulaDinamicaDao
	 * 
	 * @param AulaDinamica
	 *            : AulaDinamica a actualizar con nuevos valores
	 * @throws Exception
	 */
	void updateAulaDinamica(AulaDinamica aulaDinamica) throws Exception;

	/**
	 * Implementa el metodo deleteAulaDinamica(AulaDinamica aulaDinamica) de la clase AulaDinamicaDao
	 * 
	 * @param idAulaDinamica
	 *            : AulaDinamica a eliminar
	 * @throws Exception
	 */
	void deleteAulaDinamica(int idAulaDinamica) throws Exception;
	List<CursoAlumno> getAllAlumnosByCursoByEstado(int idCurso) throws Exception;

}
