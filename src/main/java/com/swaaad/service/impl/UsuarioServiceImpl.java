package com.swaaad.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.swaaad.dao.impl.UsuarioDaoImpl;
import com.swaaad.dto.RegistroDTO;
import com.swaaad.model.Docente;
import com.swaaad.model.Usuario;
import com.swaaad.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	UsuarioDaoImpl objUsuarioDao;
	@Autowired
	DocenteServiceImpl objDocenteServiceImpl;

	@Override
	public Boolean correoRecuperacion(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("envio correo 1");
		// registrara
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		// System.out.println(pe.encode("admin"));

//		Usuario usuario=new Usuario();
		Docente docente=objDocenteServiceImpl.getDocenteById(usuario.getIdUsuario());


		String emmap = pe.encode(docente.getEmail() + docente.getApellidos());
		String nombre = pe.encode(docente.getNombre());
		String pass = usuario.getPassword();

		// System.out.println("?no=" + nombre + "&pa=" + pass + "&em="
		// +emmap+"&i="+newUsuario.getIdUsuario());

		// String ruta_servidor="https://salty-escarpment-54865.herokuapp.com/";
		String ruta_servidor = "http://localhost:8080/swaaad/";
		String ruta_recuperacion = ruta_servidor + "#";
		String ruta_confirmacion = ruta_servidor + "recuperarCuenta?no=" + nombre + "&pa=" + pass + "&em=" + emmap
				+ "&i=" + usuario.getIdUsuario();
		String ruta_terminos = ruta_servidor + "#";

		final String username = "swaaad.master@gmail.com";
		final String password = "AdminSwaaad";
		System.out.println("envio correo 2");
		// enviar correo
		String para = usuario.getUsername();

		// La dirección de la cuenta de envío (from)
		String de = "swaaad.master@gmail.com";

		// El servidor (host). En este caso usamos localhost
		String host = "localhost";

		// Obtenemos las propiedades del sistema
		Properties propiedades = System.getProperties();

		// Configuramos el servidor de correo
		// propiedades.setProperty("mail.smtp.host", host);
		propiedades.put("mail.smtp.auth", "true");
		propiedades.put("mail.smtp.starttls.enable", "true");
		propiedades.put("mail.smtp.host", "smtp.gmail.com");
		propiedades.put("mail.smtp.port", "587");
		System.out.println("envio correo 3");
		// Obtenemos la sesión por defecto
		// Session sesion = Session.getDefaultInstance(propiedades);
		Session session = Session.getInstance(propiedades, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			System.out.println("envio correo 4");
			// Creamos un objeto mensaje tipo MimeMessage por defecto.
			MimeMessage mensaje = new MimeMessage(session);

			// Asignamos el “de o from” al header del correo.
			mensaje.setFrom(new InternetAddress(de));

			// Asignamos el “para o to” al header del correo.
			mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(para));

			// Asignamos el asunto
			mensaje.setSubject("Recuperar Cuenta " + docente.getNombre());

			// Asignamos el mensaje como tal
			mensaje.setText("<div style=\"margin:10px;font-size:12px\">\r\n" + "\r\n"
					+ "		<div style=\"background-color:#ddd;width:100%;text-align:center;min-width:800px\">\r\n"
					+ "\r\n"
					+ "			<div style=\"width:670px;border:0px;border-left:1px solid #ccc;border-right:1px solid #ccc;background-color:#fff;text-align:left;margin-left:auto;margin-right:auto\">\r\n"
					+ "\r\n"
					+ "				<div style=\"background-color:#fff;padding-left:50px;width:620px;height:67px;padding-top:15px\">\r\n"
					+ "\r\n" + "					<div style=\"float:left;width:148px\">\r\n"
					+ "						<a href=\"" + ruta_servidor
					+ "\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=es-419&amp;q="
					+ ruta_servidor
					+ "/&amp;source=gmail&amp;ust=1510067115589000&amp;usg=AFQjCNF3XpQ7F-SL_2i8RPVhzo0Q1SvmOQ\"><img style=\"border:0pt none;margin:0pt;padding:0pt\" alt=\"SWAAAD\" src=\"https://lh3.googleusercontent.com/4Gux8TCQKxhTUwioL-PVib754QziUSbGr4GjR2oY5EAmGNY50X1ed6y9aNrXtujdZT-Cyh5sRKlyq64w3NaDd6O8qe9_oU-AnDyeJBWZCMcdBYLqoTX6F70uFeBXtUlDlbOVBg3UaZ-LAL6Smv6iXjkRQxKK5hliIBG3yogB7E4yqmA0xP17EAb8IoLHKF0dfiEio9PIgDHc-xEwn95EBjZXgpgkLyadDS81fFAc5DGK75YmMEq8Ttk4YN6kTAG1i_Va51SPX22_tIOHur6S0QWdVppABwQ85vIqCM7JXP4u9cc0eimAGyTegrmtGk7KZjmxgMiQL7RIE-ACGMu0vwVf1zwR6Q67qn0dXC5tcDymcaqQZfIPctIeG9PEVUpd09bwcjLbANyjGczR5rMTaUotevgF5WU76bMIilIUsM4djGbfi3OsButpuhuBGb_VrMRZ0ZQe5IY_JaL9BA53KlSfD5p3tnmzuDl0GcndAJtdmPxO_YLpztMZyH14tw4k8uk6V7cC3uNdgUVW_6OKDx_2aJTExkE3f-egZ0xZnupYPOq9mvH8F7iujOutaGY08SO0Epc8dYESZAlcb0VyTYcVWhyijWcJZZbW3ONvlWAhKbGgDL0fKiXsiYtqE7OJlW8JHEo2mNN3-4YYWbM06lppJ8keCAt-WfY=w127-h38-no\" class=\"CToWUd\"> \r\n"
					+ "						</a>\r\n" + "					</div>\r\n"
					+ "					<div style=\"float:left;width:350px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333;margin-top:10px\">\r\n"
					+ "						<div style=\"font-size:14px;font-weight:bold;color:#000000\">Hola "
					+ docente.getNombre() + ",</div>\r\n"
					+ "						<div style=\"float:left;font-size:14px;color:#666666\">Recientemente solicitaste que restablezcamos tu contraseña.</div>\r\n"
					+ "					</div>\r\n" + "				</div>\r\n"
					+ "				<div style=\"padding-left:50px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;background-color:#fff;border-top-color:#ddd;border-top-style:solid;border-top-width:1px\">\r\n"
					+ "					<div style=\"font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333;padding-top:15px;padding-bottom:15px;text-align:justify;padding-right:30px;font-size:15px;line-height:20px\">\r\n"
					+ "						Para cambiar tu contraseña de <strong>SWAAAD</strong>, haz clic en el siguiente botón.\r\n"
					+ "					</div>\r\n"
					+ "					<div style=\"padding-left:20px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333\">\r\n"
					+ "						<div style=\"white-space:nowrap;background-color:#108a6c;border-radius:5px;border:1px solid #078956;padding:5px 0 5px 0;text-align:center;width:220px\">\r\n"
					+ "							<div style=\"color:#ffffff;font-size:13px;font-weight:bold;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;white-space:nowrap;padding-left:30px;padding-right:30px\">\r\n"
					+ "								<span>\r\n"
					+ "									<a style=\"border:none;color:#0084b4;text-decoration:none;color:#ffffff;font-size:13px;font-weight:bold;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif\" href=\""
					+ ruta_confirmacion + "\" target=\"_blank\" data-saferedirecturl=\"" + ruta_confirmacion
					+ "&amp;source=gmail&amp;ust=1510067115589000&amp;usg=AFQjCNGgMBnZqhCdSxdFu3LLnaeJH6syvw\">Confirma tu <span class=\"il\">cuenta</span> ahora\r\n"
					+ "									</a>\r\n" + "								</span>\r\n"
					+ "							</div>\r\n" + "						</div>\r\n"
					+ "					</div>\r\n"
					+ "					<div style=\"font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333;padding-bottom:15px;padding-top:15px;padding-right:30px;text-align:justify;font-size:13px;line-height:20px\">\r\n"
					+ "						Si haces clic en el boton y parece que no funciona, cópialo y pégalo en una nueva ventana de tu navegador el siguiente enlace:<br> <a style=\"word-wrap:break-word;border:none;color:#129856;text-decoration:none;font-size:14px\" href=\""
					+ ruta_confirmacion
					+ "\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=es-419&amp;q="
					+ ruta_confirmacion
					+ "&amp;source=gmail&amp;ust=1510067115590000&amp;usg=AFQjCNG98RKO1o-qPP1a6NKLwuEa7TpSVQ\">"
					+ ruta_confirmacion + "</a>\r\n" + "					</div>\r\n" + "				</div>\r\n"
					+ "\r\n" + "			</div>\r\n" + "\r\n" + "		</div>\r\n" + "\r\n" + "	</div>",
					"ISO-8859-1", "html");

			// Enviamos el correo
			System.out.println("envio correo");
			Transport.send(mensaje);
			System.out.println("envio correo");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		System.out.println("envio correo 5");
		return true;
	}

	@Override
	public Boolean registrarUsuario(RegistroDTO usuario) throws Exception {

		// verificar
		if (objUsuarioDao.verificarEmail(usuario.getEmail()) != null) {
			return false;
		} else {
			// registrara
			BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
			// System.out.println(pe.encode("admin"));

			Usuario _usuario = new Usuario();

			_usuario.setUsername(usuario.getEmail());
			_usuario.setPassword(pe.encode(usuario.getPassword()));
			_usuario.setEnabled((byte) 0);
			_usuario.setRole("ROLE_ADMIN");

			Usuario newUsuario = objUsuarioDao.addUsuario(_usuario);

			Docente docente = new Docente();

			docente.setApellidos(usuario.getApellidos());
			docente.setEmail(usuario.getEmail());
			docente.setGenero(usuario.getOptradio());
			docente.setNombre(usuario.getNombres());

			docente.setUsuario(newUsuario);

			objDocenteServiceImpl.addDocente(docente);

			String emmap = pe.encode(docente.getEmail() + docente.getApellidos());
			String nombre = pe.encode(docente.getNombre());
			String pass = _usuario.getPassword();

			// System.out.println("?no=" + nombre + "&pa=" + pass + "&em="
			// +emmap+"&i="+newUsuario.getIdUsuario());

			// String ruta_servidor="https://salty-escarpment-54865.herokuapp.com/";
			String ruta_servidor = "http://localhost:8080/swaaad/";
			String ruta_recuperacion = ruta_servidor + "#";
			String ruta_confirmacion = ruta_servidor + "confirmarRegistro?no=" + nombre + "&pa=" + pass + "&em=" + emmap
					+ "&i=" + newUsuario.getIdUsuario();
			String ruta_terminos = ruta_servidor + "#";

			final String username = "swaaad.master@gmail.com";
			final String password = "AdminSwaaad";

			// enviar correo
			String para = usuario.getEmail().trim();

			// La dirección de la cuenta de envío (from)
			String de = "swaaad.master@gmail.com";

			// El servidor (host). En este caso usamos localhost
			String host = "localhost";

			// Obtenemos las propiedades del sistema
			Properties propiedades = System.getProperties();

			// Configuramos el servidor de correo
			// propiedades.setProperty("mail.smtp.host", host);
			propiedades.put("mail.smtp.auth", "true");
			propiedades.put("mail.smtp.starttls.enable", "true");
			propiedades.put("mail.smtp.host", "smtp.gmail.com");
			propiedades.put("mail.smtp.port", "587");

			// Obtenemos la sesión por defecto
			// Session sesion = Session.getDefaultInstance(propiedades);
			Session session = Session.getInstance(propiedades, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			try {
				// Creamos un objeto mensaje tipo MimeMessage por defecto.
				MimeMessage mensaje = new MimeMessage(session);

				// Asignamos el “de o from” al header del correo.
				mensaje.setFrom(new InternetAddress(de));

				// Asignamos el “para o to” al header del correo.
				mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(para));

				// Asignamos el asunto
				mensaje.setSubject("Confirmar Cuenta " + usuario.getNombres());

				// Asignamos el mensaje como tal
				mensaje.setText("<div style=\"margin:10px;font-size:12px\">\r\n" + "\r\n"
						+ "		<div style=\"background-color:#ddd;width:100%;text-align:center;min-width:800px\">\r\n"
						+ "\r\n"
						+ "			<div style=\"width:670px;border:0px;border-left:1px solid #ccc;border-right:1px solid #ccc;background-color:#fff;text-align:left;margin-left:auto;margin-right:auto\">\r\n"
						+ "\r\n"
						+ "				<div style=\"background-color:#fff;padding-left:50px;width:620px;height:67px;padding-top:15px\">\r\n"
						+ "\r\n" + "					<div style=\"float:left;width:148px\">\r\n"
						+ "						<a href=\"" + ruta_servidor
						+ "\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=es-419&amp;q="
						+ ruta_servidor
						+ "/&amp;source=gmail&amp;ust=1510067115589000&amp;usg=AFQjCNF3XpQ7F-SL_2i8RPVhzo0Q1SvmOQ\"><img style=\"border:0pt none;margin:0pt;padding:0pt\" alt=\"SWAAAD\" src=\"https://lh3.googleusercontent.com/4Gux8TCQKxhTUwioL-PVib754QziUSbGr4GjR2oY5EAmGNY50X1ed6y9aNrXtujdZT-Cyh5sRKlyq64w3NaDd6O8qe9_oU-AnDyeJBWZCMcdBYLqoTX6F70uFeBXtUlDlbOVBg3UaZ-LAL6Smv6iXjkRQxKK5hliIBG3yogB7E4yqmA0xP17EAb8IoLHKF0dfiEio9PIgDHc-xEwn95EBjZXgpgkLyadDS81fFAc5DGK75YmMEq8Ttk4YN6kTAG1i_Va51SPX22_tIOHur6S0QWdVppABwQ85vIqCM7JXP4u9cc0eimAGyTegrmtGk7KZjmxgMiQL7RIE-ACGMu0vwVf1zwR6Q67qn0dXC5tcDymcaqQZfIPctIeG9PEVUpd09bwcjLbANyjGczR5rMTaUotevgF5WU76bMIilIUsM4djGbfi3OsButpuhuBGb_VrMRZ0ZQe5IY_JaL9BA53KlSfD5p3tnmzuDl0GcndAJtdmPxO_YLpztMZyH14tw4k8uk6V7cC3uNdgUVW_6OKDx_2aJTExkE3f-egZ0xZnupYPOq9mvH8F7iujOutaGY08SO0Epc8dYESZAlcb0VyTYcVWhyijWcJZZbW3ONvlWAhKbGgDL0fKiXsiYtqE7OJlW8JHEo2mNN3-4YYWbM06lppJ8keCAt-WfY=w127-h38-no\" class=\"CToWUd\"> \r\n"
						+ "						</a>\r\n" + "					</div>\r\n"
						+ "					<div style=\"float:left;width:350px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333;margin-top:10px\">\r\n"
						+ "						<div style=\"font-size:14px;font-weight:bold;color:#000000\">Hola "
						+ usuario.getNombres() + ",</div>\r\n"
						+ "						<div style=\"float:left;font-size:14px;color:#666666\">Por favor, confirma tu <span class=\"il\">cuenta</span> de SWAAAD</div>\r\n"
						+ "					</div>\r\n" + "				</div>\r\n"
						+ "				<div style=\"padding-left:50px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;background-color:#fff;border-top-color:#ddd;border-top-style:solid;border-top-width:1px\">\r\n"
						+ "					<div style=\"font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333;padding-top:15px;padding-bottom:15px;text-align:justify;padding-right:30px;font-size:15px;line-height:20px\">\r\n"
						+ "						Confirmar tu <span class=\"il\">cuenta</span> te dará <strong>acceso completo a SWAAAD</strong>, formarás parte de la red de sistema educativo Online.\r\n"
						+ "					</div>\r\n"
						+ "					<div style=\"padding-left:20px;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333\">\r\n"
						+ "						<div style=\"white-space:nowrap;background-color:#108a6c;border-radius:5px;border:1px solid #078956;padding:5px 0 5px 0;text-align:center;width:220px\">\r\n"
						+ "							<div style=\"color:#ffffff;font-size:13px;font-weight:bold;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;white-space:nowrap;padding-left:30px;padding-right:30px\">\r\n"
						+ "								<span>\r\n"
						+ "									<a style=\"border:none;color:#0084b4;text-decoration:none;color:#ffffff;font-size:13px;font-weight:bold;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif\" href=\""
						+ ruta_confirmacion + "\" target=\"_blank\" data-saferedirecturl=\"" + ruta_confirmacion
						+ "&amp;source=gmail&amp;ust=1510067115589000&amp;usg=AFQjCNGgMBnZqhCdSxdFu3LLnaeJH6syvw\">Confirma tu <span class=\"il\">cuenta</span> ahora\r\n"
						+ "									</a>\r\n" + "								</span>\r\n"
						+ "							</div>\r\n" + "						</div>\r\n"
						+ "					</div>\r\n"
						+ "					<div style=\"font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;color:#333333;padding-bottom:15px;padding-top:15px;padding-right:30px;text-align:justify;font-size:13px;line-height:20px\">\r\n"
						+ "						Si haces clic en el boton y parece que no funciona, cópialo y pégalo en una nueva ventana de tu navegador el siguiente enlace:<br> <a style=\"word-wrap:break-word;border:none;color:#129856;text-decoration:none;font-size:14px\" href=\""
						+ ruta_confirmacion
						+ "\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?hl=es-419&amp;q="
						+ ruta_confirmacion
						+ "&amp;source=gmail&amp;ust=1510067115590000&amp;usg=AFQjCNG98RKO1o-qPP1a6NKLwuEa7TpSVQ\">"
						+ ruta_confirmacion + "</a>\r\n" + "					</div>\r\n" + "				</div>\r\n"
						+ "\r\n" + "			</div>\r\n" + "\r\n" + "		</div>\r\n" + "\r\n" + "	</div>",
						"ISO-8859-1", "html");

				// Enviamos el correo
				Transport.send(mensaje);
			} catch (Exception e) {
				throw new RuntimeException(e);
			}

			return true;
		}

	}

	@Override
	public Usuario getUsuarioById(int idUsiario) throws Exception {
		return objUsuarioDao.getUsuarioById(idUsiario);
	}

	@Override
	public void habilitarUsuario(Usuario usuario) throws Exception {

		objUsuarioDao.habilitarUsuario(usuario);
	}

	@Override
	public void CambiarPassword(Usuario usuario) throws Exception {

		objUsuarioDao.CambiarPassword(usuario);
	}

	@Override
	public Usuario getUsuarioByEmail(String email) throws Exception {
		return objUsuarioDao.verificarEmail(email);

	}

}
