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
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.ActividadPedagogica;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.service.DocenteService;
import com.swaaad.service.UsuarioService;

@Controller
public class DocenteController {
	private static final Logger logger = LoggerFactory.getLogger(DocenteController.class);

	@Autowired
	DocenteService objDocenteService;
	
	@Autowired
	UsuarioService objUsuarioService;
	
	@RequestMapping(value = { "perfil" }, method = RequestMethod.GET)
	public ModelAndView datosDocente(ModelAndView model) throws Exception {

		logger.info("perfil Docente");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
		
		model.addObject("docente", docente);
		model.setViewName("perfil");
		
		return model;
	}
	
	@RequestMapping(value = { "/saveDocente" }, method = RequestMethod.GET)
	public ModelAndView saveDocente(@ModelAttribute Docente docente) throws Exception {

		logger.info("saveDocente");

		try {
			if (docente.getIdDocente() == 0) {
				objDocenteService.addDocente(docente);
			} else {
				objDocenteService.updateDocente(docente);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/docente");
	}

	@RequestMapping(value = "/newDocente", method = RequestMethod.GET)
	public ModelAndView newDocente(ModelAndView model) throws Exception {
		logger.info("nuevo Docente");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
		
		Docente docente = new Docente();
		model.addObject("docente", docente);
		model.setViewName("form-docente");
		return model;
	}

	@RequestMapping(value = "/editContraseñaDocente", method = RequestMethod.GET)
	public ModelAndView editContraseñaDocente(HttpServletRequest request) throws Exception {
		int docenteId = Integer.parseInt(request.getParameter("id"));
		logger.info("editContraseñaDocente" + docenteId);
		ModelAndView model = new ModelAndView("form-docente");
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
		
		Docente docente = null;
		try {
			docente = objDocenteService.getDocenteById(docenteId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addObject("docente", docente);

		return model;
	}

}
