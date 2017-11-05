package com.swaaad.controller;

import java.io.InputStream;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.reports.AlumnoReport;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.UsuarioService;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

@Controller
public class AlumnoController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	AlumnosService objAlumnoService;
	@Autowired
	UsuarioService objUsuarioService;
	@RequestMapping(value = { "alumnos" }, method = RequestMethod.GET)
	public ModelAndView alumnosPage(ModelAndView model, HttpServletRequest request) throws Exception {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);
		
		
		logger.info("alumnosPage");
		
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));

		model.setViewName("alumnos");

		return model;
	}

	@RequestMapping(value = "/saveAlumno", method = RequestMethod.POST)
	public ModelAndView saveAlumno(@ModelAttribute Alumno alumno, HttpServletRequest request) throws Exception {

		logger.info("saveAlumno");

		try {
			if (alumno.getIdAlumno() == 0) {
				objAlumnoService.addAlumno(alumno, request);
			} else {
				objAlumnoService.updateAlumno(alumno);
			}

		} catch (Exception e) {
		    logger.info("Excepcion: ", e);
		}
		return new ModelAndView("redirect:/alumnos");
	}

	@RequestMapping(value = "/newAlumno", method = RequestMethod.GET)
	public ModelAndView newAlumno(ModelAndView model) throws Exception {
		logger.info("newAlumno");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
		
		Alumno alumno = new Alumno();
		model.addObject("alumno", alumno);
		model.setViewName("form-alumno");
		return model;
	}

	@RequestMapping(value = "/editAlumno", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		
		ModelAndView model = new ModelAndView("form-alumno");
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);
		
		
		
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editAlumno ", alumnoId);
		Alumno alumno = null;
		try {
			alumno = objAlumnoService.getAlumnoById(alumnoId);
		} catch (Exception e) {
		    logger.info("Excepcion en edicion: ", e);
		}

		model.addObject("alumno", alumno);

		return model;
	}

	@RequestMapping(value = "/deleteAlumno", method = RequestMethod.GET)
	public ModelAndView deleteAlumno(HttpServletRequest request) throws Exception {
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAlumno ", alumnoId);
		 try {
		     objAlumnoService.deleteAlumno(alumnoId);
		 } catch (Exception e) {
		     logger.info("Excepcion en Eliminacion: ", e);
		 }
		//
		return new ModelAndView("redirect:/alumnos");
	}
	
	@RequestMapping(value = "/AlumnoReporte", method = RequestMethod.GET)
    public String alumnoReporte(ModelMap modelMap, HttpServletRequest request) throws Exception {

        List<Alumno> listaAlumnosCursos = objAlumnoService.getAllAlumnosByIdCurso(request);
        
        AlumnoReport ar = new AlumnoReport();
//        modelMap.addAttribute("format", "xls");
//        modelMap.put(JRParameter.REPORT_LOCALE, locale);
        modelMap.put("listaAlumnos", ar.findAllAlumnos(listaAlumnosCursos));
        
        return "pages/alumno/alumno-report";
    }
	
	@RequestMapping("/xls1")
    public void PrepareReport(HttpServletRequest request) throws Exception {
        try{
            String reportName ="/resources/reports/AlumnoReport.jasper";
            InputStream st = getClass().getResourceAsStream(reportName);
            JasperReport jr= (JasperReport) JRLoader.loadObject(st); 
            Map parameters = new HashMap();
            JasperPrint jp = JasperFillManager.fillReport(jr,parameters,new JRResultSetDataSource((ResultSet) objAlumnoService.getAllAlumnosByIdCurso(request)));
            
            JasperExportManager.exportReportToPdf(jp);     
            JasperViewer jv=new JasperViewer(jp,false);
            jv.setTitle("Challan");
            jv.setVisible(true);
        
        } catch(JRException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }
	
//	@RequestMapping("/xls")
//    public void generarXls(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//	    AlumnoXlsView a = new AlumnoXlsView();
//	    model.addAttribute("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));
//	    a.buildExcelDocument((Map<String, Object>) model, null, request, response);
//    }
	
	@ModelAttribute("ListAlumnos")
    public List<Alumno> getCustomerList(HttpServletRequest request) throws Exception {
        return objAlumnoService.getAllAlumnosByIdCurso(request);
    }
}
