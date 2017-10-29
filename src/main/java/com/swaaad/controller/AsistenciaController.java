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
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.AlumnoDTO;
import com.swaaad.exceptions.AsistenciaException;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;
import com.swaaad.reports.CursoAlumnoReport;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.AsistenciaService;
import com.swaaad.service.CursoAlumnoService;

@Controller
@RequestMapping("asistencias")
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
	@RequestMapping("")
//	@RequestMapping(value = { "asistencias" }, method = RequestMethod.GET)
	public ModelAndView asistenciaPage(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("asistenciaPage");
		try {
			HttpServletRequest request1 = (HttpServletRequest) request;
			HttpSession session = request1.getSession(false);

			int idCurso = (Integer) session.getAttribute("idCurso");

			List<CursoAlumno> listaAlumnosCursos = objCursoAlumnoService.getAllAlumnosByCurso(idCurso);
			List<Integer> listaDiaPorMes = objAsistenciaService.getDayOfAlumnosByCurso(idCurso, 10);
			List<Asistencia> listaEstadoPorCurso = objAsistenciaService.getEstadoByAlumnoCurso(idCurso);
			logger.info("paso1"+idCurso);
			System.out.println("mensaje de los cambios");
			model.addObject("listAlumnos", listaAlumnosCursos);
			model.addObject("listarDiasMes", listaDiaPorMes);
			model.addObject("listaEstadoPorCurso", listaEstadoPorCurso);
			logger.info("paso2");
			model.setViewName("asistencia");
			logger.info("paso");
		} catch (Exception e) {
			//model.setViewName("redirect:/cursos");
			logger.info("problemas con curso no se ");
			
		}
		return model;
	}
	// para mostart el formulario
	@RequestMapping("/mes/{id}")
	public String HelloWorld2(Model model, @PathVariable("id") int id) {
		// model.addAttribute("lstUser", lstUser);
		model.addAttribute("message", "Welcome to Spring MVC"+id);
		return "hello";
	}
	

	@ExceptionHandler(AsistenciaException.class)
	public ModelAndView handleUsuarioNoEncontradoException(HttpServletRequest request, Exception ex) {

		System.out.println("URL de la Peticion = " + request.getRequestURL());
		System.out.println("Exception Lanzada = " + ex);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", ex);
		modelAndView.addObject("url", request.getRequestURL());

		modelAndView.setViewName("error");
		return modelAndView;
	}
	


	
	
	// para mostart el formulario
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String HelloWorld(Model model) {
		// model.addAttribute("lstUser", lstUser);
		model.addAttribute("message", "Welcome to Spring MVC");
		return "hello";
	}

	// para capturar el envio del formulario
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
				// user.setNombres(row.getCell(2).getDateCellValue());
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
	public ModelAndView saveAsistencia(@ModelAttribute Asistencia asistencia) throws Exception {

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
		CursoAlumno cursoAlumno = objCursoAlumnoService.getCursoAlumnoById(idAlumnoCurso);
		Asistencia asistencia = new Asistencia();
		System.out.println(tipo + " " + idAlumnoCurso);
		objAsistenciaService.addAsistencia(asistencia);
		// METODO PARA GUARDAR ASISTENCIA
		return null;
	}

}
