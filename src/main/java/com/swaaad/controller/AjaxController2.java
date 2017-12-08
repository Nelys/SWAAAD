package com.swaaad.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaaad.dto.AlumnoDTO;
import com.swaaad.dto.EvaluacionDTO;
import com.swaaad.dto.NotaDTO;
import com.swaaad.dto.NotasAlumno;
import com.swaaad.model.Alumno;
import com.swaaad.model.Evaluacion;
import com.swaaad.model.Nota;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.EvaluacionService;
import com.swaaad.service.NotaService;

@Controller
public class AjaxController2 {

	@Autowired
	AlumnosService objAlumno;

	@Autowired
	NotaService objNotaService;

	@Autowired
	AlumnosService objAlumnoService;

	@Autowired
	EvaluacionService objEvaluacionService;

	@RequestMapping(value = "/demo1", method = RequestMethod.GET)
	@ResponseBody
	public String demo1() {
		return "Demo 1";
	}

	/**
	 * Controlador JSON Alumno por Id
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/prepararNota", method = RequestMethod.GET) // POST,produces
																			// =
																			// MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void prepararNota(@RequestParam("idNota") int idNota, @RequestParam("idAlumno") int idAlumno,
			@RequestParam("idEvaluacion") int idEvaluacion, @RequestParam("notaEvaluativa") int notaEvaluativa)
			throws Exception {
	    System.out.println("*****************prepararNota ");
		Evaluacion evaluacion = new Evaluacion();
		evaluacion.setIdEvaluacion(idEvaluacion);

		Nota nota = new Nota();
		nota.setIdNota(idNota);
		// obtener el alumno	
		nota.setAlumno(objAlumno.getAlumnoById(idAlumno));
		nota.setEvaluacion(evaluacion);
		nota.setNotaEvaluativa(notaEvaluativa);

		try {
			if (nota.getIdNota() == 0) {
			    System.out.println("guardara "+nota.getIdNota());
				objNotaService.addNota(nota);
			} else {
			    System.out.println("actualizara "+nota.getIdNota());
				objNotaService.updateNota(nota);
			}

		} catch (Exception e) {
		    System.out.println("error");
			e.getStackTrace();
			System.out.println(e.getMessage());
		}

		System.out.println("Datos: " + idAlumno);
		// return "Hola desde prepadarNota";
		// return new ModelAndView("redirect:/listNota");
		// Alumno alumno = new Alumno();
		// alumno = objAlumnoService.getAlumnoById(idAlumno);
		// return new Alumno(alumno.getIdAlumno(),alumno.getApellidos(),
		// alumno.getNombres()) ;
	}

	/**
	 * Controlador JSON Alumno por Id
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAlumnoById", method = RequestMethod.GET) // POST,produces
																			// =
																			// MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public AlumnoDTO getAlumnoById(@RequestParam("idAlumno") int idAlumno) throws Exception {

		Alumno alumno = new Alumno();
		alumno = objAlumnoService.getAlumnoById(idAlumno);
		return new AlumnoDTO(alumno.getIdAlumno(), alumno.getApellidos(), alumno.getNombres());
	}

	/**
	 * Controlador JSON Evaluacion por Id
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/getEvaluacionById", method = RequestMethod.GET) // POST,produces
																				// =
																				// MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public EvaluacionDTO getEvaluacionById(@RequestParam("idEvaluacion") int idEvaluacion) throws Exception {

		Evaluacion evaluacion = new Evaluacion();
		evaluacion = objEvaluacionService.getEvaluacionById(idEvaluacion);
		return new EvaluacionDTO(evaluacion.getIdEvaluacion(), evaluacion.getNombre(), evaluacion.getDescripcion(),
				evaluacion.getColor());
	}

	/**
	 * Controlador JSON Guardado de notas
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/getIdNota", method = RequestMethod.GET) // POST,produces
																		// =
																		// MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int getIdNota(@RequestParam("idAlumno") int idAlumno, @RequestParam("idEvaluacion") int idEvaluacion)
			throws Exception {

		return objNotaService.getIdNotaByIdAlumnoIdEvaluacion(idAlumno, idEvaluacion);
	}

	/**
	 * Controlador JSON listado de notas
	 */
	@RequestMapping(value = "/json4", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Nota4Wrapper json4Page(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		List<NotasAlumno> result = new ArrayList<NotasAlumno>();
		for (Nota nota : objNotaService.getAllNotasByIdCurso(idCurso)) {
			result.add(new NotasAlumno(nota.getIdNota(), nota.getAlumno().getIdAlumno(), nota.getEvaluacion().getIdEvaluacion(),
					nota.getNotaEvaluativa()));
		}

		return new Nota4Wrapper(result);
	}
	/**
	 * Controlador JSON listado de notas
	 */
	@RequestMapping(value = "/luis", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public AlumnoDTO json4Page() throws Exception {
		AlumnoDTO alumnoDTO = new AlumnoDTO();
		alumnoDTO.setApellidos("Alberto");
		alumnoDTO.setIdAlumno(1);
		alumnoDTO.setNombres("asdasd");
		return alumnoDTO;
	}


	@RequestMapping(value = "/json3", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Nota2Wrapper json3Page(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		List<NotaDTO> result = new ArrayList<NotaDTO>();
		for (Nota nota : objNotaService.getAllNotasByIdCurso(idCurso)) {
			result.add(new NotaDTO(nota.getIdNota(), nota.getAlumno().getIdAlumno(), nota.getNotaEvaluativa()));
		}

		return new Nota2Wrapper(result);
	}

	@RequestMapping(value = "/json2", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public NotaWrapper json2Page(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		List<String> result = new ArrayList<String>();
		for (Nota nota : objNotaService.getAllNotasByIdCurso(idCurso)) {
			result.add(String.valueOf(nota.getIdNota()));
		}
		System.out.println("hola");

		return new NotaWrapper(result);
	}

	@RequestMapping(value = "/jsonw", method = RequestMethod.GET, consumes = "application/json")
	@ResponseBody
	public NotaWrapper jsonWPage(@RequestBody NotaWrapper notas, HttpServletRequest request) throws Exception {

		System.out.println("hola");
		
		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");

		List<String> result = new ArrayList<String>();
		for (Nota nota : objNotaService.getAllNotasByIdCurso(idCurso)) {
			result.add(String.valueOf(nota.getIdNota()));// new
															// Nota(nota.getIdNota(),nota.getIdAlumno(),nota.getNotaEvaluativa()));
		}

		return new NotaWrapper(result);
	}

	@RequestMapping(value = "/json", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Nota> jsonPage(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		List<Nota> result = new ArrayList<Nota>();
		for (Nota nota : objNotaService.getAllNotasByIdCurso(idCurso)) {
			// result.add(new Nota(nota.getIdNota(),nota.getIdAlumno(),
			// nota.getIdEvaluacion(),nota.getNotaEvaluativa()));
		}
		System.out.println("hola");

		return result;
	}

	@RequestMapping(value = "/jsonnota", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public NotaWrapper jsonNotaPage() {

		List<String> result = new ArrayList<String>();
		result.add("Hello World!");

		return new NotaWrapper(result);
	}

	public class Nota4Wrapper {

		List<NotasAlumno> notas;

		public Nota4Wrapper(List<NotasAlumno> message) {
			this.notas = message;
		}

		/**
		 * @return the persons
		 */
		public List<NotasAlumno> getNotas() {
			return notas;
		}

		/**
		 * @param persons
		 *            the persons to set
		 */
		public void setNotas(List<NotasAlumno> notas) {
			this.notas = notas;
		}
	}

	public class Nota2Wrapper {

		List<NotaDTO> notas;

		public Nota2Wrapper(List<NotaDTO> message) {
			this.notas = message;
		}

		/**
		 * @return the persons
		 */
		public List<NotaDTO> getNotas() {
			return notas;
		}

		/**
		 * @param persons
		 *            the persons to set
		 */
		public void setNotas(List<NotaDTO> notas) {
			this.notas = notas;
		}
	}

	public class NotaWrapper {

		List<String> notas;

		public NotaWrapper(List<String> message) {
			this.notas = message;
		}

		/**
		 * @return the persons
		 */
		public List<String> getNotas() {
			return notas;
		}

		/**
		 * @param persons
		 *            the persons to set
		 */
		public void setNotas(List<String> notas) {
			this.notas = notas;
		}
	}

}
