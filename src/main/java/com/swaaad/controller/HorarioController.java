package com.swaaad.controller;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.exolab.castor.types.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.ActividadPedagogicaDTO;
import com.swaaad.dto.HorarioCruceDTO;
import com.swaaad.dto.HorarioDTO;
import com.swaaad.dto.HorarioVistaDTO;
import com.swaaad.dto.ResponseDTO;
import com.swaaad.model.ActividadPedagogica;
import com.swaaad.model.Curso;
import com.swaaad.model.Docente;
import com.swaaad.model.Horario;
import com.swaaad.model.Usuario;
import com.swaaad.service.CursoService;
import com.swaaad.service.HorarioService;
import com.swaaad.service.UsuarioService;

@Controller
public class HorarioController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	private HorarioService objHorarioService;

	@Autowired
	private UsuarioService objUsuarioService;

	@Autowired
	private CursoService objCursoService;

	@RequestMapping(value = { "horario" }, method = RequestMethod.GET)
	public ModelAndView listActividadPedagogica(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("horario");

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();
		model.addObject("user", userName);

		// obtiene la lista de cursos por docente
		List<Curso> listaCursos = objCursoService.listCursoByDocente(docente.getIdDocente());
		// Guarda la lista de cursos enla variable listaCursos
		model.addObject("listaCursos", listaCursos);
		// se envia a la vista
		model.setViewName("horarios");
		return model;
	}

	@RequestMapping(value = "/saveHorario", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDTO saveHorario(@ModelAttribute HorarioDTO horarioDTO) throws Exception {

		logger.info("saveHorario");

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente = usuario.getDocentes().get(0);
		String userName = docente.getApellidos() + " ," + docente.getNombre();

		@SuppressWarnings("deprecation")
		Time dtInit = new Time(horarioDTO.getHour()[0], horarioDTO.getMinute()[0], 00);
		@SuppressWarnings("deprecation")
		Time dtEnd = new Time(horarioDTO.getHour()[1], horarioDTO.getMinute()[1], 00);
		Curso curso = objCursoService.getCursoById(horarioDTO.getCbxCursos());

		List<HorarioCruceDTO> listaHorario=new ArrayList<HorarioCruceDTO>() ;
		
		if (horarioDTO.getCheckbox1() != null) {
			Horario horario = new Horario();
			horario.setDia("1");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			
//			System.out.println(dtInit.toString());
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(), 1,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
			}else {
				System.out.println("no agrego 1");
				
				listaHorario.add(new HorarioCruceDTO(1,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Lunes"));
				
			}
//			objHorarioService.addHorario(horario);
		}

		if (horarioDTO.getCheckbox2() != null) {
			Horario horario = new Horario();
			horario.setDia("2");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(), 2,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
				
			}else {
				System.out.println("no agrego 2");
				listaHorario.add(new HorarioCruceDTO(2,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Martes"));
			}
		}
		if (horarioDTO.getCheckbox3() != null) {
			Horario horario = new Horario();
			horario.setDia("3");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(), 3,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
			}else {
				System.out.println("no agrego 3");
				listaHorario.add(new HorarioCruceDTO(3,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Miercoles"));
			}

		}
		if (horarioDTO.getCheckbox4() != null) {
			Horario horario = new Horario();
			horario.setDia("4");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(),4,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
			}else {
				System.out.println("no agrego 4");
				listaHorario.add(new HorarioCruceDTO(4,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Jueves"));
			}

		}
		if (horarioDTO.getCheckbox5() != null) {
			Horario horario = new Horario();
			horario.setDia("5");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(), 5,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
			}else {
				System.out.println("no agrego 5");
				listaHorario.add(new HorarioCruceDTO(5,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Viernes"));
			}

		}
		if (horarioDTO.getCheckbox6() != null) {
			Horario horario = new Horario();
			horario.setDia("6");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(), 6,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
			}else {
				System.out.println("no agrego 6");
				listaHorario.add(new HorarioCruceDTO(6,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Sabado"));
			}

		}
		if (horarioDTO.getCheckbox7() != null) {
			Horario horario = new Horario();
			horario.setDia("7");
			horario.setHoraInicio(dtInit);
			horario.setHoraFin(dtEnd);
			horario.setCurso(curso);
			if(objHorarioService.verificarDisponibilidad( usuario.getIdUsuario(),7 ,  dtInit.toString(),  dtEnd.toString())) {
				objHorarioService.addHorario(horario);
			}else {
				System.out.println("no agrego 7");
				listaHorario.add(new HorarioCruceDTO(7,dtInit.toString(),dtEnd.toString(),curso.getNombreCurso(),"Domingo"));
			}

		}

		ResponseDTO response = new ResponseDTO();

		Map<String, Object> map = new HashMap<>();
		
		map.put("horarios", listaHorario);
		response.setResponse(true);
		response.setMessage("Guardo");
		response.setData(map);

		return response;
	}

	@RequestMapping(value = "/newHorario", method = RequestMethod.GET)
	public ModelAndView newHorario(ModelAndView model) throws Exception {

		logger.info("newCurso");

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));
		Docente docente2 = usuario.getDocentes().get(0);
		String userName = docente2.getApellidos() + " ," + docente2.getNombre();
		model.addObject("user", userName);

		model.setViewName("form-horario");
		return model;
	}

	@RequestMapping(value = "/getHorarios", method = RequestMethod.GET)
	@ResponseBody
	public ResponseDTO getHorario() throws Exception {
		ResponseDTO responseDTO = new ResponseDTO();

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
			userDetails = (UserDetails) principal;
		}
		Usuario usuario = objUsuarioService.getUsuarioById(Integer.valueOf(userDetails.getUsername()));

		List<Horario> listaHorarios = objHorarioService.getHorarioByDocente(usuario.getIdUsuario());

		List<HorarioVistaDTO> lista = new ArrayList<HorarioVistaDTO>();

		// traer la lista de cursos para poner el color que le corresponde
		
		
		List<Integer> lista_id=new ArrayList<Integer>();
		
		    

		for (Horario horario : listaHorarios) {
			HorarioVistaDTO horarioDto = new HorarioVistaDTO();

			int valor = 0;
			
			int opcion=1;
			int contador=1;
			System.out.println("%% "+horario.getCurso().getIdCurso());
			for (Integer text : lista_id) {
				System.out.println(text+" - "+horario.getCurso().getIdCurso());
				if(text==horario.getCurso().getIdCurso()) {
					System.out.println("opcion if "+contador);
					opcion=contador;
					valor=1;
				}
				
				contador++;
			}
			
			if(valor==0) {
				System.out.println("Agregara "+horario.getCurso().getIdCurso());
				lista_id.add(horario.getCurso().getIdCurso());
				opcion=contador;
			}
			
			System.out.println("opcion "+opcion);
			switch (opcion) {
			case 1:
				horarioDto.setClassName("danger-bg");
				break;
			case 2:
				horarioDto.setClassName("success-bg");
				break;
			case 3:
				horarioDto.setClassName("info-bg");
				break;
			case 4:
				horarioDto.setClassName("brown-bg");
				break;
			case 5:
				horarioDto.setClassName("linkedin-bg");
				break;
			case 6:
				horarioDto.setClassName("twitter-bg");
				break;
			case 7:
				horarioDto.setClassName("text-fb");
				break;
			}

			horarioDto.setTitle(horario.getCurso().getNombreCurso().toUpperCase());
			horarioDto.setId(horario.getIdHorario());
//			horarioDto.setClassName("danger-bg");
			switch (horario.getDia()) {
			case "1":
				horarioDto.setStart("1990-01-01T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-01T" + horario.getHoraFin().toString());
				break;
			case "2":
				horarioDto.setStart("1990-01-02T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-02T" + horario.getHoraFin().toString());
				break;
			case "3":
				horarioDto.setStart("1990-01-03T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-03T" + horario.getHoraFin().toString());
				break;
			case "4":
				horarioDto.setStart("1990-01-04T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-04T" + horario.getHoraFin().toString());
				break;
			case "5":
				horarioDto.setStart("1990-01-05T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-05T" + horario.getHoraFin().toString());
				break;
			case "6":
				horarioDto.setStart("1990-01-06T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-06T" + horario.getHoraFin().toString());
				break;
			case "7":
				horarioDto.setStart("1990-01-07T" + horario.getHoraInicio().toString());
				horarioDto.setEnd("1990-01-07T" + horario.getHoraFin().toString());
				break;
			}

			lista.add(horarioDto);
		}

		responseDTO.setMessage("Trajo los horarois");
		responseDTO.setResponse(true);
		Map<String, Object> map = new HashMap<>();
		map.put("horarios", lista);
		responseDTO.setData(map);

		return responseDTO;
	}

}
