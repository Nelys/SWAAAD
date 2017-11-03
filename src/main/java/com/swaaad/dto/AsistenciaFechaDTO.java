package com.swaaad.dto;



public class AsistenciaFechaDTO {
	private int idAsistencia;
	private String estado;
	private String fecha;
	private int idCursoAlumno;
	
	
	public AsistenciaFechaDTO() {
		super();
	}
	
	public AsistenciaFechaDTO(String estado, String fecha, int idCursoAlumno) {
		super();
		this.estado = estado;
		this.fecha = fecha;
		this.idCursoAlumno = idCursoAlumno;
	}

	public AsistenciaFechaDTO(int idAsistencia, String estado, String fecha, int idCursoAlumno) {
		super();
		this.idAsistencia = idAsistencia;
		this.estado = estado;
		this.fecha = fecha;
		this.idCursoAlumno = idCursoAlumno;
	}
	public int getIdAsistencia() {
		return idAsistencia;
	}
	public void setIdAsistencia(int idAsistencia) {
		this.idAsistencia = idAsistencia;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getIdCursoAlumno() {
		return idCursoAlumno;
	}
	public void setIdCursoAlumno(int idCursoAlumno) {
		this.idCursoAlumno = idCursoAlumno;
	}

	
	
	
}
