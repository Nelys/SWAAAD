package com.swaaad.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swaaad.model.Docente;
import com.swaaad.service.DocenteService;

public class DocenteController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	DocenteService objDocenteService;

	// AlumnosService objAlumnoService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Se ejecuta el metodo docente ");

		try {
			Docente docente = new Docente();
			docente.setNombre("Carlos");
			docente.setApellidos("Supo Mollocondo");
			docente.setGenero("M");
			docente.setEmail("Carlos@gmail.com");
			docente.setContrasena("123456");
			docente.setFoto("f");

			objDocenteService.addDocente(docente);

			System.out.println(docente.getApellidos());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "home";
	}

}
