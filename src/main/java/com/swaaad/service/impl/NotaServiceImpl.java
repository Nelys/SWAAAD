package com.swaaad.service.impl;

import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.EvaluacionDao;
import com.swaaad.dao.NotaDao;
import com.swaaad.model.Evaluacion;
import com.swaaad.model.Nota;
import com.swaaad.service.NotaService;

@Service
public class NotaServiceImpl implements NotaService{
    
	@Autowired
	NotaDao objNotaDao;
	
	@Autowired
    EvaluacionDao objEvaluacionDao;

	@Override
	public void addNota(Nota nota) throws Exception {
		objNotaDao.addNota(nota);
		this.obtenerPromedio(nota);
	}

    @Override
    public List<Nota> getAllNotas() throws Exception {
        
        return objNotaDao.getAllNotas();
    }

    @Override
    public List<Nota> getAllNotasByIdCurso(ServletRequest request) throws Exception {
        
        HttpServletRequest request1 = (HttpServletRequest)request;
        HttpSession session = request1.getSession(false);

        return objNotaDao.getAllNotasByIdCurso((Integer) session.getAttribute("idCurso"));
    }
    
	@Override
	public Nota getNotaById(int idNota) throws Exception {
		
		return objNotaDao.getNotaById(idNota);
	}

    @Override
    public int getIdNotaByIdAlumnoIdEvaluacion(int idAlumno, int idEvaluacion) throws Exception {
        
        return objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(idAlumno, idEvaluacion);
    }

	@Override
	public void updateNota(Nota nota) throws Exception {
		objNotaDao.updateNota(nota);
		this.obtenerPromedio(nota);
	}

	@Override
	public void deleteNota(int idNota) throws Exception {
		objNotaDao.deleteNota(idNota);
		
	}
	
	public void obtenerPromedio(Nota nota) throws Exception {
	    
//	    int iIdAlumno = nota.getIdAlumno();
		int iIdAlumno = nota.getAlumno().getIdAlumno();
	    
	    int iIdEvaluacionHijo = nota.getEvaluacion().getIdEvaluacion();
	    
	    Evaluacion evaluacionHijo = new Evaluacion();
	    
	    Evaluacion evaluacionPadre = new Evaluacion();
	    
	 // Declarando variables de librerias para la formula
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine ;
	    
	    while( iIdEvaluacionHijo != 0 ){
	        
	        engine = manager.getEngineByName("js");
	    nota =objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(iIdAlumno, iIdEvaluacionHijo));

        evaluacionHijo = objEvaluacionDao.getEvaluacionById(nota.getEvaluacion().getIdEvaluacion());//iIdEvaluacionHijo); //
        System.out.println("idEvaluacion:"+evaluacionHijo.getIdEvaluacion()+" idDependencia:" + evaluacionHijo.getIdEvaluacionDependencia());
        
        evaluacionPadre = objEvaluacionDao.getEvaluacionById(evaluacionHijo.getIdEvaluacionDependencia());
        
//        iIdEvaluacionHijo = evaluacionPadre.getIdEvaluacionDependencia();
        iIdEvaluacionHijo = evaluacionHijo.getIdEvaluacionDependencia();
        
        System.out.println("id: " + iIdEvaluacionHijo);
        
        for (Evaluacion evaluacionDependencia : objEvaluacionDao.getAllEvaluacionesByIdEvaluacionDependencia(evaluacionPadre.getIdEvaluacion())) {

//            if(evaluacion.getEsFormula()==1){
//                evaluacionDependencia.setIdEvaluacionDependencia(evaluacion.getIdEvaluacion());
                
                // Obtener notas de un alumno
//                Nota notaDependencia = objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(nota.getIdAlumno(), evaluacionDependencia.getIdEvaluacion()));
        	Nota notaDependencia = objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(nota.getAlumno().getIdAlumno(), evaluacionDependencia.getIdEvaluacion()));
                System.out.println( evaluacionDependencia.getIdEvaluacion() + " " +notaDependencia.getNotaEvaluativa() );
                if(notaDependencia == null){
                    System.out.println("idEvaluacion_" + evaluacionDependencia.getIdEvaluacion() + " " + 0);
                    engine.put("idEvaluacion_" + evaluacionDependencia.getIdEvaluacion(), 0);
                    System.out.println("hola2");
                } else {
                    System.out.println("idEvaluacion_" + evaluacionDependencia.getIdEvaluacion() + " " + notaDependencia.getNotaEvaluativa());
                    engine.put("idEvaluacion_" + evaluacionDependencia.getIdEvaluacion(), notaDependencia.getNotaEvaluativa());
                }
//                System.out.println("hola");
//            } else {
//                evaluacionDependencia.setIdEvaluacionDependencia(0);
//            }
//            objEvaluacionDao.updateEvaluacion(evaluacionDependencia);
        }
        int iRedondeo=0;
        
        // Obtener nota evaluativa de la formula
        //Nota notaEvaluativa = objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(nota.getIdAlumno(), evaluacionPadre.getIdEvaluacion()));
        Nota notaEvaluativa = objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(nota.getAlumno().getIdAlumno(), evaluacionPadre.getIdEvaluacion()));
        
//        if(evaluacion.getEsFormula()==1){
        
            // Generar Nota segun formula
            Double operation2 = (Double) engine.eval(evaluacionPadre.getFormula());
            
            System.out.println(operation2);
            iRedondeo= (int) Math.round(operation2);
            // Establecer nota evaluativa
            if (notaEvaluativa == null) {
                Nota notaPromedio = new Nota();
                notaPromedio.setAlumno(nota.getAlumno());
//                notaPromedio.setIdAlumno(nota.getIdAlumno());
                notaPromedio.setEvaluacion(evaluacionPadre);
                notaPromedio.setNotaEvaluativa(iRedondeo);
                objNotaDao.addNota(notaPromedio);
            } else {
                notaEvaluativa.setNotaEvaluativa(iRedondeo);
                objNotaDao.updateNota(notaEvaluativa);
                
            }
            engine = null;
            
//        } else {
//            nota.setNotaEvaluativa(0);
//            objNotaDao.updateNota(nota);
//        }
            
	    }
	    
	    
    }

}
