package com.swaaad.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Curso;
import com.swaaad.model.Docente;
import com.swaaad.model.Evaluacion;
import com.swaaad.model.Nota;
import com.swaaad.model.Periodo;
import com.swaaad.model.Usuario;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.EvaluacionService;
import com.swaaad.service.NotaService;
import com.swaaad.service.PeriodoService;
import com.swaaad.service.UsuarioService;


@Controller
//@SessionAttributes("sessionCurso")
public class NotaController {
	private static final Logger logger = LoggerFactory.getLogger(NotaController.class);
	
	@Autowired
	private UsuarioService objUsuarioService;
	
	@Autowired
	private NotaService objNotaService;
	
	@Autowired
	private AlumnosService objAlumnoService;
	
	@Autowired
	private EvaluacionService objEvaluacionService;
	
	@Autowired
	private PeriodoService objPeriodoService;

	@RequestMapping(value = { "listNota" }, method = RequestMethod.GET)
	public ModelAndView notasPage(ModelAndView model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        int idPeriodo = 0;
        if(session.getAttribute("idPeriodo")!=null){
        	idPeriodo = (Integer) session.getAttribute("idPeriodo");
        }
        
        System.out.println(idPeriodo);
        
		logger.info("notasPage");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
		
		
		
		List<Nota> ListarNota = null;
		
		ListarNota = objNotaService.getAllNotasByIdCurso(idCurso);
		
	    //System.out.println(ListarNota.size());
        
        /*for (Nota nota : ListarNota) {
            System.out.println(nota.getIdEvaluacion()+ " " +nota.getNotaEvaluativa());
        }*/
		
		Nota nota = new Nota();
		
		Evaluacion evaluacion = new Evaluacion();
		
		Periodo periodo = new Periodo();
		
		Curso curso = new Curso();
		
		model.addObject("nota", nota);
		
		model.addObject("periodo", periodo);
		
		model.addObject("curso", curso);
		
		model.addObject("idPeriodo", idPeriodo);
		
        model.addObject("evaluacion", evaluacion);

		model.addObject("listNotas", objNotaService.getAllNotasByIdCurso(idCurso));
		
		model.addObject("listEvaluaciones", objEvaluacionService.getAllEvaluacionesByIdCurso(idCurso));
		
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(idCurso));
		
		model.addObject("listPeriodos", objPeriodoService.getAllPeriodoByIdCurso(idCurso));
		
		String vista="listNota";
		System.out.println("********************"+vista);
		model.setViewName(vista);

		return model;
	}

	@RequestMapping(value = "/saveNota", method = RequestMethod.POST)
	public ModelAndView saveNota(@ModelAttribute Nota nota) throws Exception {

		logger.info("saveNota");

		try {
			if (nota.getIdNota() == 0) {
				objNotaService.addNota(nota);
			} else {
				objNotaService.updateNota(nota);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/notas");
	}

	@RequestMapping(value = "/newNota", method = RequestMethod.GET)
	public ModelAndView newNota(ModelAndView model) throws Exception {
		logger.info("newNota");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
    	
		
		Nota nota = new Nota();
		model.addObject("nota", nota);
		model.setViewName("form-nota");
		return model;
	}
	
	@RequestMapping(value = "/editNota", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView("form-nota");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
    	
		
		int notaId = Integer.parseInt(request.getParameter("id"));
		logger.info("editNota "+notaId);
		Nota nota = null;
		try {
			nota = objNotaService.getNotaById(notaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		model.addObject("nota", nota);

		return model;
	}

	@RequestMapping(value = "/deleteNota", method = RequestMethod.GET)
	public ModelAndView deleteNota(HttpServletRequest request) throws Exception {
		int notaId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteNota " + notaId);
		 try {
		objNotaService.deleteNota(notaId);
		 } catch (Exception e) {
		 e.printStackTrace();
		 }
		//
		return new ModelAndView("redirect:/notas");
	}
	

	@RequestMapping(value = "/selectPeriodo", method = RequestMethod.GET)
	public void selectPeriodo(HttpServletRequest request, HttpSession session, @RequestParam("idPeriodo") int idPeriodo)
			throws Exception {

		logger.info("selectPeriodo");
		
		session = request.getSession();
		session.setAttribute("idPeriodo", idPeriodo);
	}
}
