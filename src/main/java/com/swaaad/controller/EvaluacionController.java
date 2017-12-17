package com.swaaad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.EvaluacionDTO;
import com.swaaad.model.Alumno;
import com.swaaad.model.Docente;
import com.swaaad.model.Evaluacion;
import com.swaaad.model.Usuario;
import com.swaaad.service.EvaluacionService;
import com.swaaad.service.PeriodoService;
import com.swaaad.service.UsuarioService;

@Controller
public class EvaluacionController {
    private static final Logger logger = LoggerFactory.getLogger(NotaController.class);

    @Autowired
    private EvaluacionService objEvaluacionService;
	
	@Autowired
	private UsuarioService objUsuarioService;
	
	@Autowired
	private PeriodoService objPeriodoService;
	
	@RequestMapping(value="/validarFormula",method=RequestMethod.POST)
	public @ResponseBody String validarFormula(@RequestParam("formula") String formula) throws Exception {
		 
        EvaDTO eva= null;
        String mensaje="";
        try {
        	mensaje = objEvaluacionService.validarFormula(formula);

		} catch (Exception e) {
			e.getStackTrace();
		}
        
        return mensaje;
	}
	
	@RequestMapping(value="/generarFormula/{idEvaluacion}",method=RequestMethod.POST)
	public @ResponseBody EvaDTO generarFormula(@PathVariable("idEvaluacion") int idEvaluacion) throws Exception {
		 
		
        Evaluacion evaluacion = null;
        EvaDTO eva= null;
        try {
        	evaluacion = objEvaluacionService.getEvaluacionById(idEvaluacion);
        	eva = new EvaDTO(evaluacion.getColorFondo(), evaluacion.getColorTexto(), evaluacion.getNombre());
		} catch (Exception e) {
			e.getStackTrace();
		}
		return eva;
	}
	
    @RequestMapping(value = "/newEvaluacion", method = RequestMethod.GET)
    public ModelAndView newEvaluacion(ModelAndView model, HttpServletRequest request) throws Exception {
    	
    	HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
    	
        logger.info("newEvaluacion");
        
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
        
        Evaluacion evaluacion = new Evaluacion();
        evaluacion.setColorFondo("#ffffff");
        evaluacion.setColorTexto("#000000");
        model.addObject("listEvaluaciones", objEvaluacionService.getAllEvaluacionesByIdCurso(idCurso));
        model.addObject("evaluacion", evaluacion);
        model.setViewName("form-evaluacion");
        return model;
    }
    
    @RequestMapping(value = "/saveEvaluacion", method = RequestMethod.POST)
    public ModelAndView saveEvaluacion(@ModelAttribute Evaluacion evaluacion, HttpServletRequest request) throws Exception {

        logger.info("saveEvaluacion");

        HttpSession session = request.getSession(false);
        int idPeriodo = (Integer) session.getAttribute("idPeriodo");
        evaluacion.setPeriodo(objPeriodoService.getPeriodoById(idPeriodo));
        
        try {
            if (evaluacion.getIdEvaluacion() == 0) {
                objEvaluacionService.addEvaluacion(evaluacion);
            } else {
                objEvaluacionService.updateEvaluacion(evaluacion);
            }

        } catch (Exception e) {
        	System.out.println(e);
            e.getStackTrace();
        }
        return new ModelAndView("redirect:/listNota");
    }
    
    @RequestMapping(value = "/editEvaluacion", method = RequestMethod.GET)
    public ModelAndView editContact(HttpServletRequest request) throws Exception {
        
        ModelAndView model = new ModelAndView("form-evaluacion");
    	
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
    	
		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
		
        int idEvaluacion = Integer.parseInt(request.getParameter("id"));
        logger.info("editEvaluacion ", idEvaluacion);
        Evaluacion evaluacion= null;
        try {
            evaluacion = objEvaluacionService.getEvaluacionById(idEvaluacion);
        } catch (Exception e) {
            logger.info("Excepcion en edicion: ", e);
        }

        model.addObject("listEvaluaciones", objEvaluacionService.getAllEvaluacionesByIdCurso(idCurso));
        model.addObject("evaluacion", evaluacion);

        return model;
    }
}

class EvaDTO {
    private String colorFondo;
    private String colorTexto;
    private String nombre;
	public EvaDTO(String colorFondo, String colorTexto, String nombre) {
		super();
		this.colorFondo = colorFondo;
		this.colorTexto = colorTexto;
		this.nombre = nombre;
	}
	public String getColorFondo() {
		return colorFondo;
	}
	public void setColorFondo(String colorFondo) {
		this.colorFondo = colorFondo;
	}
	public String getColorTexto() {
		return colorTexto;
	}
	public void setColorTexto(String colorTexto) {
		this.colorTexto = colorTexto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	

}