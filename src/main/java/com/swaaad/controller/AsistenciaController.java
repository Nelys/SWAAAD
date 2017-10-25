package com.swaaad.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


import java.util.HashMap;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.AlumnoDTO;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;
import com.swaaad.reports.CursoAlumnoReport;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.AsistenciaService;
import com.swaaad.service.CursoAlumnoService;

@Controller
public class AsistenciaController {
	private static final Logger logger = LoggerFactory.getLogger(AsistenciaController.class);

	@Autowired
	AsistenciaService objAsistenciaService;
	@Autowired
	AlumnosService objAlumnoService;

	
	@Autowired
	CursoAlumnoService objCursoAlumnoService;


	@Autowired
	ServletContext context; 
	@RequestMapping(value = { "asistencias" }, method = RequestMethod.GET)
	public ModelAndView asistenciaPage(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("asistenciaPage");

		HttpServletRequest request1 = (HttpServletRequest) request;
		HttpSession session = request1.getSession(false);

		int idCurso = (Integer) session.getAttribute("idCurso");
		@SuppressWarnings("unused")
		List<CursoAlumno> listaAlumnosCursos = objCursoAlumnoService.getAllAlumnosByCurso(idCurso);
		List<Date> listaDiaPorMes = objAsistenciaService.getDayOfAlumnosByCurso(idCurso);
		List<Asistencia> listaEstadoPorCurso = objAsistenciaService.getEstadoByAlumnoCurso(idCurso);
//		List<Asistencia> listaAlumnosCursos=objAsistenciaService.getAllAlumnosByCursoMes(idCurso);
//		List<Integer> listarDiasMes=objAsistenciaService.asistenciaMes(10, idCurso);

		System.out.println("mensaje de los cambios");
		model.addObject("listAlumnos", listaAlumnosCursos);
		model.addObject("listarDiasMes", listaDiaPorMes);
		model.addObject("listaEstadoPorCurso", listaEstadoPorCurso);
		model.setViewName("asistencias");

		return model;
	}
	
	
//	para mostart el formulario
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String HelloWorld(Model model) {		
		//model.addAttribute("lstUser", lstUser);
		model.addAttribute("message", "Welcome to Spring MVC");
		return "hello";
	}
	
//	para capturar el envio del formulario
	@RequestMapping(value = "/hello", method = RequestMethod.POST)
	public String processExcel2007(Model model, @RequestParam("excelfile2007") MultipartFile excelfile) {
		System.out.println("hello subir archivos");
		try {
			List<AlumnoDTO> lstUser = new ArrayList<>();
			
			System.out.println("hello subir archivos try");
			int i = 0;
			// Creates a workbook object from the uploaded excelfile
			XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream());
			// Creates a worksheet object representing the first sheet
			XSSFSheet worksheet = workbook.getSheetAt(0);
			// Reads the data in excel file until last row is encountered
			System.out.println("hello subir archivos while");
			while (i <= worksheet.getLastRowNum()) {
				// Creates an object for the UserInfo Model
				AlumnoDTO user = new AlumnoDTO();
				// Creates an object representing a single row in excel
				XSSFRow row = worksheet.getRow(i++);
				// Sets the Read data to the model class
				user.setIdAlumno((int) row.getCell(0).getNumericCellValue());
				user.setApellidos(row.getCell(1).getStringCellValue());
//				user.setNombres(row.getCell(2).getDateCellValue());
				user.setNombres(row.getCell(2).getStringCellValue());
				// persist data into database in here
				lstUser.add(user);
				
			}			
			workbook.close();
			model.addAttribute("lstUser", lstUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("hello subir archivos hello");
		return "hello";
	}
	
	
	@RequestMapping(value = "/pdf", method = RequestMethod.GET)
	public String generatePdfReports(ModelMap modelMap) throws Exception {

		List<CursoAlumno> listaAlumnosCursos = objCursoAlumnoService.getAllAlumnosByCurso(3);
		
		
		CursoAlumnoReport ar = new CursoAlumnoReport();
		modelMap.put("listaAlumnos", ar.findAllAlumnos(listaAlumnosCursos));
		
		return "asistencia_reporte";
	}

	 @RequestMapping(value = "/saveAsistencia", method = RequestMethod.POST)
	 public ModelAndView saveAsistencia(@ModelAttribute Asistencia asistencia)
	 throws Exception {
	
	 logger.info("saveAsistencia");
	
	 try {
	 if (asistencia.getIdAsistencia() == 0) {
	 objAsistenciaService.addAsistencia(asistencia);
	 } else {
	 objAsistenciaService.updateAsistencia(asistencia);
	 }
	
	 } catch (Exception e) {
	 e.getStackTrace();
	 }
	 return new ModelAndView("redirect:/asistencias");
	 }

	@RequestMapping(value = "/newAsistencia", method = RequestMethod.GET)
	public ModelAndView newAsistencia(ModelAndView model) throws Exception {
		logger.info("newAsistencia");
		Asistencia asistencia = new Asistencia();
		model.addObject("asistencia", asistencia);
		model.setViewName("form-asistencia");
		return model;
	}

	/**
	 * Controlador JSON Alumno por Id
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/guardarAsistenciaAlumno", method = RequestMethod.GET) // POST,produces
	@ResponseBody
	// recibe parametros de una peticion del navegador
	public AlumnoDTO getAlumnoById(@RequestParam("tipo") String tipo, @RequestParam("idAlumnoCurso") int idAlumnoCurso)
			throws Exception {
		// declaro un variable cursoAlumno de tipo CursoAlumno el cualguadara
//		CursoAlumno cursoAlumno = objCursoAlumnoService.getCursoAlumnoById(idAlumnoCurso);
		Asistencia asistencia = new Asistencia();

		// objAsistenciaService.addAsistencia(asistencia);
		// METODO PARA GUARDAR ASISTENCIA
		return null;
	}

}
