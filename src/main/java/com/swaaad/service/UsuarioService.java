package com.swaaad.service;

import com.swaaad.dto.RegistroDTO;
import com.swaaad.model.Nota;
import com.swaaad.model.Usuario;

public interface UsuarioService {

	Boolean registrarUsuario(RegistroDTO usuario) throws Exception;

	Usuario getUsuarioById(int idUsiario) throws Exception;

	void habilitarUsuario(Usuario usuario) throws Exception;

	void CambiarPassword(Usuario Usuario) throws Exception;
	Boolean correoRecuperacion(Usuario usuario) throws Exception;
	
	Usuario getUsuarioByEmail(String email) throws Exception;
	
	  void updateUsuario(Usuario usuario) throws Exception;
}
