package com.swaaad.dao;

import java.util.List;

import com.swaaad.dto.NotasAlumno;
import com.swaaad.model.Nota;

/**
 * 
 * @author Nelys Mollocondo
 * @version 1.0.0, 20/08/2017
 * @see NotaDao
 * @Creacion
 * ******************************************************************
 * 
 * @author Christian Vilca
 * @version 2.0.0, 21/08/2017
 * @see NotaDao
 * @Modificacion: Se añadieron metodos de consulta
 */

public interface NotaDao {
    
    /**
     * crea un nota en la base de datos, recíbe como un parametro una nota
     * 
     * @param nota
     * @throws Exception
     */
	void addNota(Nota nota) throws Exception;

	/**
     * Recupera una lista de notas de la base de datos
     * 
     * @return : Lista de Notas
     * @throws Exception
     */
    List<Nota> getAllNotas() throws Exception;
    
    /**
     * Recupera una lista de notas de la base de datos
     * 
     * @return : Lista de Notas
     * @throws Exception
     */
    List<Nota> getAllNotasByIdCurso(int idCurso) throws Exception;
    
    /**
     * Recupera una nota de la base de datos
     * 
     * @param idNota
     * @return
     * @throws Exception
     */
	Nota getNotaById(int idNota) throws Exception;
	
	/**
     * Recupera una nota de la base de datos
     * 
     * @param idAlumno, idEvaluacion
     * @return
     * @throws Exception
     */
    int getIdNotaByIdAlumnoIdEvaluacion(int idAlumno, int idEvaluacion) throws Exception;

	/**
     * Actualiza un nota en la base de datos
     * 
     * @param nota
     * @throws Exception
     */
	void updateNota(Nota nota) throws Exception;
	
	/**
     * Elimina un nota
     * @param idNota
     * @throws Exception
     */
	void deleteNota(int idNota) throws Exception;

}
