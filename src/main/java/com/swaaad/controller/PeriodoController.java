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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Curso;
import com.swaaad.model.Docente;
import com.swaaad.model.Evaluacion;
import com.swaaad.model.Nota;
import com.swaaad.model.Periodo;
import com.swaaad.model.Usuario;
import com.swaaad.service.PeriodoService;

@Controller
public class PeriodoController {
	private static final Logger logger = LoggerFactory.getLogger(NotaController.class);

	@Autowired
	private PeriodoService objPeriodoService;

	@RequestMapping(value="/editPeriodo",method=RequestMethod.POST)
	public @ResponseBody PeriodoDTO getSearchUserProfiles( HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		return new PeriodoDTO(objPeriodoService.getAllPeriodoByIdCurso(idCurso).get(1).getDescripcion(),objPeriodoService.getAllPeriodoByIdCurso(idCurso).size());
	}

	@RequestMapping(value = "/savePeriodo", method = RequestMethod.GET)
	public ModelAndView savePeriodo(HttpServletRequest request, @RequestParam("descripcion") String descripcion, @RequestParam("numero") int numero) throws Exception {

		logger.info("saveNota");
		
		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");

		try {
			objPeriodoService.gestionarPeriodos(idCurso, descripcion, numero);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/listNota");
	}

	@RequestMapping(value = "/newPeriodo", method = RequestMethod.GET)
	public ModelAndView newPeriodo(ModelAndView model) throws Exception {
		logger.info("newNota");
		
		Nota nota = new Nota();
		model.addObject("nota", nota);
		model.setViewName("form-nota");
		return model;
	}
	
	@RequestMapping(value = "/selectPeriodo", method = RequestMethod.GET)
	public void selectPeriodo(HttpServletRequest request, HttpSession session, @RequestParam("idPeriodo") int idPeriodo)
			throws Exception {

		logger.info("selectPeriodo");
		
		session = request.getSession();
		session.setAttribute("idPeriodo", idPeriodo);
	}
}

class PeriodoDTO {
    private String descripcion;
    private int numero;
	public PeriodoDTO(String descripcion, int numero) {
		super();
		this.descripcion = descripcion;
		this.numero = numero;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	

}
