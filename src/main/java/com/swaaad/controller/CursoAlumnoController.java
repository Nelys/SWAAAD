package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.model.CursoAlumno;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.service.CursoAlumnoService;
import com.swaaad.service.UsuarioService;

public class CursoAlumnoController {
	private static final Logger logger = LoggerFactory.getLogger(CursoAlumnoController.class);
	@Autowired
	CursoAlumnoService objCursoAlumnoService;
	@Autowired
	UsuarioService objUsuarioService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/asistencias", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		
		ModelAndView model = new ModelAndView("asistencia-form");
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
		
		
		//int cursoId = Integer.parseInt(request.getParameter("id"));
		int cursoId=17;
		
		logger.info("asistenciaPage");
		//CursoAlumno AlumnoCurso = null;
		List<CursoAlumno> AlumnoCurso=null;
		
		try {
			AlumnoCurso = (List<CursoAlumno>) objCursoAlumnoService.getAllAlumnosByCurso(cursoId);
			for (CursoAlumno curso : AlumnoCurso) {
				 logger.info("[NOMBRES: "+curso.getAlumno() );
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addObject("listalumno", AlumnoCurso);

		return model;
	}
	

}
