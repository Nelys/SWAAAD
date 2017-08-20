package com.swaaad.dto;

public class AlumnosDto {
	private int IdAlumno;
	private String Nombres;
	private String Apellidos;
	private Boolean Genero;
	private String Email;
	private String Contrasena;
	private int NumeroOrden;
	private String NombreApoderado;
	private String ApellidoApoderado;
	private String EmailApoderado;
	
	public AlumnosDto() {
		super();
	}

	public AlumnosDto(int idAlumno, String nombres, String apellidos, Boolean genero, String email, String contrasena,
			int numeroOrden, String nombreApoderado, String apellidoApoderado, String emailApoderado) {
		super();
		IdAlumno = idAlumno;
		Nombres = nombres;
		Apellidos = apellidos;
		Genero = genero;
		Email = email;
		Contrasena = contrasena;
		NumeroOrden = numeroOrden;
		NombreApoderado = nombreApoderado;
		ApellidoApoderado = apellidoApoderado;
		EmailApoderado = emailApoderado;
	}

	public int getIdAlumno() {
		return IdAlumno;
	}

	public void setIdAlumno(int idAlumno) {
		IdAlumno = idAlumno;
	}

	public String getNombres() {
		return Nombres;
	}

	public void setNombres(String nombres) {
		Nombres = nombres;
	}

	public String getApellidos() {
		return Apellidos;
	}

	public void setApellidos(String apellidos) {
		Apellidos = apellidos;
	}

	public Boolean getGenero() {
		return Genero;
	}

	public void setGenero(Boolean genero) {
		Genero = genero;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getContrasena() {
		return Contrasena;
	}

	public void setContrasena(String contrasena) {
		Contrasena = contrasena;
	}

	public int getNumeroOrden() {
		return NumeroOrden;
	}

	public void setNumeroOrden(int numeroOrden) {
		NumeroOrden = numeroOrden;
	}

	public String getNombreApoderado() {
		return NombreApoderado;
	}

	public void setNombreApoderado(String nombreApoderado) {
		NombreApoderado = nombreApoderado;
	}

	public String getApellidoApoderado() {
		return ApellidoApoderado;
	}

	public void setApellidoApoderado(String apellidoApoderado) {
		ApellidoApoderado = apellidoApoderado;
	}

	public String getEmailApoderado() {
		return EmailApoderado;
	}

	public void setEmailApoderado(String emailApoderado) {
		EmailApoderado = emailApoderado;
	}
	


}
