package com.swaaad.controller.rest;





import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.swaaad.dto.AlumnoDTO;

@RequestMapping("/ws")
@RestController
public class RestControllerSwaad {
	
	@RequestMapping("/alumno")
	public AlumnoDTO getAlumno() {
				
		AlumnoDTO alumnoDTO = new AlumnoDTO();
		alumnoDTO.setApellidos("Alberto");
		alumnoDTO.setIdAlumno(1);
		alumnoDTO.setNombres("asdasd");
		return alumnoDTO;
	}
}
