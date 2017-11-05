package com.swaaad.service;

import com.swaaad.dto.RegistroDTO;
import com.swaaad.model.Usuario;


public interface UsuarioService {

	
	Boolean registrarUsuario(RegistroDTO usuario) throws Exception;
		
	Usuario getUsuarioById(int idUsiario) throws Exception;
}
