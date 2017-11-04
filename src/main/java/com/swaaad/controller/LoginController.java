package com.swaaad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.dto.AsistenciaFechaDTO;
import com.swaaad.dto.RegistroDTO;
import com.swaaad.dto.ResponseDTO;
import com.swaaad.service.impl.UsuarioServiceImpl;

@Controller
public class LoginController {

	@Autowired
	private UsuarioServiceImpl objUsuarioServiceImpl;

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("index");
		return model;

	}

	@RequestMapping(value = "/cursos**", method = RequestMethod.GET)
	public ModelAndView cursosPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("cursos");

		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("pages/admin");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Usuario o contraseña invalida!");
		}

		if (logout != null) {
			model.addObject("msg", "Sesión cerrada satisfactoriamente.");
		}
		model.setViewName("pages/login");

		return model;

	}

	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registro(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Usuario o contraseña invalida!");
		}

		if (logout != null) {
			model.addObject("msg", "Sesión cerrada satisfactoriamente.");
		}
		model.setViewName("pages/registro");

		return model;

	}

	@RequestMapping(value = "/registrarUsuario", method = RequestMethod.POST) // POST,produces
	@ResponseBody
	public ResponseDTO registrarUsuario(@ModelAttribute RegistroDTO registroDTO) throws Exception {

		// verificar que el correo no se encuentra registrado

		// registrar

		// si se registro enviar correo
//		System.out.println(registroDTO.getOptradio());
		String mensaje = "";
		Boolean flag = false;
		if (objUsuarioServiceImpl.registrarUsuario(registroDTO)) {
			mensaje = "Se registro Correctamente";
			flag = true;
		} else {
			mensaje = "El correo ya se encuentra registrado";
		}

		return new ResponseDTO(mensaje, flag, null);
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("pages/403");
		return model;

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";// You can redirect wherever you want, but generally it's a good idea to show
										// login screen again.
	}
}
