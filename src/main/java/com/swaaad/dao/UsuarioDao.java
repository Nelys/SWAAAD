package com.swaaad.dao;

import com.swaaad.model.Usuario;

public interface UsuarioDao {

	Usuario addUsuario(Usuario usuario) throws Exception;

	Usuario verificarEmail(String email) throws Exception;

	Usuario getUsuarioById(int id) throws Exception;
	
	void habilitarUsuario(Usuario usuario) throws Exception;
}
