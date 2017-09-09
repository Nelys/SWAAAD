package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Curso;
import com.swaaad.service.CursoService;

@Controller
public class CursoController {
	private static final Logger logger = LoggerFactory.getLogger(CursoController.class);
	@Autowired
	CursoService objCursoService;

	@RequestMapping(value = { "cursos" }, method = RequestMethod.GET)
	public ModelAndView cursosPage(ModelAndView model) throws Exception {

		logger.info("cursosPage");
		//
		List<Curso> ListarCurso = null;

		ListarCurso = objCursoService.getAllCurso();

		Curso curso = new Curso();

		model.addObject("curso", curso);
		model.addObject("listCursos", ListarCurso);

//		model.setViewName("pages/cursos/cursos");
		model.setViewName("cursos");

		return model;
	}

	@RequestMapping(value = "/saveCurso", method = RequestMethod.POST)
	public ModelAndView saveCurso(@ModelAttribute Curso curso) throws Exception {

		logger.info("saveCurso");

		try {
			if (curso.getIdCurso() == 0) {
				objCursoService.addCurso(curso);
			} else {
				objCursoService.updateCurso(curso);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/cursos");
	}

	@RequestMapping(value = "/newCurso", method = RequestMethod.GET)
	public ModelAndView newCurso(ModelAndView model) throws Exception {
		logger.info("newCurso");
		Curso curso = new Curso();
		model.addObject("curso", curso);
		model.setViewName("form-curso");
		return model;
	}
	
	@RequestMapping(value = "/newHorario", method = RequestMethod.GET)
	public ModelAndView newHorario(ModelAndView model) throws Exception {
		logger.info("newCurso");
//		Curso curso = new Curso();
//		model.addObject("curso", curso);
		model.setViewName("form-horario");
		return model;
	}

	@RequestMapping(value = "/editCurso", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		
		int cursoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editCurso "+cursoId);
		Curso curso = null;
		try {
			curso = objCursoService.getCursoById(cursoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-curso");
		model.addObject("curso", curso);

		return model;
	}

	@RequestMapping(value = "/deleteCurso", method = RequestMethod.GET)
	public ModelAndView deleteCurso(HttpServletRequest request) throws Exception {
		int cursoId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteCurso " + cursoId);
		 try {
		objCursoService.deleteCurso(cursoId);
		 } catch (Exception e) {
		// // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		//
		return new ModelAndView("redirect:/cursos");
	}
}
