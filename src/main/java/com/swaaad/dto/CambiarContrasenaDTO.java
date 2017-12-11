package com.swaaad.dto;

public class CambiarContrasenaDTO {
	
	String password;
	String nuevoPassword;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNuevoPassword() {
		return nuevoPassword;
	}
	public void setNuevoPassword(String nuevoPassword) {
		this.nuevoPassword = nuevoPassword;
	}
	public CambiarContrasenaDTO(String password, String nuevoPassword) {
		super();
		this.password = password;
		this.nuevoPassword = nuevoPassword;
	}
	public CambiarContrasenaDTO() {
		super();
	}
	
	

}
