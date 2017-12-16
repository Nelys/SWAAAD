package com.swaaad.dto;

public class HorarioCruceDTO {

	int id;
	String inicio;
	String fin;
	String curso;
	String dia;
	
	public HorarioCruceDTO() {
		super();
	}

	public HorarioCruceDTO(int id, String inicio, String fin, String curso, String dia) {
		super();
		this.id = id;
		this.inicio = inicio;
		this.fin = fin;
		this.curso = curso;
		this.dia = dia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInicio() {
		return inicio;
	}

	public void setInicio(String inicio) {
		this.inicio = inicio;
	}

	public String getFin() {
		return fin;
	}

	public void setFin(String fin) {
		this.fin = fin;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	
	
	
	
}
