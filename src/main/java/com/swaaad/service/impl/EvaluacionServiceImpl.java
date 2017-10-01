package com.swaaad.service.impl;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.EvaluacionDao;
import com.swaaad.model.Curso;
import com.swaaad.model.Evaluacion;
import com.swaaad.service.EvaluacionService;

@Service
public class EvaluacionServiceImpl implements EvaluacionService {

    @Autowired
    EvaluacionDao objEvaluacionDao;

    @Override
    public void addEvaluacion(Evaluacion evaluacion, ServletRequest request) throws Exception {

        HttpServletRequest request1 = (HttpServletRequest)request;
        HttpSession session = request1.getSession(false);
        evaluacion.setCurso(new Curso((Integer) session.getAttribute("idCurso"))); 
        
        objEvaluacionDao.addEvaluacion(evaluacion);

    }

    @Override
    public List<Evaluacion> getAllEvaluaciones() throws Exception {
        return objEvaluacionDao.getAllEvaluaciones();
    }
    
    @Override
    public List<Evaluacion> getAllEvaluacionesByIdCurso(ServletRequest request) throws Exception {
        
        HttpServletRequest request1 = (HttpServletRequest)request;
        HttpSession session = request1.getSession(false);

        return objEvaluacionDao.getAllEvaluacionesByIdCurso((Integer) session.getAttribute("idCurso"));
    }

    @Override
    public Evaluacion getEvaluacionById(int idEvaluacion) throws Exception {

        return objEvaluacionDao.getEvaluacionById(idEvaluacion);
    }

    @Override
    public void updateEvaluacion(Evaluacion evaluacion, ServletRequest request) throws Exception {
        
        HttpServletRequest request1 = (HttpServletRequest)request;
        HttpSession session = request1.getSession(false);
        evaluacion.setCurso(new Curso((Integer) session.getAttribute("idCurso"))); 
        
        objEvaluacionDao.updateEvaluacion(evaluacion);
    }

    @Override
    public void deleteEvaluacion(int idEvaluacion) throws Exception {
        objEvaluacionDao.deleteEvaluacion(idEvaluacion);

    }

}
