package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.model.Capacidad;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.CapacidadService;

public class CapacidadController {
	private static final Logger logger = LoggerFactory.getLogger(CapacidadController.class);
	@Autowired
	CapacidadService objCapacidadService;

	@RequestMapping(value = { "Capacidad" }, method = RequestMethod.GET)
	public ModelAndView alumnosPage(ModelAndView model) throws Exception {

		logger.info("alumnosPage");
		//
		List<Capacidad> ListarCapacidad = null;

		ListarCapacidad = objCapacidadService.getAllCapacidad();

		Capacidad capacidad = new Capacidad();

		model.addObject("capacidad", capacidad);
		model.addObject("listCapacidad", ListarCapacidad);

		
		model.setViewName("capacidad");

		return model;
	}

	@RequestMapping(value = "/saveCapacidad", method = RequestMethod.POST)
	public ModelAndView saveAlumno(@ModelAttribute Capacidad capacidad) throws Exception {

		logger.info("saveCapacidad");

		try {
			if (capacidad.getIdCapacidad() == 0) {
				objCapacidadService.addCapacidad(capacidad);
			} else {
				objCapacidadService.updateCapacidad(capacidad);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/capacidad");
	}

	@RequestMapping(value = "/newCapacidad", method = RequestMethod.GET)
	public ModelAndView newAlumno(ModelAndView model) throws Exception {
		logger.info("newCapacidad");
		Capacidad capacidad = new Capacidad();
		model.addObject("capacidad", capacidad);
		model.setViewName("form-capacidad");
		return model;
	}

	@RequestMapping(value = "/editAlumno", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {

		int capacidadId = Integer.parseInt(request.getParameter("id"));
		logger.info("editCapacidad " + capacidadId);
		Capacidad capacidad = null;
		try {
			capacidad = objCapacidadService.getCapacidadById(capacidadId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-capacidad");
		model.addObject("capacidad", capacidad);

		return model;
	}

	@RequestMapping(value = "/deleteCapacidad", method = RequestMethod.GET)
	public ModelAndView deleteCapacidad(HttpServletRequest request) throws Exception {
		int capacidadId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteCapacidad " + capacidadId);
		try {
			objCapacidadService.deleteCapacidad(capacidadId);
		} catch (Exception e) {
			// // TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		return new ModelAndView("redirect:/capacidad");
	}
}
