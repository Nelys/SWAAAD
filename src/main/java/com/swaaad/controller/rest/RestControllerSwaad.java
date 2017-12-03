package com.swaaad.controller.rest;





import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.swaaad.dto.AlumnoDTO;

@RequestMapping("/ws")
@RestController
public class RestControllerSwaad {
	
	@GetMapping("/alumno")
	public AlumnoDTO getAlumno() {
				
		AlumnoDTO alumnoDTO = new AlumnoDTO();
		alumnoDTO.setApellidos("Alberto");
		alumnoDTO.setIdAlumno(1);
		alumnoDTO.setNombres("asdasd");
		return alumnoDTO;
		
	}
	@PostMapping("/alumno")
	public ResponseEntity<?> getAlumno2(RequestEntity<AlumnoDTO> alum) {
	
		AlumnoDTO alumnoDTO = alum.getBody();
		
		return new ResponseEntity<AlumnoDTO>(alumnoDTO,HttpStatus.CREATED);
		
	}
}
