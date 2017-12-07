package com.swaaad.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.ActividadPedagogica;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.service.ActividadPedagogicaService;
import com.swaaad.service.CursoAlumnoService;
import com.swaaad.service.CursoService;
import com.swaaad.service.UsuarioService;

@Controller
public class ActividadPedagogicaController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	ActividadPedagogicaService objActividadPedagogicaService;

	@Autowired
	UsuarioService objUsuarioService;

	@Autowired
	CursoService objCursoService;

	@RequestMapping(value = { "actividades-pedagogicas" }, method = RequestMethod.GET)
	public ModelAndView listActividadPedagogica(ModelAndView model, HttpServletRequest request) throws Exception {
		HttpSession sess;
		sess = request.getSession(false);
		int a = (Integer) sess.getAttribute("idCurso");
		logger.info("actividadPedagogicaPage");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
		
		
		System.out.println(a + " desde actividad academica");
		List<ActividadPedagogica> ListarActividadPedagogica = null;
		ListarActividadPedagogica = objActividadPedagogicaService.getAllActividad();
		ActividadPedagogica actividadPedagogica = new ActividadPedagogica();
		model.addObject("actividadPedagogica", actividadPedagogica);
		model.addObject("listActividadPedagogica", ListarActividadPedagogica);
		model.setViewName("actividades-pedagogicas");

		return model;
	}

	@RequestMapping(value = "/saveActividadPedagogica", method = RequestMethod.POST)
	public ModelAndView saveActividadPedagogica(@ModelAttribute ActividadPedagogica actividadPedagogica,
			HttpServletRequest request) throws Exception {

		logger.info("saveActividadPedagogica");
		HttpSession session = request.getSession(false);
		int idCurso = (Integer) session.getAttribute("idCurso");
		actividadPedagogica.setCurso(objCursoService.getCursoById(idCurso));
		try {
			if (actividadPedagogica.getIdActividad() == 0) {
				objActividadPedagogicaService.addActividad(actividadPedagogica);
			} else {
				objActividadPedagogicaService.updateActividad(actividadPedagogica);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/actividades-pedagogicas");
	}

	@RequestMapping(value = "/newActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView newActividadPedagogica(ModelAndView model) throws Exception {
		logger.info("actividadPedagogicaPage");
		ActividadPedagogica actividadPedagogica = new ActividadPedagogica();
		model.addObject("actividadPedagogica", actividadPedagogica);
		model.setViewName("form-actividadPedagogica");
		return model;
	}

	@RequestMapping(value = "/editActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView editActividadPedagogica(HttpServletRequest request) throws Exception {

		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editActividadPedagogica " + alumnoId);
		ActividadPedagogica actividadPedagogica = null;
		try {
			actividadPedagogica = objActividadPedagogicaService.getActividadById(alumnoId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(actividadPedagogica.getIdActividad());
		System.out.println(actividadPedagogica.getDescripcion());
		System.out.println(actividadPedagogica.getFecha());

		ModelAndView model = new ModelAndView("form-actividadPedagogica");
		model.addObject("actividadPedagogica", actividadPedagogica);

		return model;
	}

	@RequestMapping(value = "/deleteActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView deleteActividadPedagogica(HttpServletRequest request) throws Exception {
		int actividadPedagogicaId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteactividadPedagogica " + actividadPedagogicaId);
		try {
			objActividadPedagogicaService.deleteActividad(actividadPedagogicaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//
		return new ModelAndView("redirect:/actividades-pedagogicas");
	}

	@RequestMapping(value = "/calendarioActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView calendarioActividadPedagogica(ModelAndView model) throws Exception {
		logger.info("actividadPedagogicaPage");
		ActividadPedagogica actividadPedagogica = new ActividadPedagogica();
		model.addObject("actividadPedagogica", actividadPedagogica);
		model.setViewName("actividades-pedagogicas-calendario");
		return model;
	}
}
