package com.swaaad.dto;

public class RecordatorioDTO {
	String titulo;
	String curso;
	String hora;
	
	public RecordatorioDTO() {
		super();
	}

	public RecordatorioDTO(String titulo, String curso, String hora) {
		super();
		this.titulo = titulo;
		this.curso = curso;
		this.hora = hora;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}
	
	

}
