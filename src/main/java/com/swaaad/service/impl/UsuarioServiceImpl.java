package com.swaaad.service.impl;


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
	public Boolean registrarUsuario(RegistroDTO usuario) throws Exception {
		
		//verificar
		if(objUsuarioDao.verificarEmail(usuario.getEmail())!=null) {
			return false;
		}
		else {
			//registrara
			BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
//			System.out.println(pe.encode("admin"));
									
			Usuario _usuario=new Usuario();
			
			_usuario.setUsername(usuario.getEmail());
			_usuario.setPassword(pe.encode(usuario.getPassword()));
			_usuario.setEnabled((byte) 1);
			_usuario.setRole("ROLE_ADMIN");
			
			Usuario newUsuario=objUsuarioDao.addUsuario(_usuario);
			
			Docente docente= new Docente();
			
			
			docente.setApellidos(usuario.getApellidos());
			docente.setEmail(usuario.getEmail());
			docente.setGenero(usuario.getOptradio());
			docente.setNombre(usuario.getNombres());
			
			docente.setUsuario(newUsuario);
			
			objDocenteServiceImpl.addDocente(docente);
			
			return true;
		}
		

	}

}
