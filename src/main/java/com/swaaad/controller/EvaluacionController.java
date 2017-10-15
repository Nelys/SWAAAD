package com.swaaad.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.model.Evaluacion;
import com.swaaad.service.EvaluacionService;

@Controller
public class EvaluacionController {
    private static final Logger logger = LoggerFactory.getLogger(NotaController.class);

    @Autowired
    EvaluacionService objEvaluacionService;
    
    @RequestMapping(value = "/newEvaluacion", method = RequestMethod.GET)
    public ModelAndView newEvaluacion(ModelAndView model, HttpServletRequest request) throws Exception {
        logger.info("newEvaluacion");
        Evaluacion evaluacion = new Evaluacion();
        model.addObject("listEvaluaciones", objEvaluacionService.getAllEvaluacionesByIdCurso(request));
        model.addObject("evaluacion", evaluacion);
        model.setViewName("form-evaluacion");
        return model;
    }
    
    @RequestMapping(value = "/saveEvaluacion", method = RequestMethod.POST)
    public ModelAndView saveEvaluacion(@ModelAttribute Evaluacion evaluacion, HttpServletRequest request) throws Exception {

        logger.info("saveEvaluacion");

//        System.out.println("hola desde saveEvaluacion");
        try {
            if (evaluacion.getIdEvaluacion() == 0) {
                objEvaluacionService.addEvaluacion(evaluacion, request);
            } else {
                objEvaluacionService.updateEvaluacion(evaluacion, request);
            }

        } catch (Exception e) {
            e.getStackTrace();
        }
        return new ModelAndView("redirect:/listNota");
    }
    
    @RequestMapping(value = "/editEvaluacion", method = RequestMethod.GET)
    public ModelAndView editContact(HttpServletRequest request) throws Exception {
        
        int idEvaluacion = Integer.parseInt(request.getParameter("id"));
        logger.info("editEvaluacion ", idEvaluacion);
        Evaluacion evaluacion= null;
        try {
            evaluacion = objEvaluacionService.getEvaluacionById(idEvaluacion);
        } catch (Exception e) {
            logger.info("Excepcion en edicion: ", e);
        }
        ModelAndView model = new ModelAndView("form-evaluacion");
        model.addObject("listEvaluaciones", objEvaluacionService.getAllEvaluacionesByIdCurso(request));
        model.addObject("evaluacion", evaluacion);

        return model;
    }
}
