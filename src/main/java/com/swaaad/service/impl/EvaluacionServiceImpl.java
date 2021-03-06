package com.swaaad.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.dao.CursoDao;
import com.swaaad.dao.EvaluacionDao;
import com.swaaad.dao.NotaDao;
import com.swaaad.dao.PeriodoDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Curso;
import com.swaaad.model.Evaluacion;
import com.swaaad.model.Nota;
import com.swaaad.model.Periodo;
import com.swaaad.service.EvaluacionService;

@Service
public class EvaluacionServiceImpl implements EvaluacionService {

    @Autowired
    private EvaluacionDao objEvaluacionDao;
    
    @Autowired
    private AlumnosDao objAlumnoDao;
    
    @Autowired
    private NotaDao objNotaDao;

    @Autowired
    private CursoDao objCurso;

    @Autowired
    private PeriodoDao objPeriodo;
    
    @Override
    public void addEvaluacion(Evaluacion evaluacion) throws Exception {

        objEvaluacionDao.addEvaluacion(evaluacion);
        
        this.obtenerFormula(evaluacion);
    }

    @Override
    public List<Evaluacion> getAllEvaluaciones() throws Exception {
        return objEvaluacionDao.getAllEvaluaciones();
    }
    
    @Override
    public List<Evaluacion> getAllEvaluacionesByIdCurso(int idCurso) throws Exception {

        return objEvaluacionDao.getAllEvaluacionesByIdCurso(idCurso);
    }
    
    @Override
    public List<Evaluacion> getAllEvaluacionesByIdPeriodo(int idPeriodo) throws Exception {

        return objEvaluacionDao.getAllEvaluacionesByIdPeriodo(idPeriodo);
    }

    @Override
    public Evaluacion getEvaluacionById(int idEvaluacion) throws Exception {

        return objEvaluacionDao.getEvaluacionById(idEvaluacion);
    }

    @Override
    public void updateEvaluacion(Evaluacion evaluacion) throws Exception {

        objEvaluacionDao.updateEvaluacion(evaluacion);
        
        this.obtenerFormula(evaluacion);
            
    }

    @Override
    public void deleteEvaluacion(int idEvaluacion) throws Exception {
        objEvaluacionDao.deleteEvaluacion(idEvaluacion);

    }
    
    @Override
    public String validarFormula(String formula) throws Exception {
    	String sTexto = formula + " ";
        String sTextoBuscado = "idEvaluacion_";
        int contador = 0;
        Boolean bNumero= true;
        String sNumero="";
        List<Integer> intListIdEvaluciones = new ArrayList<Integer>();
        while (sTexto.indexOf(sTextoBuscado) > -1) {
            sTexto = sTexto.substring(sTexto.indexOf(sTextoBuscado)+sTextoBuscado.length(),sTexto.length());
            contador = 1;
            bNumero= true;
            while (bNumero == true){
                 
                sNumero = sTexto.substring(0, contador);
                
                // Comprobando si es numero
                if (sNumero.matches("[0-9]+") == true) {
                    contador++;
                } else {
                    sNumero = sTexto.substring(0, contador-1);
                    intListIdEvaluciones.add(Integer.parseInt( sNumero ));
                    bNumero=false;
                }
            }
        }
        
        sTexto = formula + " ";
        sTextoBuscado = ".";
        contador = 0;
        bNumero= true;
        sNumero="";
        List<Double> dListPorcentaje = new ArrayList<Double>();
        while (sTexto.indexOf(sTextoBuscado) > -1) {
            sTexto = sTexto.substring(sTexto.indexOf(sTextoBuscado)+sTextoBuscado.length(),sTexto.length());
            contador = 1;
            bNumero= true;
            while (bNumero == true){
                 
                sNumero = sTexto.substring(0, contador);
                
                // Comprobando si es numero
                if (sNumero.matches("[0-9]+") == true) {
                    contador++;
                } else {
                    sNumero = sTexto.substring(0, contador-1);
                    dListPorcentaje.add(Double.parseDouble( "0." + sNumero ));
                    bNumero=false;
                }
            }
        }
        Double porcentaje=0.0;
        if(formula.indexOf(".") != -1){
	        for (Double integer : dListPorcentaje) {
	        	porcentaje += integer;
			}
	    	
	        if (porcentaje!= 1.0){
	        	porcentaje = 1.0 - porcentaje;
	        	return "Porcentaje:" + porcentaje + "  del porcentaje en la formula";
	        }
        }
        
        
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("js");
        try {
	        for (Integer integer : intListIdEvaluciones) {
	            engine.put("idEvaluacion_" + integer, 1);
	        }
	        
	        Double operation2 = (Double) engine.eval(formula);
	        System.out.println("Resultado: " + operation2);
	        return (operation2.isNaN() || operation2.isInfinite()) ? operation2.toString() : "Correcto"; 
        } catch (Exception e) {
        	e.getStackTrace();
    		return "Error: " + e ;
		}
    }
    
    public void obtenerFormula(Evaluacion evaluacion) throws ScriptException, Exception{
        // Obtener los idEvalucion de la formula
        String sTexto = evaluacion.getFormula() + " ";
        String sTextoBuscado = "idEvaluacion_";
        int contador = 0;
        Boolean bNumero= true;
        String sNumero="";
        List<Integer> intListIdEvaluciones = new ArrayList<Integer>();
        while (sTexto.indexOf(sTextoBuscado) > -1) {
            sTexto = sTexto.substring(sTexto.indexOf(sTextoBuscado)+sTextoBuscado.length(),sTexto.length());
            contador = 1;
            bNumero= true;
            while (bNumero == true){
                 
                sNumero = sTexto.substring(0, contador);
                
                // Comprobando si es numero
                if (sNumero.matches("[0-9]+") == true) {
                    contador++;
                } else {
                    sNumero = sTexto.substring(0, contador-1);
                    intListIdEvaluciones.add(Integer.parseInt( sNumero ));
                    bNumero=false;
                }
            }
        }
        
        
        // Declarando variables de librerias para la formula
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("js");
        
        sTexto = evaluacion.getFormula();
        int iRedondeo=0;
        
        // Generar y guardar solucion de la formula
        for (Alumno alumno : objAlumnoDao.getAllAlumnosByIdCurso(evaluacion.getPeriodo().getCurso().getIdCurso())){ // session.getAttribute("idCurso"))) {
            for (Integer integer : intListIdEvaluciones) {
                
                // Actualizar el campo ID_EVALUACION_DEPENDENCIA de la tabla Evaluacion
                Evaluacion evaluacionDependencia = objEvaluacionDao.getEvaluacionById(integer);
                
                if(evaluacion.getEsFormula()==1){
                    evaluacionDependencia.setIdEvaluacionDependencia(evaluacion.getIdEvaluacion());
                    
                    // Obtener notas de un alumno
                    Nota nota = objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(alumno.getIdAlumno(), integer));
                    if(nota == null){
                        engine.put("idEvaluacion_" + integer, 0);
                    } else {
                        engine.put("idEvaluacion_" + integer, nota.getNotaEvaluativa());
                    }
                } else {
                    evaluacionDependencia.setIdEvaluacionDependencia(0);
                }
                objEvaluacionDao.updateEvaluacion(evaluacionDependencia);
                
            }
            
            // Obtener nota evaluativa de la formula
            Nota nota = objNotaDao.getNotaById(objNotaDao.getIdNotaByIdAlumnoIdEvaluacion(alumno.getIdAlumno(), evaluacion.getIdEvaluacion()));
            System.out.println("desde el servicio: " + nota.getIdNota());
            if(evaluacion.getEsFormula()==1){
                // Generar Nota segun formula
                Double operation2 = (Double) engine.eval(evaluacion.getFormula());
                iRedondeo= (int) Math.round(operation2);
                
                // Establecer nota evaluativa
                if (nota.getIdNota() == 0) {
                	System.out.println("ingreso a Guardar");
                    Nota notaPromedio = new Nota();
                    
//                    notaPromedio.setIdAlumno(alumno.getIdAlumno());
                    notaPromedio.setAlumno(alumno);
                    System.out.println(alumno.getIdAlumno());
                    notaPromedio.setEvaluacion(evaluacion);
                    System.out.println(evaluacion.getIdEvaluacion());
                    notaPromedio.setNotaEvaluativa(iRedondeo);
                    System.out.println(iRedondeo);
                    objNotaDao.addNota(notaPromedio);
                } else {
                	System.out.println("ingreso a actualizar");
                    nota.setNotaEvaluativa(iRedondeo);
                    objNotaDao.updateNota(nota);
                }
            } else {
                nota.setNotaEvaluativa(0);
                objNotaDao.updateNota(nota);
            }
        }
    }

}
