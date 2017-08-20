package com.swaaad.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.swaaad.model.Alumno;
import com.swaaad.service.AlumnosService;

@CrossOrigin
@RestController
@RequestMapping("/apirest/alumno")
public class AlumnosController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnosController.class);
	@Autowired
	AlumnosService objAlumnoService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody List<Alumno> getEmployee() {

		List<Alumno> employeeList = null;
		try {

			employeeList = objAlumnoService.getAllAlumnos();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return employeeList;
	}

}
