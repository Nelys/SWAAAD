package com.swaaad.dto;

public class RegistroDTO {

	public String nombres;
	public String apellidos;
	public String optradio;
	public String password;
	public String email;
	public RegistroDTO(String nombres, String apellidos, String optradio, String password, String email) {
		super();
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.optradio = optradio;
		this.password = password;
		this.email = email;
	}
	public RegistroDTO() {
		super();
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getOptradio() {
		return optradio;
	}
	public void setOptradio(String opradio) {
		this.optradio = opradio;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
