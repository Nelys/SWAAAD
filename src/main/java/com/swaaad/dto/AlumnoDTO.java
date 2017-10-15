package com.swaaad.dto;

public class AlumnoDTO {

	private int idAlumno;
	private String nombres;
	private String apellidos;
	public AlumnoDTO(int idAlumno, String apellidos, String nombres) {
		super();
		this.idAlumno = idAlumno;
		this.nombres = nombres;
		this.apellidos = apellidos;
	}
	
	public AlumnoDTO() {
		super();
	}

	public int getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(int idAlumno) {
		this.idAlumno = idAlumno;
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


	
	
	
}
