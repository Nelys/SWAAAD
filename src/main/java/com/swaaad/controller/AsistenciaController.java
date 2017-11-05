package com.swaaad.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
import com.swaaad.dto.AsistenciaFechaDTO;
import com.swaaad.dto.ResponseDTO;
import com.swaaad.exceptions.AsistenciaException;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.reports.CursoAlumnoReport;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.AsistenciaService;
import com.swaaad.service.CursoAlumnoService;
import com.swaaad.service.CursoService;
import com.swaaad.service.UsuarioService;
import com.swaaad.service.impl.UsuarioServiceImpl;

@Controller
@RequestMapping("asistencias")
public class AsistenciaController {

	private static final Logger logger = LoggerFactory.getLogger(AsistenciaController.class);

	@Autowired
	UsuarioService objUsuarioService;

	@Autowired
	AsistenciaService objAsistenciaService;
	@Autowired
	AlumnosService objAlumnoService;

	@Autowired
	CursoAlumnoService objCursoAlumnoService;
	
	@Autowired
	CursoService objCursoService;

	@Autowired
	ServletContext context;

	// VISTA principal
	@RequestMapping("")
	public ModelAndView asistenciaPage(ModelAndView model, HttpServletRequest request,
			@RequestParam(value = "mes", required = false, defaultValue = "0") String mes) throws Exception {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		

		
		String mesLetra = mes;

		if (mes.equals("0")) {
			Date date = new Date();
			DateFormat hourdateFormat = new SimpleDateFormat("MM");
			mesLetra = hourdateFormat.format(date);
		}

		logger.info("asistenciaPage");
		try {
			HttpServletRequest request1 = (HttpServletRequest) request;
			HttpSession session = request1.getSession(false);

			int idCurso = (Integer) session.getAttribute("idCurso");

			List<CursoAlumno> listaAlumnosCursos = objCursoAlumnoService.getAllAlumnosByCurso(idCurso);
			List<Integer> listaDiaPorMes = objAsistenciaService.getDayOfAlumnosByCurso(idCurso,
					Integer.valueOf(mesLetra));
			List<Asistencia> listaEstadoPorCurso = objAsistenciaService.getEstadoByAlumnoCurso(idCurso,
					Integer.valueOf(mesLetra));

			model.addObject("idCurso", idCurso);
			model.addObject("listAlumnos", listaAlumnosCursos);
			model.addObject("listarDiasMes", listaDiaPorMes);
			model.addObject("listaEstadoPorCurso", listaEstadoPorCurso);
			model.addObject("mes_actual", mesLetra);
			model.addObject("user", userName);

			model.setViewName("asistencia");

		} catch (Exception e) {

			logger.error("problemas con curso no se ");

		}
		return model;
	}

	// VISTA para registrar asistencia
	@RequestMapping("registrarAsistencia/{curso}/{fecha}")
	public String registrarAsistencia(Model model, @PathVariable("curso") int curso,
			@PathVariable("fecha") String fecha) throws Exception {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));	
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Date date = sdf.parse(fecha);

		List<Asistencia> listaAsistencia = objAsistenciaService.getByDay(curso, date);

		model.addAttribute("idCurso", curso);
		model.addAttribute("listAlumnos", listaAsistencia);
		model.addAttribute("fecha", fecha);
		model.addAttribute("mes", date.getMonth() + 1);
		model.addAttribute("user", userName);
		return "registrar_asistencia";
	}

	// genera asistencias por fecha
	@RequestMapping("/generarAsistencia/{curso}/{fecha}")
	@ResponseBody
	public ResponseDTO HelloW(@PathVariable("curso") int curso, @PathVariable("fecha") String fecha) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		Date date = sdf.parse(fecha);

		objAsistenciaService.generarAsistencia(date, curso);

		ResponseDTO dto = new ResponseDTO();
		dto.setMessage("Genero");
		dto.setResponse(true);

		return dto;

	}

	/**
	 * Controlador JSON Alumno por Id
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/guardarAsistenciaAlumno", method = RequestMethod.POST) // POST,produces
	@ResponseBody
	// recibe parametros de una peticion del navegador
	public ResponseDTO guardarAsistenciaAlumno(@ModelAttribute AsistenciaFechaDTO asistenciaFechaDTO) throws Exception {
		ResponseDTO dto = new ResponseDTO();

		Asistencia asistencia = objAsistenciaService.getById(asistenciaFechaDTO.getIdAsistencia());
		asistencia.setEstado(asistenciaFechaDTO.getEstado());

		objAsistenciaService.updateAsistencia(asistencia);
		dto.setMessage("id " + asistenciaFechaDTO.getIdAsistencia());
		dto.setResponse(true);
		return dto;
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

}
