package com.swaaad.service;

import java.util.List;

import javax.servlet.ServletRequest;

import com.swaaad.model.Nota;

/**
 * 
 * @author Nelys Mollocondo
 * @version 1.0.0, 20/08/2017
 * @see NotaService
 * @Creacion
 * ******************************************************************
 * 
 * @author Christian Vilca
 * @version 2.0.0, 21/08/2017
 * @see NotaService
 * @Modificacion: Se añadieron metodos de consulta
 */

public interface NotaService {
    
    /**
     * Utiliza el metodo AddNota de la clase NotaDao
     * 
     * @throws Exception
     */
    void addNota(Nota nota) throws Exception;

    /**
     * Utiliza el metodo getAllNotas() de la NotasDao
     * 
     * @return : Lista de Notas
     * @throws Exception
     */
    List<Nota> getAllNotas() throws Exception;

    /**
     * Utiliza el metodo getAllNotasByIdCurso() de la NotasDao
     * 
     * @return : Lista de Notas por curso
     * @throws Exception
     */
    List<Nota> getAllNotasByIdCurso(int idCurso) throws  Exception;
    
    /**
     * Utiliza el metodo getNotaById(int idNota) de la clase NotasDao
     * 
     * @param idNota
     *            : id que identifica al nota
     * @return : Un nota
     * @throws Exception
     */
    Nota getNotaById(int idNota) throws Exception;
    
    /**
     * Utiliza el metodo getNotaByIdAlumnoIdEvaluacion(int idAlumno, int idEvaluacion) de la clase NotasDao
     * 
     * @param idNota
     *            : id que identifica al nota
     * @return : Un nota
     * @throws Exception
     */
    int getIdNotaByIdAlumnoIdEvaluacion(int idAlumno, int idEvaluacion) throws Exception;

    /**
     * Utiliza el metodo updateNota(Nota nota) de la clase NotaDao
     * 
     * @param nota
     *            : nota a actualizar con nuevos valores
     * @throws Exception
     */
    void updateNota(Nota nota) throws Exception;

    /**
     * Implementa el metodo deleteNota(Nota nota) de la clase NotaDao
     * 
     * @param nota
     *            : nota a eliminar
     * @throws Exception
     */
    void deleteNota(int idNota) throws Exception;
}
