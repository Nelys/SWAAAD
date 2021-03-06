package com.swaaad.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class AppController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	

	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "home";
	}

//	@RequestMapping(value = { "/perfil" }, method = RequestMethod.GET)
//	public String perfilPage(ModelMap model) {
//		return "perfil";
//	}

//	@RequestMapping(value = { "/cursos" }, method = RequestMethod.GET)
//	public String cursosPage(ModelMap model) {
//		return "cursos";
//	}

	
//	@RequestMapping(value = { "/evaluaciones" }, method = RequestMethod.GET)
//	public String evaluacionesPage(ModelMap model) {
//		return "evaluaciones";
//	}

//	@RequestMapping(value = { "/asistencias" }, method = RequestMethod.GET)
//	public String asistenciasPage(ModelMap model) {
//		return "asistencias";
//	}

//	@RequestMapping(value = { "/actividades-pedagogicas" }, method = RequestMethod.GET)
//	public String actividadesPedagogicasPage(ModelMap model) {
//		return "actividades-pedagogicas";
//	}

//	@RequestMapping(value = { "/aula-dinamica" }, method = RequestMethod.GET)
//	public String aulaDinamicaPage(ModelMap model) {
//		System.out.println("hola ");
//		return "aula-dinamica";
//	}

	@RequestMapping(value = { "/participacion" }, method = RequestMethod.GET)
	public String participacionPage(ModelMap model) {
		return "participacion";
	}

	@RequestMapping(value = { "/grupos" }, method = RequestMethod.GET)
	public String gruposPage(ModelMap model) {
		return "grupos";
	}

}