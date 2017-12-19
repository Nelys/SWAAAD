package com.swaaad.controller;

import java.io.InputStream;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.AlumnoDTO;
import com.swaaad.model.Alumno;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.reports.AlumnoReport;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.CursoAlumnoService;
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
@RequestMapping("alumnos")
public class AlumnoController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	
	@Autowired
	private AlumnosService objAlumnoService;
	
	@Autowired
	private UsuarioService objUsuarioService;

	@Autowired
	private CursoAlumnoService objCursoAlumnoService;
	
//	@RequestMapping(value = { "alumnos" }, method = RequestMethod.GET)
	@RequestMapping("")
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
		
        HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		model.addObject("listAlumnos",	 objAlumnoService.getAllAlumnosByIdCurso(idCurso));

		model.setViewName("alumnos");

		return model;
	}

	@RequestMapping(value = "/saveAlumno", method = RequestMethod.POST)
	public ModelAndView saveAlumno(@ModelAttribute Alumno alumno, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
		logger.info("saveAlumno");

		try {
			if (alumno.getIdAlumno() == 0) {
				objAlumnoService.addAlumno(alumno, idCurso);
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

		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
		
        List<Alumno> listaAlumnosCursos = objAlumnoService.getAllAlumnosByIdCurso(idCurso);
        
        AlumnoReport ar = new AlumnoReport();
//        modelMap.addAttribute("format", "xls");
//        modelMap.put(JRParameter.REPORT_LOCALE, locale);
        modelMap.put("listaAlumnos", ar.findAllAlumnos(listaAlumnosCursos));
        
        return "pages/alumno/alumno-report";
    }
	
	@RequestMapping("/xls1")
    public void PrepareReport(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
        
        try{
            String reportName ="/resources/reports/AlumnoReport.jasper";
            InputStream st = getClass().getResourceAsStream(reportName);
            JasperReport jr= (JasperReport) JRLoader.loadObject(st); 
            Map<String, Object> parameters = new HashMap<String, Object>();
            JasperPrint jp = JasperFillManager.fillReport(jr,parameters,new JRResultSetDataSource((ResultSet) objAlumnoService.getAllAlumnosByIdCurso(idCurso)));
            
            JasperExportManager.exportReportToPdf(jp);     
            JasperViewer jv=new JasperViewer(jp,false);
            jv.setTitle("Challan");
            jv.setVisible(true);
        
        } catch(JRException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }
	
	@RequestMapping(value = "/importAlumno", method = RequestMethod.POST)
	public ModelAndView processExcel2007(Model model, @RequestParam("excelfile2007") MultipartFile excelfile, HttpServletRequest request) {
		System.out.println("hello subir archivos");
		
		HttpSession session = request.getSession(false);
        int idCurso = (Integer) session.getAttribute("idCurso");
		
		try {
//			List<AlumnoDTO> lstUser = new ArrayList<>();
			List<Alumno> lstUser = new ArrayList<>();

			System.out.println("hello subir archivos try");
			int i = 2;
			// Creates a workbook object from the uploaded excelfile
			XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream());
			// Creates a worksheet object representing the first sheet
			XSSFSheet worksheet = workbook.getSheetAt(0);
			// Reads the data in excel file until last row is encountered
			System.out.println("hello subir archivos while");
			while (i <= worksheet.getLastRowNum()) {
				// Creates an object for the UserInfo Model
//				AlumnoDTO user = new AlumnoDTO();
				Alumno user = new Alumno();
				// Creates an object representing a single row in excel
				XSSFRow row = worksheet.getRow(i++);
				// Sets the Read data to the model class
//				user.setIdAlumno((int) row.getCell(0).getNumericCellValue());
				user.setApellidos(row.getCell(1).getStringCellValue());
				user.setNombres(row.getCell(2).getStringCellValue());
				user.setGenero((row.getCell(3)== null) ? "": row.getCell(3).getStringCellValue());
				user.setEmail((row.getCell(4)== null) ? "": row.getCell(4).getStringCellValue());
				user.setNombresApoderado((row.getCell(5)== null) ? "": row.getCell(5).getStringCellValue());
				user.setApellidosApoderado((row.getCell(6)== null) ? "": row.getCell(6).getStringCellValue());
				user.setEmailApoderado((row.getCell(7)== null) ? "": row.getCell(7).getStringCellValue());
				// persist data into database in here
				lstUser.add(user);
				objAlumnoService.addAlumno(user, idCurso);

			}
			workbook.close();
			model.addAttribute("lstUser", lstUser);
			model.addAttribute("msg", "Importacion Exitosa!");
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("hello subir archivos hello");
		return new ModelAndView("redirect:/alumnos");
	}
	
//	@RequestMapping("/xls")
//    public void generarXls(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//	    AlumnoXlsView a = new AlumnoXlsView();
//	    model.addAttribute("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));
//	    a.buildExcelDocument((Map<String, Object>) model, null, request, response);
//    }
	
//	@ModelAttribute("ListAlumnos")
//    public List<Alumno> getCustomerList(HttpServletRequest request) throws Exception {
//		HttpSession session = request.getSession(false);
//        int idCurso = (Integer) session.getAttribute("idCurso");
//        return objAlumnoService.getAllAlumnosByIdCurso(idCurso);
//    }
	
	@RequestMapping(value = "/alumnoNota", method = RequestMethod.GET)
	public ModelAndView alumnoNota(ModelAndView model) throws Exception {
		logger.info("alumnoNota");
		
		model.addObject("listaAlumnos", "hola desde el controlador");
		model.setViewName("page-alumno-nota");
		return model;
	}
	
	
	@RequestMapping(value = "/alumnoNota/{correo}", method = RequestMethod.GET)
	public ModelAndView alumnoNota(ModelAndView model, @PathVariable("correo") String correo) throws Exception {
		logger.info("alumnoNota");
		
		correo += ".com";
		
		System.out.println("Correo: " + correo );
		
		for (Alumno alumno : objAlumnoService.getAllAlumnosByCorreo(correo)) {
			System.out.println("Alumno:" + alumno.getApellidos());
		}
		
		model.addObject("correo", correo);
//		objCursoAlumnoService.get
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByCorreo(correo));
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByCorreo(correo));
		model.setViewName("page-alumno-nota");
		return model;
	}
	
}
