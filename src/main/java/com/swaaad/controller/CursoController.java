package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Curso;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.service.CursoService;
import com.swaaad.service.DocenteService;
import com.swaaad.service.UsuarioService;

@Controller
public class CursoController {
	private static final Logger logger = LoggerFactory.getLogger(CursoController.class);
	@Autowired
	private CursoService objCursoService;

	@Autowired
	private UsuarioService objUsuarioService;

	@Autowired
	private DocenteService objDocenteService;

	@RequestMapping(value = { "cursos" }, method = RequestMethod.GET)
	public ModelAndView cursosPage(ModelAndView model) throws Exception {
		logger.info("cursosPage");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
		List<Curso> ListarCurso = null;
		ListarCurso = objCursoService.listCursoByDocente(docente.getIdDocente());

		Curso curso = new Curso();

		model.addObject("curso", curso);
		model.addObject("idDocente", docente.getIdDocente());
		model.addObject("listCursos", ListarCurso);
		model.setViewName("cursos");
		return model;
	}

	@RequestMapping(value = "/saveCurso", method = RequestMethod.POST)
	public ModelAndView saveCurso(@ModelAttribute Curso curso) throws Exception {
		logger.info("saveCurso");

		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
//		model.addObject("user", userName);
		
		curso.setDocente(objDocenteService.getDocenteById(docente.getIdDocente()));
//		curso.setEstado((byte) '1');
		
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

	@RequestMapping(value = "/editCurso", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView("form-curso");

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);

		int cursoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editCurso " + cursoId);
		Curso curso = null;
		try {
			curso = objCursoService.getCursoById(cursoId);
		} catch (Exception e) {
			e.printStackTrace();
		}

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

			e.printStackTrace();
		}

		return new ModelAndView("redirect:/cursos");
	}

	@RequestMapping(value = "/selectCurso", method = RequestMethod.GET)
	public ModelAndView selectCurso(ModelAndView model, HttpServletRequest request, HttpSession session)
			throws Exception {

		logger.info("alumnosPage");

		int idCurso = Integer.parseInt(request.getParameter("id"));
		session = request.getSession();
		session.setAttribute("idDocente", 1);
		session.setAttribute("idCurso", idCurso);
		session.setAttribute("idPeriodo", 0);

		return new ModelAndView("redirect:/alumnos");
	}
//	
//	@RequestMapping(value = "/EstadoCurso/{estado}", method = RequestMethod.POST)
//	public ModelAndView EstadoCurso(@PathVariable("estado") byte estado) throws Exception {
//		logger.info("saveCurso");
//
//		
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		UserDetails userDetails = null;
//		if (principal instanceof UserDetails) {
//			userDetails = (UserDetails) principal;
//		}
//		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
//		Docente docente = usuario.getDocentes().get(0);
//		String userName = docente.getApellidos() + " ," + docente.getNombre();
////		model.addObject("user", userName);
//		
////		curso.setDocente(objDocenteService.getDocenteById(docente.getIdDocente()));
////		curso.setEstado(estado);
////					
////		objCursoService.updateCurso(curso);
//			
//	
//		return new ModelAndView("redirect:/cursos");
//	}

}
