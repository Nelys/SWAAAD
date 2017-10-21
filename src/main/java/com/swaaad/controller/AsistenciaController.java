package com.swaaad.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.AlumnoDTO;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.AsistenciaService;
import com.swaaad.service.CursoAlumnoService;

@Controller
public class AsistenciaController {
	private static final Logger logger = LoggerFactory.getLogger(AsistenciaController.class);

	@Autowired
	AsistenciaService objAsistenciaService;
	@Autowired
	AlumnosService objAlumnoService;

	@Autowired
	CursoAlumnoService objCursoAlumnoService;

	@RequestMapping(value = { "asistencias" }, method = RequestMethod.GET)
	public ModelAndView asistenciaPage(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("asistenciaPage");

		HttpServletRequest request1 = (HttpServletRequest) request;
		HttpSession session = request1.getSession(false);

		int idCurso = (Integer) session.getAttribute("idCurso");
		@SuppressWarnings("unused")
		List<CursoAlumno> listaAlumnosCursos = objCursoAlumnoService.getAllAlumnosByCurso(idCurso);

		System.out.println("mensaje de los cambios");
		model.addObject("listAlumnos", listaAlumnosCursos);
		model.setViewName("asistencias");

		return model;
	}

	 @RequestMapping(value = "/saveAsistencia", method = RequestMethod.POST)
	 public ModelAndView saveAsistencia(@ModelAttribute Asistencia asistencia)
	 throws Exception {
	
	 logger.info("saveAsistencia");
	
	 try {
	 if (asistencia.getIdAsistencia() == 0) {
	 objAsistenciaService.addAsistencia(asistencia);
	 } else {
	 objAsistenciaService.updateAsistencia(asistencia);
	 }
	
	 } catch (Exception e) {
	 e.getStackTrace();
	 }
	 return new ModelAndView("redirect:/asistencias");
	 }

	@RequestMapping(value = "/newAsistencia", method = RequestMethod.GET)
	public ModelAndView newAsistencia(ModelAndView model) throws Exception {
		logger.info("newAsistencia");
		Asistencia asistencia = new Asistencia();
		model.addObject("asistencia", asistencia);
		model.setViewName("form-asistencia");
		return model;
	}

	/**
	 * Controlador JSON Alumno por Id
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/guardarAsistenciaAlumno", method = RequestMethod.GET) // POST,produces
	@ResponseBody
	// recibe parametros de una peticion del navegador
	public AlumnoDTO getAlumnoById(@RequestParam("tipo") String tipo, @RequestParam("idAlumnoCurso") int idAlumnoCurso)
			throws Exception {
		// declaro un variable cursoAlumno de tipo CursoAlumno el cualguadara
		CursoAlumno cursoAlumno = objCursoAlumnoService.getCursoAlumnoById(idAlumnoCurso);
		Asistencia asistencia = new Asistencia();

		// objAsistenciaService.addAsistencia(asistencia);
		// METODO PARA GUARDAR ASISTENCIA
		return null;
	}

}
