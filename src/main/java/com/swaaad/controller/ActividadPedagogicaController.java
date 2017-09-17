package com.swaaad.controller;

import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.ActividadPedagogica;
import com.swaaad.service.ActividadPedagogicaService;

@Controller
public class ActividadPedagogicaController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	ActividadPedagogicaService objActividadPedagogicaService;

	@RequestMapping(value = { "actividades-pedagogicas" }, method = RequestMethod.GET)
	public ModelAndView listActividadPedagogica(ModelAndView model, HttpSession sess, HttpServletRequest request) throws Exception {

		logger.info("actividadPedagogicaPage");
		
		sess = request.getSession(false);
		
		int a = (Integer) sess.getAttribute("idCurso");
		
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
	public ModelAndView saveActividadPedagogica(@ModelAttribute ActividadPedagogica actividadPedagogica) throws Exception {

		logger.info("saveActividadPedagogica");

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
		logger.info("editActividadPedagogica "+alumnoId);
		ActividadPedagogica actividadPedagogica = null;
		try {
			actividadPedagogica = null;//objAlumnoService.getAlumnoById(alumnoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
}
