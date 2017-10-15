package com.swaaad.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.report.AlumnoReport;
import com.swaaad.service.AlumnosService;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
public class AlumnoController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	AlumnosService objAlumnoService;

	@RequestMapping(value = { "alumnos" }, method = RequestMethod.GET)
	public ModelAndView alumnosPage(ModelAndView model, HttpServletRequest request) throws Exception {

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
		Alumno alumno = new Alumno();
		model.addObject("alumno", alumno);
		model.setViewName("form-alumno");
		return model;
	}

	@RequestMapping(value = "/editAlumno", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editAlumno ", alumnoId);
		Alumno alumno = null;
		try {
			alumno = objAlumnoService.getAlumnoById(alumnoId);
		} catch (Exception e) {
		    logger.info("Excepcion en edicion: ", e);
		}
		ModelAndView model = new ModelAndView("form-alumno");
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
	
	@RequestMapping(value = "/reportAlumno", method = RequestMethod.GET)
    public String reportAlumno(ModelMap model, HttpServletRequest request) throws Exception {
        
        logger.info("alumnosPage");
        System.out.println("hola");
        model.put("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));
        System.out.println("hola1");
        return "report-alumnos";
//        model.setViewName("report-alumnos");
//        System.out.println("hola2");
//        return model;
    }
	
	@RequestMapping(value = "/reportAlumno1", method = RequestMethod.GET)
    public String reportAlumno1(ModelMap modelMap, HttpServletRequest request) throws Exception {
	    
	    AlumnoReport alumnoReport = new AlumnoReport();
	    System.out.println("hola");
	    modelMap.put("listAlumnos", alumnoReport.findAll(request));
	    System.out.println("hola2");
	    return "report-alumnos";
    }
	
	@RequestMapping(value = "/helloReport1", method = RequestMethod.GET)
	@ResponseBody
    public void getRpt1(HttpServletResponse response) throws JRException, IOException {
        InputStream jasperStream = this.getClass().getResourceAsStream("/report/Blank_A4.jasper");
        Map<String,Object> params = new HashMap();
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JREmptyDataSource());
        
        response.setContentType("application/x-pdf");
        response.setHeader("Content-disposition", "inline; filename=helloWorldReport.pdf");
    
        final OutputStream outStream = response.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	}
}
