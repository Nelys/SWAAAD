package com.swaaad.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.AlumnoDTO;
import com.swaaad.dto.AulaDinamicaDTO;
import com.swaaad.model.AulaDinamica;
import com.swaaad.model.CursoAlumno;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.AulaDinamicaService;
import com.swaaad.service.CursoAlumnoService;
import com.swaaad.service.UsuarioService;

@CrossOrigin
@Controller
public class AulaDinamicaController {
	private static final Logger logger = LoggerFactory.getLogger(AulaDinamicaController.class);
	@Autowired
	private AulaDinamicaService objAulaDinamicaService;

	@Autowired
	UsuarioService objUsuarioService;

	@Autowired
	private CursoAlumnoService objCursoAlumnoService;

	@RequestMapping(value = { "aula-dinamica" }, method = RequestMethod.GET)
	public ModelAndView aulaDinamicasPage(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("aulaDinamicasPage");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
		
		
		
		//

		// aulas dinamicas por curso
		List<AulaDinamica> ListarAulaDinamica = null;

		ListarAulaDinamica = objAulaDinamicaService.getAllAulasDinamicas();
		HttpSession session = request.getSession(false);

		int iIdCurso = (Integer) session.getAttribute("idCurso");

		int idCurso = 1;
		AulaDinamica aulaDinamica = new AulaDinamica();

		model.addObject("aulaDinamica", aulaDinamica);
		model.addObject("listAulaDinamica", ListarAulaDinamica);
		model.addObject("listAlumnos", objCursoAlumnoService.getAllAlumnosByCurso(iIdCurso));
		model.setViewName("aula-dinamica");

		return model;
	}

	@RequestMapping(value = "/saveAulaDinamica2", method = RequestMethod.POST)
	@ResponseBody
	public AlumnoDTO saveAulaDinamica2(@ModelAttribute AulaDinamicaDTO aulaDinamica, HttpServletRequest request)
			throws Exception {

		logger.info("saveAulaDinamica " + aulaDinamica.getIdAulaDinamica());
		System.out.println("sdsdasd  " + aulaDinamica.getIdAulaDinamica());
		try {
			if (aulaDinamica.getIdAulaDinamica() == 0) {
				System.out.println("saveAulaDinamica");
				AulaDinamica aDinamica2 = new AulaDinamica();
				CursoAlumno cursoAlumno = objCursoAlumnoService.getCursoAlumnoById(aulaDinamica.getCursoAlumno());
				System.out.println("esta es el ID " + cursoAlumno.getIdCursoAlumno());
				aDinamica2.setCoordX(aulaDinamica.getCoordX());
				aDinamica2.setCoordY(aulaDinamica.getCoordY());
				aDinamica2.setColorFondo(aulaDinamica.getColorFondo());
				aDinamica2.setColorTexto(aulaDinamica.getColorTexto());
				aDinamica2.setCursoAlumno(cursoAlumno);

				System.out.println("saveAulaDinamica");
				System.out.println("addAulaDinamica");

				objAulaDinamicaService.addAulaDinamica(aDinamica2);
			} else {
				System.out.println("updateAlaDinamica");
				AulaDinamica aDinamica2 = objAulaDinamicaService.getAulaDinamicaById(aulaDinamica.getIdAulaDinamica());

				aDinamica2.setCoordX(aulaDinamica.getCoordX());
				aDinamica2.setCoordY(aulaDinamica.getCoordY());
				System.out.println("updateAulaDinamica");
				objAulaDinamicaService.updateAulaDinamica(aDinamica2);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new AlumnoDTO();
	}

	@RequestMapping(value = "/saveAulaDinamica", method = RequestMethod.POST)
	public ModelAndView saveAulaDinamica(@ModelAttribute AulaDinamicaDTO aulaDinamica, HttpServletRequest request)
			throws Exception {

		logger.info("saveAulaDinamica " + aulaDinamica.getIdAulaDinamica());
		System.out.println("sdsdasd  " + aulaDinamica.getIdAulaDinamica());

		AulaDinamica aDinamica2 = objAulaDinamicaService.getAulaDinamicaById(aulaDinamica.getIdAulaDinamica());

		aDinamica2.setCoordX(aulaDinamica.getCoordX());
		aDinamica2.setCoordY(aulaDinamica.getCoordY());
		aDinamica2.setColorFondo(aulaDinamica.getColorFondo());
		aDinamica2.setColorTexto(aulaDinamica.getColorTexto());

		System.out.println("saveAulaDinamica");
		try {
			if (aulaDinamica.getIdAulaDinamica() == 0) {
				System.out.println("addAulaDinamica");

				objAulaDinamicaService.addAulaDinamica(aDinamica2);
			} else {
				System.out.println("updateAulaDinamica");
				objAulaDinamicaService.updateAulaDinamica(aDinamica2);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/aula-dinamica");
	}

	@RequestMapping(value = "/newAulaDinamica", method = RequestMethod.GET)
	public ModelAndView newAulaDinamica(ModelAndView model) throws Exception {
		logger.info("newAulaDinamica");
		AulaDinamica aulaDinamica = new AulaDinamica();
		model.addObject("aulaDinamica", aulaDinamica);
		model.setViewName("form-aulaDinamica");
		return model;
	}

	@RequestMapping(value = "/editAulaDinamica", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {

		int aulaDinamicaId = Integer.parseInt(request.getParameter("id"));
		logger.info("editAulaDinamica " + aulaDinamicaId);
		AulaDinamica aulaDinamica = null;
		try {
			aulaDinamica = objAulaDinamicaService.getAulaDinamicaById(aulaDinamicaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-aulaDinamica");
		model.addObject("aulaDinamica", aulaDinamica);

		return model;
	}

	@RequestMapping(value = "/deleteAulaDinamica", method = RequestMethod.GET)
	public ModelAndView deleteAulaDinamica(HttpServletRequest request) throws Exception {
		int aulaDinamicaId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAulaDinamica " + aulaDinamicaId);
		try {
			objAulaDinamicaService.deleteAulaDinamica(aulaDinamicaId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/aulaDinamicas");
	}
}
